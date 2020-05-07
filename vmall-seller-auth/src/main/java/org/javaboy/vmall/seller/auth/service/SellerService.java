package org.javaboy.vmall.seller.auth.service;

import org.javaboy.vmall.common.model.Seller;
import org.javaboy.vmall.seller.auth.mapper.SellerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 * @作者 江南一点雨
 * @微信公众号 江南一点雨
 * @网站 http://www.itboyhub.com
 * @国际站 http://www.javaboy.org
 * @微信 a_java_boy
 * @GitHub https://github.com/lenve
 * @Gitee https://gitee.com/lenve
 */
@Service
public class SellerService implements UserDetailsService {
    @Autowired
    SellerMapper sellerMapper;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Seller seller = sellerMapper.loadUserByUsername(username);
        if (seller == null) {
            throw new UsernameNotFoundException("用户不存在");
        }
        return seller;
    }
}
