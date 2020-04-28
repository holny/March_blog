//package com.hly.march.test;
//
//
//import com.hly.march.utils.GeneArticles;
//import com.hly.march.utils.RandomUserGenerator;
//import org.apache.ibatis.session.SqlSession;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//import java.util.List;
//import java.util.Random;
//
///**
// * 测试dao层
// * // 1.创建Spring IOC容器
// * // ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
// * // 2.从容器中获取mapper
// * // ioc.getBean(DepartmentMapper.class);
// * 用Spring的单元测试就可以自动注入我们需要的组件，不需要上面两步。
// *
// * 用Spring-test进行测试
// * 1. 导入spring-test jar，注意如果scope=test，那测试代码文件只能在/src/test/java/目录下（junit也是）
// * 2. @ContextConfiguration(locations = {"classpath:applicationContext.xml"})
// * 3. 利用Junit提供的@RunWith来指定单元测试模块为SpringJUnit4ClassRunner.class
// * 4. 直接autowired要使用的组件即可
// */
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
//public class MapperTest {
//
////    @Autowired
////    ArticleMapper article;
////
////    @Autowired
////    UserMapper userMapper;
//
//    @Autowired
//    SqlSession sqlSession;
//
//
//    @Test
//    public void generateDataArticles() throws Exception {
//        ArticleMapper mapper = sqlSession.getMapper(ArticleMapper.class);
//        for(int i=0;i<10;i++){
//            List<Article> list = GeneArticles.geneArticle(10);
//            for(int j=0;j<list.size();j++){
//                mapper.insertSelective(list.get(j));
//            }
//            System.out.println("i="+i);
//        }
//        System.out.println("插入完毕！");
//
//    }
//
//    @Test
//    public void testCRUD(){
////        // 1.创建Spring IOC容器
////        ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
////        // 2.从容器中获取mapper
////        ioc.getBean(DepartmentMapper.class);
//        // 运用Spring的单元测试就可以自动注入我们需要的组件，不需要上面两步。
////        departmentMapper.insertSelective(new Department(null,"营销部",null,"长发公司",new Date()));
//
////        userMapper.insertSelective(new User(null,"张飞","健康路",29,new Date(),new Date(),"男",3));
//
//        // 批量生成数据(需要在spring.xml配置文件中配置批量sqlSession的bean)
//        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
//        for(int i =0;i<100;i++){
//            Random r = new Random();
//
//            int sex_r = r.nextInt(10);
//            String sex = sex_r>5?"男":"女";
//            String username = RandomUserGenerator.getChineseName(sex);
//            String address = RandomUserGenerator.getRoad();
//            int age = r.nextInt(50)+18;
//            int depart_id = r.nextInt(7);  // 这里默认有7个部门
//
////            mapper.insertSelective(new User(null,username,address,age,new Date(),new Date(),sex,depart_id));
//        }
//        System.out.println("批量生成完成");
//
//    }
//}
