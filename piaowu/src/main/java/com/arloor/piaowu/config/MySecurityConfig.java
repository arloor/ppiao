package com.arloor.piaowu.config;

import com.arloor.piaowu.security.CustomerUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class MySecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    CustomerUserService userDetails;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetails);
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/api/**"); //暂时去除api访问的限制;
        web.ignoring().antMatchers("/404.html");
        web.ignoring().antMatchers("/error");

        //忽略bootsstrap静态资源
        web.ignoring().antMatchers("/bootstrap/**");
        web.ignoring().antMatchers("/image/**");
//        以下是忽略由npm run build生成的静态资源
//        web.ignoring().antMatchers("/static/**");
//        web.ignoring().antMatchers("/asset-manifest.json");
//        web.ignoring().antMatchers("/favicon.ico");
//        web.ignoring().antMatchers("/manifest.json");
//        web.ignoring().antMatchers("/service-worker.js");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable();
        http.headers().frameOptions().disable();
        http.authorizeRequests()
                .antMatchers("/", "/home","/signup","/venuessignup").permitAll()
                .antMatchers("/a").hasRole("MEMBER")
                .antMatchers("/newplan").hasRole("VENUES")
//                .antMatchers("/a").permitAll()
                .anyRequest().authenticated() //任何请求,登录后可以访问
                .and()
                .formLogin()
                .loginPage("/login")
                .permitAll()
                .failureUrl("/login?error")
                .permitAll() //登录页面用户任意访问
                .and()
                .logout().permitAll(); //注销行为任意访问;
    }
}
