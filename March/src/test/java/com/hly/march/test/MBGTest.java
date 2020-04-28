package com.hly.march.test;

import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.internal.DefaultShellCallback;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class MBGTest {
    public static void main(String[] args) throws Exception {
//        mybatisGene();
    }

    private static void mybatisGene() throws Exception {
        // 如果mbg.xml提示 no such file，注意idea的启动路径是不是在module下，在启动配置里配置working directory:$MODULE_WORKING_DIR$
        File file=new File("test_useless.properties");
        System.out.println(file.getAbsolutePath());
        System.out.println(System.getProperty("user.dir"));
        List<String> warnings = new ArrayList<String>();
        boolean overwrite = true;
        File configFile = new File("mbg.xml");
        ConfigurationParser cp = new ConfigurationParser(warnings);
        Configuration config = cp.parseConfiguration(configFile);
        DefaultShellCallback callback = new DefaultShellCallback(overwrite);
        MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
        myBatisGenerator.generate(null);
    }
}
