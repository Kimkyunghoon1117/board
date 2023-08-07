package com.pofol.shop.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pofol.shop.UserValidator;
import com.pofol.shop.dao.UserDao;
import com.pofol.shop.domain.User;

@Controller // ctrl+shift+o 자동 import
@RequestMapping("/register")
public class RegisterController {
	@Autowired
    	UserDao userDao;
	private static final int FAIL = 0;
	
	@InitBinder
	public void toDate(WebDataBinder binder) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(df, false));
		binder.setValidator(new UserValidator()); // UserValidator를 WebDataBinder의 로컬 validator로 등록 
	//	List<Validator> validatorList = binder.getValidators();
	//	System.out.println("validatorList="+validatorList);
	}

	@GetMapping("/add")
	public String register() {
		return "registerForm"; // WEB-INF/views/registerForm.jsp
	}
	
	@PostMapping("/add")
	public String save(@Valid User user, BindingResult result, Model m) throws Exception {
        System.out.println((new StringBuilder("result=")).append(result).toString());
        System.out.println((new StringBuilder("user=")).append(user).toString());
        if(!result.hasErrors())
        {
            int rowCnt = userDao.insertUser(user);
            if(rowCnt != 0)
                return "registerInfo";
        }
        return "registerForm";
    }

	private boolean isValid(User user) {
		return true;
	}
}
