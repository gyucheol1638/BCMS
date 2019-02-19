package net.su.login.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.su.login.dao.HomeDao;

@Service
public class HomeServiceImpl implements HomeService {
	
	@Resource
	private HomeDao homeDao;

	
}
