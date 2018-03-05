package com.arloor.piaowu.service;

import com.arloor.piaowu.dao.MembersDao;
import com.arloor.piaowu.domain.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.MailMessage;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MemberController {
    @Autowired
    private MembersDao membersDao;
    @Autowired
    JavaMailSender mailSender;
    @RequestMapping("/api/a")
    public Member search(String uname){
        Member member=membersDao.searchByUname("arloor");
        SimpleMailMessage msg=new SimpleMailMessage();
        msg.setFrom("18762832143@163.com");
        msg.setSubject("测试发送邮件——");
        msg.setTo(member.getEmail());
        msg.setText(member.getUname()+" "+member.getEmail());
        try{
            this.mailSender.send(msg);
        }
        catch (MailException ex) {
            // simply log it and go on...
            System.err.println(ex.getMessage());
        }
        return membersDao.searchByUname("arloor");
    }
    @RequestMapping("/a")
    public Member searcha(String uname){
        return membersDao.searchByUname("arloor");
    }


}
