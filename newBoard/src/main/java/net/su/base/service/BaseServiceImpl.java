package net.su.base.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.su.base.dao.BaseDataAccessObject;

@Service
public class BaseServiceImpl implements BaseService {
	
	@Resource
	private BaseDataAccessObject baseDao;
	
}
