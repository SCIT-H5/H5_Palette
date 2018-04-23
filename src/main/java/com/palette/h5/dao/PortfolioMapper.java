package com.palette.h5.dao;

import com.palette.h5.vo.Portfolio;

public interface PortfolioMapper {
	public int portSave(Portfolio portfolio);
	public Portfolio portSelectOne(Portfolio portfolio);
}
