package com.demo.controllers;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.demo.models.Login_Model;
import com.demo.pojo.User;



@Controller
public class Login_Controller {
	@RequestMapping(value="/login" , method=RequestMethod.GET)
	public ModelAndView loadloginpage(HttpServletResponse response,@CookieValue(value="hits",defaultValue="0") Long hits)
	{
		ModelAndView mav = new ModelAndView("login");
		//System.out.println("Login method has been called");
		hits++;
		
		Cookie cookie = new Cookie("hits", hits.toString());
		//cookie.setMaxAge(60);
		response.addCookie(cookie);
		User user = new User();
		mav.addObject("user", user);
		return mav;
	}
//	@RequestMapping(value="/login" , method=RequestMethod.GET)
//	public String loadloginpage()
//	{
//		//ModelAndView mav = new ModelAndView("login");
//		//System.out.println("Login method has been called");
//		return "login";
//	}
	
	@RequestMapping(value="/login" , method=RequestMethod.POST)
	public String do_login(HttpServletRequest req, Model md , HttpSession session, @Valid User user, BindingResult br)
	{
		try
		{
			//System.out.println(br.getAllErrors().size());
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			
			System.out.println("Username and pasword are : "+username +"  "+ password);
			
			if(br.getAllErrors().size() > 0){
				System.out.println("Server side validation takes place....");
			}
			else{
				Login_Model lm = new Login_Model();
				String message = lm.doHibernateLogin(username, password);
				if(message.equals("login success"))
				{
					session.setAttribute("username", username);
					return "redirect:/myprofile";
				}
				else
				{
					md.addAttribute("error_msg", message);
				}
				/*String message1 = lm.do_login_process(username, password);
				if(message1.equals("login success"))
				{
					session.setAttribute("username", username);
					return "redirect:/myprofile";
				}
				else
				{
					md.addAttribute("error_msg", message1);
				}*/
			}
			return "login";
		}
		catch(Exception e)
		{
			return "login";
		}
	}

}
