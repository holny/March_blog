package com.hly.march.converter;


import org.springframework.core.convert.converter.Converter;

public class EmptyStringToNullConverter implements Converter<String, String> {
    /**
     * 是spring提供的convert。可以转换数据。
     * 需要在springmvc.xml配置文件中配置。具体配置见springmvc.xml。
     * 不过本项目暂时注释掉了，
     * @param s
     * @return
     */
    @Override
    public String convert(String s) {
        if(s!=null){
            System.out.println("EmptyStringToNullConverter----s="+s);
        }else{
            System.out.println("EmptyStringToNullConverter----s=null");
        }
        if(s!=null&&("".equals(s.trim())||"null".equals(s.trim()))){
            return null;
        }else{
            return s;
        }
    }
}
