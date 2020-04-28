package com.hly.march.utils;

import org.apache.shiro.session.Session;

import java.io.*;
import java.util.Base64;

/**
 * 序列化与反序列化工具
 */
public class SessionSerializableUtils {

    public static String serialize(Session session){

        try {
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            ObjectOutputStream oos = new ObjectOutputStream(bos);

            oos.writeObject(session);
            return Base64.getEncoder().encodeToString(bos.toByteArray());
        } catch (Exception e) {
            throw new RuntimeException("serialize session error ",e);
        }
    }

    public static Session deserialize(String sessionStr){
        try{
            ByteArrayInputStream bis = new ByteArrayInputStream(Base64.getDecoder().decode(sessionStr));
            ObjectInputStream ois = new ObjectInputStream(bis);
            return (Session) ois.readObject();
        }catch (Exception e){
            throw new RuntimeException("deserialize session error ",e);
        }
    }


}
