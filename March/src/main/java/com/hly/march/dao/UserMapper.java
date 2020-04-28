package com.hly.march.dao;

import com.hly.march.entity.BlogExample;
import com.hly.march.entity.User;
import com.hly.march.entity.UserExample;
import com.hly.march.vo.UserBriefStatisticsVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    long countByExample(UserExample example);

    int deleteByExample(UserExample example);

    int deleteByPrimaryKey(Long userId);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectByExample(UserExample example);

    User selectByPrimaryKey(Long userId);

    int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example);

    int updateByExample(@Param("record") User record, @Param("example") UserExample example);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    List<UserBriefStatisticsVO> countSumUserBlogByBlogExample(BlogExample example);

    List<User> selectMostColumnByExample(UserExample example);
}