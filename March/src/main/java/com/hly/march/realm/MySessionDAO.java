package com.hly.march.realm;

import com.hly.march.entity.Sessions;
import com.hly.march.service.ISessionsService;
import com.hly.march.utils.SessionSerializableUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.SimpleSession;
import org.apache.shiro.session.mgt.ValidatingSession;
import org.apache.shiro.session.mgt.eis.EnterpriseCacheSessionDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.Serializable;

/**
 * Shiro Session的持久化部分，一般是redis，这里用mysql代替。
 *
 * 问题，用户登录 doUpdate session序列化出错oos.writeObject(session);不登录update都没问题，create也没问题。
 * 网上了解怀疑是shiro给这个session加了头尾，所以序列化出错。
 * 网上类似问题redis的，他们可以给 JdkSerializationRedisSerializer 指定 key 的序列化方式，即指定 String 和 Hash 的序列化方式。
 * 这个问题在我给我定义的数据库entity Sessions implements Serializable 后解决，目前没问题出现。
 */
public class MySessionDAO extends EnterpriseCacheSessionDAO {
    private static final Logger log = LoggerFactory.getLogger(MySessionDAO.class);
    @Autowired
    private ISessionsService sessionsService;

    @Override
    protected Serializable doCreate(Session session) {
        Serializable sessionId = generateSessionId(session);
        assignSessionId(session,sessionId);
        log.debug("session.getId:{}",session.getId().toString());
        log.debug("Serializable sessionid:{}",sessionId);
        int result = this.sessionsService.insertSession(new Sessions(session.getId().toString(), SessionSerializableUtils.serialize(session)));
        if(result>=1){
            log.debug("doCreate success session.getId:{}",session.getId().toString());
        }
        return session.getId();
    }

    @Override
    protected Session doReadSession(Serializable sessionId) {
        log.debug("Serializable sessionId:{}",sessionId);
        Sessions session = this.sessionsService.findSessionById(sessionId.toString());
        if(session==null){
            return null;
        }
        log.debug("doReadSession success session.getId:{}",session.getId().toString());
        return SessionSerializableUtils.deserialize(session.getSession());
    }

    @Override
    protected void doUpdate(Session session) {
        if(session instanceof ValidatingSession && !((ValidatingSession)session).isValid()){
            return;
        }
        SimpleSession session1 = (SimpleSession)session;
        log.debug("session.getId:{}",session.getId().toString());
        int result = this.sessionsService.updateSessionById(new Sessions(session.getId().toString(),SessionSerializableUtils.serialize(session)));
        if(result>=1){
            log.debug("doUpdate success session.getId:{}",session.getId().toString());
        }
    }

    @Override
    protected void doDelete(Session session) {
        log.debug("session.getId:{}",session.getId().toString());
        int result = this.sessionsService.deleteSessionById(session.getId().toString());
        if(result>=1){
            log.debug("doDelete success session.getId:{}",session.getId().toString());
        }
    }
}
