package com.arloor.piaowu.security;


import com.arloor.piaowu.dao.MembersDao;
import com.arloor.piaowu.dao.VenuesDao;
import com.arloor.piaowu.domain.Member;
import com.arloor.piaowu.domain.Venues;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.ArrayList;
import java.util.List;

@Configuration
public class CustomerUserService implements UserDetailsService {
    @Bean
    public CustomerUserService userDetails(){
        return new CustomerUserService();
    }

    @Autowired
    MembersDao membersDao;
    @Autowired
    VenuesDao venuesDao;

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        Member member=membersDao.searchByUname(s);
        if(member!=null){
            List<SimpleGrantedAuthority> authorities = new ArrayList<>();
            authorities.add(new SimpleGrantedAuthority(member.getRole()));
            User user=new User(member.getUname(),"{noop}"+member.getPasswd(),authorities);
            return user;
        }
        Venues venues=venuesDao.searchVenuesByVid(Integer.parseInt(s));
        if(venues!=null){
            List<SimpleGrantedAuthority> authorities = new ArrayList<>();
            authorities.add(new SimpleGrantedAuthority(venues.getRole()));
            User user=new User(venues.getVname(),"{noop}"+venues.getVpasswd(),authorities);
            return user;
        }

        return null;

    }
}
