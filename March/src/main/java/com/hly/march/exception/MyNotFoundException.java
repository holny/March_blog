package com.hly.march.exception;

public class MyNotFoundException  extends SysException{

    public MyNotFoundException(String msg) {
        super("无此资源:"+msg);
    }
}
