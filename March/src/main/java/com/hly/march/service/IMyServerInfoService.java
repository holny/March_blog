package com.hly.march.service;

import com.hly.march.entity.MyServerInfo;

import java.util.List;

public interface IMyServerInfoService {
    List<MyServerInfo> getLatestRecord();

    Integer insertNewRecord(MyServerInfo myServerInfo);

    Integer updateRecord(MyServerInfo myServerInfo);

    Integer finalUpdateRecord(MyServerInfo myServerInfo);

    Integer periodUpdateRecord(MyServerInfo myServerInfo);
}
