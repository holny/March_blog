package com.hly.march.service;

import com.hly.march.entity.Sessions;

public interface ISessionsService {

    int insertSession(Sessions session);
    Sessions findSessionById(String id);
    int updateSessionById(Sessions session);
    int deleteSessionById(String id);
}
