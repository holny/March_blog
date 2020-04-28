//package com.hly.march.handler;
//
//import org.springframework.beans.MutablePropertyValues;
//import org.springframework.beans.PropertyValue;
//import org.springframework.web.servlet.mvc.method.annotation.ExtendedServletRequestDataBinder;
//
//import javax.servlet.ServletRequest;
//
//public class EmptyStringToNullRequestDataBinder extends ExtendedServletRequestDataBinder {
//    public EmptyStringToNullRequestDataBinder(Object target, String objectName) {
//        super(target, objectName);
//    }
//
//    protected void addBindValues(MutablePropertyValues mpvs, ServletRequest request) {
//        super.addBindValues(mpvs, request);
//        System.out.println("EmptyStringToNullRequestDataBinder----addBindValues");
//        for (PropertyValue propertyValue : mpvs.getPropertyValueList()) {
//            if(propertyValue!=null){
//                System.out.println("EmptyStringToNullRequestDataBinder----addBindValues---propertyValue"+propertyValue);
//            }
//            if (propertyValue.getValue().equals(""))
//                System.out.println("EmptyStringToNullRequestDataBinder----addBindValues- equal '' --propertyValue"+propertyValue);
//                propertyValue.setConvertedValue(null);
//        }
//    }
//}