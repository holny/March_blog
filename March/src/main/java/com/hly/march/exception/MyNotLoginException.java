package com.hly.march.exception;

public class MyNotLoginException extends SysException {
    public MyNotLoginException(String msg) {
        super("请先登录:"+msg);
    }
}
