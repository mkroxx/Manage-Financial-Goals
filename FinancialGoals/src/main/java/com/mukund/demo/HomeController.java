package com.mukund.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class HomeController {
	@Autowired
	GoalRepo repo;
	
	@RequestMapping({"/","home"})
	public ModelAndView getHomepage(String status) {
		ModelAndView mv = new ModelAndView();
		if(status!=null)mv.addObject("r",status);
		mv.addObject("list", repo.findAll());
		mv.setViewName("home.jsp");
		return mv;
	}
	
	@PostMapping("add")
	public ModelAndView addGoal(Goal g) {
		ModelAndView mv = new ModelAndView();
		try {
		repo.save(g);
		}
		catch (Exception e) {
			// TODO: handle exception
			mv.addObject("status",e.getMessage());
		}
		mv.addObject("status","Added Successfully.");
		mv.setViewName("redirect:home");
		return mv;
	}
	
	@RequestMapping("delete")
	public ModelAndView deleteGoal(int id) {
		ModelAndView mv = new ModelAndView();
		try {
			repo.deleteById(id);
		}
		catch (Exception e) {
			// TODO: handle exception
			mv.addObject("status",e.getMessage());
		}
		mv.addObject("status","Deleted Successfully.");
		mv.setViewName("redirect:home");
		return mv;
	}
	
}
