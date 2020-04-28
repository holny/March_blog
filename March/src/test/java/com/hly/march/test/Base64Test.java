package com.hly.march.test;


import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * 测试dao层
 * // 1.创建Spring IOC容器
 * // ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
 * // 2.从容器中获取mapper
 * // ioc.getBean(DepartmentMapper.class);
 * 用Spring的单元测试就可以自动注入我们需要的组件，不需要上面两步。
 *
 * 用Spring-test进行测试
 * 1. 导入spring-test jar，注意如果scope=test，那测试代码文件只能在/src/test/java/目录下（junit也是）
 * 2. @ContextConfiguration(locations = {"classpath:applicationContext.xml"})
 * 3. 利用Junit提供的@RunWith来指定单元测试模块为SpringJUnit4ClassRunner.class
 * 4. 直接autowired要使用的组件即可
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class Base64Test {

//    @Autowired
//    ArticleMapper article;
//
//    @Autowired
//    UserMapper userMapper;

    @Autowired
    SqlSession sqlSession;


    @Test
    public void base64Test() throws Exception {
        //        for(int i=0;i<list.size();i++)
//        {
//            System.out.println("Base64  i="+i);
//            BriefArticle item = list.get(i);
////            String str1 = item.getArticleTitle();
////            String encode1 = Base64.encodeBase64String(str1.getBytes("UTF-8"));
//            item.setArticleTitle("安达市大");
////            String str2 = item.getArticleBriefIntroduction();
////            String encode2 = Base64.encodeBase64String(str2.getBytes("UTF-8"));
//            item.setArticleBriefIntroduction("奥术大师多");
//            list.set(i,item);
//        }


    }

}
