package com.pofol.shop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.pofol.shop.domain.CommentDto;
import com.pofol.shop.domain.PageHandler;
import com.pofol.shop.domain.SearchCondition;
import com.pofol.shop.service.CommentService;

@RestController
public class CommentController {
	@Autowired
	CommentService service;

	@PatchMapping("/comments/{cno}") // /ch4/comments/26 PATCH
	public ResponseEntity<String> modify(@PathVariable Integer cno, @RequestBody CommentDto dto, HttpSession session) {
		String commenter = (String) session.getAttribute("id");
		dto.setCommenter(commenter);
		dto.setCno(cno);
		System.out.println("dto = " + dto);
		try {
			if (service.modify(dto) != 1)
				throw new Exception("Write failed.");

			return new ResponseEntity<String>("MOD_OK", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("MOD_ERR", HttpStatus.BAD_REQUEST);
		}
	}

	@PostMapping("/comments") // /ch4/comments?bno=1085 POST
	public ResponseEntity<String> write(@RequestBody CommentDto dto, Integer bno, HttpSession session) {
		String commenter = (String) session.getAttribute("id");
		dto.setCommenter(commenter);
		dto.setBno(bno);
		System.out.println("dto = " + dto);
		try {
			if (service.write(dto) != 1)
				throw new Exception("Write failed.");

			return new ResponseEntity<String>("WRT_OK", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("WRT_ERR", HttpStatus.BAD_REQUEST);
		}
	}

	@DeleteMapping("/comments/{cno}") // DELETE /comments/1?bno=1085 <-- 삭제할 댓글 번호
	public ResponseEntity<String> remove(@PathVariable Integer cno, Integer bno, HttpSession session) {
		String commenter = (String) session.getAttribute("id");
		try {
			int rowCnt = service.remove(cno, bno, commenter);
			if (rowCnt != 1)
				throw new Exception("Delete Failed");

			return new ResponseEntity<String>("DEL_OK", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("DEL_ERR", HttpStatus.BAD_REQUEST);
		}
	}

	@GetMapping("/comments") // /comments?bno=1080 GET
	public ResponseEntity list(Integer bno, Integer page) throws Exception {
		List<CommentDto> list = null;
		int cTotalCnt;
		SearchCondition sc;
		cTotalCnt = service.getCount(bno);
		sc = null;
		if (page.intValue() == 0)
			sc = new SearchCondition(Integer.valueOf(cTotalCnt / 5 + (cTotalCnt % 5 == 0 ? 0 : 1)), Integer.valueOf(5));
		else
			sc = new SearchCondition(page, Integer.valueOf(5));
		if (cTotalCnt == 0)
			return null;
		try {
			PageHandler pageHandler = new PageHandler(cTotalCnt, sc);
			list = service.getSearchList(bno, pageHandler.getSc());
			Map map = new HashMap();
			map.put("cPh", pageHandler);
			map.put("list", list);
			return new ResponseEntity(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity(HttpStatus.BAD_REQUEST);
		}
	}

	@GetMapping("/comments/{cno}")
	public ResponseEntity list2(@PathVariable Integer cno) {
		CommentDto commendDto = null;
		try {
			commendDto = service.read(cno);
			return new ResponseEntity(commendDto, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity(HttpStatus.BAD_REQUEST);
		}
	}
}
