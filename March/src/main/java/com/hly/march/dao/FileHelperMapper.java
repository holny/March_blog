package com.hly.march.dao;

import com.hly.march.entity.FileHelper;
import com.hly.march.entity.FileHelperExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FileHelperMapper {
    long countByExample(FileHelperExample example);

    int deleteByExample(FileHelperExample example);

    int deleteByPrimaryKey(Long fileId);

    int insert(FileHelper record);

    int insertSelective(FileHelper record);

    List<FileHelper> selectByExampleWithBLOBs(FileHelperExample example);

    List<FileHelper> selectByExample(FileHelperExample example);

    FileHelper selectByPrimaryKey(Long fileId);

    int updateByExampleSelective(@Param("record") FileHelper record, @Param("example") FileHelperExample example);

    int updateByExampleWithBLOBs(@Param("record") FileHelper record, @Param("example") FileHelperExample example);

    int updateByExample(@Param("record") FileHelper record, @Param("example") FileHelperExample example);

    int updateByPrimaryKeySelective(FileHelper record);

    int updateByPrimaryKeyWithBLOBs(FileHelper record);

    int updateByPrimaryKey(FileHelper record);
}