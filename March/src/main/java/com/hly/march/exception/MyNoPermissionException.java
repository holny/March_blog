package com.hly.march.exception;

public class MyNoPermissionException extends SysException {

    public MyNoPermissionException(String msg) {
        super("无此权限:"+msg);
    }
}
