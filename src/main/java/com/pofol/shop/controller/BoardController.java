package com.pofol.shop.controller;

import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pofol.shop.domain.BoardDto;
import com.pofol.shop.domain.PageHandler;
import com.pofol.shop.domain.SearchCondition;
import com.pofol.shop.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	BoardService boardService;

	@PostMapping("/modify")
	public String modify(BoardDto boardDto, SearchCondition sc, RedirectAttributes rattr, Model m,
			HttpSession session) {
		String writer = (String) session.getAttribute("id");
		boardDto.setWriter(writer);

		try {
			int rowCnt = boardService.modify(boardDto);
			if (rowCnt != 1)
				throw new Exception("Modify failed");
			rattr.addFlashAttribute("msg", "MOD_OK");
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute(boardDto);
			m.addAttribute("msg", "MOD_ERR");
			return "board";
		}
		return "redirect:/board/list";
	}
	
	@PostMapping("/write")
	public String write(BoardDto boardDto, Model m, HttpSession session, RedirectAttributes rattr) {
		String writer = (String) session.getAttribute("id");
		boardDto.setWriter(writer);
		try {
			int rowCnt = boardService.write(boardDto);
			if (rowCnt != 1)
				throw new Exception("Write failed");
			rattr.addFlashAttribute("msg", "WRT_OK");
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute(boardDto);
			m.addAttribute("msg", "WRT_ERR");
			return "board";
		}
		return "redirect:/board/list";
	}

	@PostMapping("/remove")
	public String remove(Integer bno, Integer page, Integer pageSize, Model m, HttpSession session,
			RedirectAttributes rattr) {
		String writer = (String) session.getAttribute("id");
		try {
			int rowCnt = boardService.remove(bno, writer);
			m.addAttribute("page", page);
			m.addAttribute("pageSize", pageSize);
			if (rowCnt != 1)
				throw new Exception("board remove error");
			rattr.addFlashAttribute("msg", "DEL_OK");
		} catch (Exception e) {
			e.printStackTrace();
			rattr.addFlashAttribute("msg", "DEL_ERR");
		}
		return "redirect:/board/list";
	}
	
	@GetMapping("/write")
	public String write(SearchCondition sc, Model m) {
		m.addAttribute("mode", "new");
		try {
			int totalCnt = boardService.getSearchResultCnt(sc);
			m.addAttribute("totalCnt", Integer.valueOf(totalCnt));
			PageHandler pageHandler = new PageHandler(totalCnt, sc);
			m.addAttribute("ph", pageHandler);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "board";
	}

	@GetMapping("/read")
	public String read(Integer bno, SearchCondition sc, RedirectAttributes rattr, Model m) {
		try {
			BoardDto boardDto = boardService.read(bno);
			m.addAttribute(boardDto);
			int totalCnt = boardService.getSearchResultCnt(sc);
			m.addAttribute("totalCnt", Integer.valueOf(totalCnt));
			PageHandler pageHandler = new PageHandler(totalCnt, sc);
			m.addAttribute("ph", pageHandler);
		} catch (Exception e) {
			e.printStackTrace();
			rattr.addFlashAttribute("msg", "READ_ERR");
			return "redirect:/board/list" + sc.getQueryString();
		}

		return "board";
	}

	@GetMapping("/list")
	public String list(Model m, SearchCondition sc, HttpServletRequest request) throws Exception {
		if (!loginCheck(request))
			return "redirect:/login/login?toURL=" + request.getRequestURL(); // 로그인을 안했으면 로그인 화면으로 이동

		int totalCnt;
		totalCnt = boardService.getSearchResultCnt(sc);
		m.addAttribute("totalCnt", Integer.valueOf(totalCnt));
		PageHandler pageHandler = new PageHandler(totalCnt, sc);
		m.addAttribute("ph", pageHandler);
		if (totalCnt == 0)
			return "boardList";
		try {
			java.util.List lsit = boardService.getSearchResultPage(sc);
			m.addAttribute("list", lsit);
			Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
			m.addAttribute("startOfToday", Long.valueOf(startOfToday.toEpochMilli()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "boardList";
	}

	private boolean loginCheck(HttpServletRequest request) {
		// 1. 세션을 얻어서(false는 session이 없어도 새로 생성하지 않는다. 반환값 null)
		HttpSession session = request.getSession(false);
		// 2. 세션에 id가 있는지 확인, 있으면 true를 반환
		return session != null && session.getAttribute("id") != null;
	}
}
