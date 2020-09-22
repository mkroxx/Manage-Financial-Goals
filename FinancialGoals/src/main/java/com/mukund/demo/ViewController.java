package com.mukund.demo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class ViewController {
	
	@Autowired
	private GoalRepo repo;
	@Autowired
	private TransactionRepo trepo;
	private Goal g;
	private int id;
	@RequestMapping("view")
	public ModelAndView getHomepage(String gid ,String status) {
		ModelAndView mv = new ModelAndView();
		try {
			id=Integer.parseInt(gid);
			g=repo.findById(id).get();
			mv.addObject("goal",g);
			mv.addObject("transaction",getByGoalId(id,trepo.findAll()));
			mv.addObject("r",status);
			mv.setViewName("View.jsp");
		}
		catch(Exception e) {
			mv.setViewName("home");
		}
		return mv;
	}
	
	private Iterable<Transactions> getByGoalId(int gId,Iterable<Transactions> findAll) {
		// TODO Auto-generated method stub
		List<Transactions> tran=new ArrayList<>();
		for(Transactions t:findAll)
		{
			if(t.getGoalID()==gId) {
				tran.add(t);
			}
		}
		return tran;
	}

	@PostMapping("update")
	public ModelAndView setTransaction(Transactions t) {
		ModelAndView mv = new ModelAndView();
		try {
			if((g.getContribute()+t.getAmount())<=g.getTargetAmount()) {
			trepo.save(t);
			g.setContribute(g.getContribute()+t.getAmount());
			repo.save(g);
			mv.addObject("status","Transaction Successful.");
			}
			else if(g.getContribute()==g.getTargetAmount()) {
				mv.addObject("status","Transaction Unsuccessful. Goal is already Completed.");
			}
			else {
				mv.addObject("status","Transaction Unsuccessful.\nContributionAmount <= RequiredAmount.");
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			mv.addObject("status",e.getMessage());
		}
		mv.addObject("gid",g.getId());
		mv.setViewName("redirect:view");
		return mv;
		
	}
}
