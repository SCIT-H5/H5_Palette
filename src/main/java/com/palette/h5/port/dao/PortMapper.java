package com.palette.h5.port.dao;

import com.palette.h5.vo.Portfolio;

public interface PortMapper {
	public int portSave(Portfolio portfolio);
	public Portfolio portSelectOne(Portfolio portfolio);
}
