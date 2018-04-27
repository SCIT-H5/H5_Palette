package com.palette.h5.ego.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.palette.h5.ego.dao.EgoDAO;
import com.palette.h5.ego.vo.History;

@Controller
@RequestMapping(value = "ego")
public class EgoController {

	private static final Logger logger = LoggerFactory.getLogger(EgoController.class);

	@Autowired
	EgoDAO dao;

	@RequestMapping(value = "certCertificateReadForm", method = RequestMethod.GET)
	public String test() {

		return "ego/certCertificateReadForm";
	}

	// history page로 이동 (userId는 session값으로 넣음)
	@RequestMapping(value = "history/historyReadForm", method = RequestMethod.GET)
	public String historyReadForm(Model model, HttpSession session) {
		String hisId = (String) session.getAttribute("loginId");

		ArrayList<History> hisAll = dao.historyDataAll(hisId);
		ArrayList<String> classplus = new ArrayList<>();
		classplus.add("is-hidden timeline-item");
		classplus.add("is-hidden timeline-item inverted");

		model.addAttribute("hisAll", hisAll);
		model.addAttribute("classname", classplus);

		System.out.println(hisAll);

		logger.info("CON | historyReadForm로 이동 종료 ");
		return "ego/history/historyReadForm";
	}

	// history WriteForm으로 이동
	@RequestMapping(value = "history/historyWriteForm", method = RequestMethod.GET)
	public String historyWriteForm(HttpSession session) {
		logger.info("CON | history 글쓰기 폼으로 이동 시작");
		String hisId = (String) session.getAttribute("loginId");

		session.setAttribute("hisId", hisId);
		logger.info("CON | history 글쓰기 폼으로 이동 종료");
		return "ego/history/historyWriteForm";
	}

	// history 데이터 등록
	@RequestMapping(value = "history/historyWrite", method = RequestMethod.POST)
	public String historyWrite(History history, Model model) {
		logger.info("CON | history 글쓰기 시작");
		System.out.println(history);

		// form에서 hidden타입으로 id 넣어줌 session여기서 안써도 ok

		int result = dao.historyAddOne(history);

		if (result != 1) {
			logger.info("등록 실패");
			return "ego/history/historyWriteForm";
		}

		logger.info("CON | history 글쓰기 종료");
		return "redirect:historyReadForm";
	}

	// history updateForm으로 이동
	@RequestMapping(value = "history/historyUpdateForm", method = RequestMethod.GET)
	public String historyUpdateForm(History history, HttpSession session, Model model) {
		// 여기서 매개변수 History history는 hisNo와 hisId를 제공
		logger.info("CON | history 수정 폼으로 이동 시작");
		System.out.println(history);

		int selecthisNo = history.getHisNo();

		System.out.println(selecthisNo);

		History selecthistory = dao.historyonselect(selecthisNo);

		System.out.println(selecthistory);

		String hisId = (String) session.getAttribute("loginId");
		session.setAttribute("userId", hisId);

		model.addAttribute("hisDate", selecthistory.getHisDate());
		model.addAttribute("hisTitle", selecthistory.getHisTitle());
		model.addAttribute("hisContent", selecthistory.getHisContent());
		model.addAttribute("hisPeriod", selecthistory.getHisPeriod());
		model.addAttribute("hisNo", selecthistory.getHisNo());

		logger.info("CON | history 수정 폼으로 이동 종료 ");
		return "ego/history/historyUpdateForm";
	}

	// history 수정
	@RequestMapping(value = "history/historyUpdate", method = RequestMethod.POST)
	public String historyUpdateOne(History history) {
		logger.info("CON | history 수정 시작");

		int result = 0;

		dao.historyUpdateOne(history);

		logger.info("CON | history 수정 종료 ");
		return "redirect:historyReadForm";
	}

	// history 삭제
	@RequestMapping(value = "history/historyDeleteOne", method = RequestMethod.GET)
	public String historyDelete(int hisNo, HttpSession session) {

		logger.info("CON | history 삭제 시작");

		String hisId = (String) session.getAttribute("loginId");
		History delHistory = new History();
		delHistory.setHisNo(hisNo);
		delHistory.setHisId(hisId);

		int result = dao.historyDeleteOne(delHistory);

		if (result != 1) {
			// 삭제 실패
			logger.info("글 삭제 실패");
			return "redirect:";
		}

		logger.info("CON | history 삭제 종료");
		return "redirect:historyReadForm";
	}

}