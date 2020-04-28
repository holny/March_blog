//package com.hly.march.handler;
//
//import org.springframework.beans.BeansException;
//import org.springframework.beans.factory.config.BeanFactoryPostProcessor;
//import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
//import org.springframework.context.ApplicationContext;
//import org.springframework.context.ApplicationContextAware;
//import org.springframework.web.method.support.HandlerMethodArgumentResolver;
//import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter;
//
//import java.util.ArrayList;
//import java.util.Collections;
//import java.util.List;
//
//public class EmptyStringToNullProcessorRegistry implements ApplicationContextAware, BeanFactoryPostProcessor {
//
//    private ApplicationContext applicationContext;
//
//    @Override
//    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
//        this.applicationContext = applicationContext;
//    }
//
//    @Override
//    public void postProcessBeanFactory(ConfigurableListableBeanFactory beanFactory) throws BeansException {
//        System.out.println("EmptyStringToNullProcessorRegistry----postProcessBeanFactory");
//        RequestMappingHandlerAdapter requestMappingHandlerAdapter = applicationContext.getBean(RequestMappingHandlerAdapter.class);
//
//        List<HandlerMethodArgumentResolver> resolvers = requestMappingHandlerAdapter.getArgumentResolvers();
//
//
//        List<HandlerMethodArgumentResolver> newResolvers = new ArrayList<HandlerMethodArgumentResolver>();
//
//        for (HandlerMethodArgumentResolver resolver : resolvers) {
//            newResolvers.add(resolver);
//        }
//        EmptyStringToNullModelAttributeMethodProcessor processor = new EmptyStringToNullModelAttributeMethodProcessor(true);
//        processor.setApplicationContext(applicationContext);
//        newResolvers.add(0, processor);
//        requestMappingHandlerAdapter.setArgumentResolvers(Collections.unmodifiableList(newResolvers));
//    }
//}