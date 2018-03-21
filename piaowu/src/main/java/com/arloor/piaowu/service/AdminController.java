package com.arloor.piaowu.service;

import com.arloor.piaowu.model.TocheckVenues;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@RestController
@RequestMapping("/api/admin")
public class AdminController {
    @RequestMapping("/showtocheck")
    public List<TocheckVenues> showtocheck(){
        return null;
        //todo:这个显示待审核的场馆信息
    }
}
