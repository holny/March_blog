package com.hly.march.service;

import com.hly.march.dto.BlogSearchDTO;
import com.hly.march.entity.*;
import com.hly.march.vo.BlogStatisticsVO;
import com.hly.march.vo.BlogUserVo;
import com.hly.march.vo.HomeSummaryVO;

import java.util.List;

public interface IBlogService {

    List<BlogUserVo> getLatestBlogUserByStatusAndLimit(List<Integer> statusList,Integer limit);

    List<BlogUserVo> getMostHotBlogUserByStatusAndLimit(List<Integer> statusList,Integer limit);

    List<BlogUserVo> getBlogUserByBlogIdAndStatusWithBLOBs(Long blogId,List<Integer> statusList);

    BlogUserVo getBlogUserByBlogIdWithBLOBs(Long blogId);

    List<BlogUserVo> getBlogUserByUserId(Long userId);

    List<Blog> getBlogByBlogIdAndUserIdWithBLOBs(Long blogId, Long userId);

    Blog getBlogByBlogIdWithBLOBs(Long blogId);

    List<Blog> getBlogByBlogId(Long blogId);

    List<Blog> getBlogByBlogIdAndUserId(Long blogId, Long userId);

    int updateByPrimaryKey(Blog blog);

    int insertBlog(Blog blog);

    int deleteByPrimaryKey(Long blogId);

    BlogStatisticsVO getUserSUMByUserId(Long userId);

    Msg updateBlogWithCheck(Blog blog);

    Msg insertBlogWithCheck(Blog blog);

    List<BlogUserVo> getBlogUserBySearch(BlogSearchDTO blogSearchDTO);

    HomeSummaryVO getCountBlogByStatus(List<Integer> statusList);

    List<BlogUserVo>  getBlogSeriesTypeByUserIdAndSql(Long userId,List<Integer> statusList,String sql);

    Integer updateBatchBlogByBlogId(List<Blog> blogList);

    Long updateSqlBatchBlogByBlogId(List<Blog> blogList);

    Integer updateSeriesIdByUserIdAndSeriesId(Blog blog,Long userId,Long seriesId);

    Integer updateSeriesIdBySeriesId(Blog blog,Long seriesId);

}
