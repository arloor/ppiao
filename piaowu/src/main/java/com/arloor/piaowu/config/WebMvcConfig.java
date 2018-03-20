package com.arloor.piaowu.config;

import org.springframework.context.annotation.Configuration;


import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;

import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;



/**
 * Created by yangyibo on 17/1/18.
 */
@Configuration

public class WebMvcConfig extends WebMvcConfigurerAdapter {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 多个拦截器组成一个拦截器链
        // addPathPatterns 用于添加拦截规则
        // excludePathPatterns 用户排除拦截
        registry.addInterceptor(new MyInterceptor()).addPathPatterns("/**");
        super.addInterceptors(registry);
    }

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/login").setViewName("login");
        registry.addViewController("/home").setViewName("home");
        registry.addViewController("/").setViewName("index");
        registry.addViewController("/index").setViewName("index");
        registry.addViewController("/hello").setViewName("hello");
        registry.addViewController("/signup").setViewName("signup");
        registry.addViewController("/venuessignup").setViewName("venuessignup");
        registry.addViewController("/newplan").setViewName("newplan");
        registry.addViewController("/template").setViewName("template");
        registry.addViewController("/buy").setViewName("buy");
        registry.addViewController("/cancelmember").setViewName("cancelmember");
        registry.addViewController("/modifymember").setViewName("modifymember");
        registry.addViewController("/ordermanage").setViewName("ordermanage");
        registry.addViewController("/refactorvenues").setViewName("refactorvenues");
        registry.addViewController("/atscenebuy").setViewName("atscenebuy");

    }

//    @Override
//    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
//        super.configureMessageConverters(converters);
//
//        FastJsonHttpMessageConverter fastConverter = new FastJsonHttpMessageConverter();
//
//        FastJsonConfig fastJsonConfig = new FastJsonConfig();
//        fastJsonConfig.setSerializerFeatures(
//                SerializerFeature.PrettyFormat
//        );
//        fastConverter.setFastJsonConfig(fastJsonConfig);
//
//        converters.add(fastConverter);
//    }
}
