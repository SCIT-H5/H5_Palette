package com.palette.h5.port.dao;

import java.util.ArrayList;

import com.palette.h5.vo.Portfolio;

public interface PortMapper {
	public int portSave(Portfolio portfolio);
	public int portUpdate(Portfolio portfolio);
	public ArrayList<Portfolio> portList(String portId);
	public Portfolio portSelectOne(Portfolio portfolio);
}
