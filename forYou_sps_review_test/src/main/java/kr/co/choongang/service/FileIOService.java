package kr.co.choongang.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

public interface FileIOService {
	public String saveMultiPartsFileOne(HttpServletRequest request) throws IOException;
}
