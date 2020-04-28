package com.hly.march.test;

import com.github.pagehelper.PageInfo;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

/**
 * 使用Spring-test的测试请求功能来测试crud
 * 注意这里spring测试需要javax.servlet-api
 */

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:springmvc.xml"})
public class MVCTest {
    // 传入Springmvc的ioc
    // 一般只能Autowired IOC容器里面的，IOC容器自己Autowired需要@WebAppConfiguration
    @Autowired
    WebApplicationContext context;
    // 虚拟MVC请求，获取到处理结果
    MockMvc mockMvc;

    // 是junit的before
    @Before
    public void initMockMvc(){
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testPage() throws Exception {
        // 模拟get请求，拿到返回值
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/user/findall")
                .param("pn","1")).andReturn();
        // 请求成功后，请求域中会有pageInfo(controller接收到查询请求返回的)，
        MockHttpServletRequest request = result.getRequest();
        PageInfo page = (PageInfo) request.getAttribute("pageInfo");

        // 获取分页信息
        System.out.println("当前页码："+page.getPageNum());
        System.out.println("总页码："+page.getPages());
        System.out.println("总记录数："+page.getTotal());
        System.out.println("在页面连续显示的页码：");
        int[] nums = page.getNavigatepageNums();
        for(int i:nums){
            System.out.println(" "+i);
        }
        // 获取员工数据
//        List<User> list = page.getList();
//        for(User user:list){
//            System.out.println("==ID: "+user.getId()+" Name:"+user.getUsername());
//        }

    }
}
