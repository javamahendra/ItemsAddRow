package com.app.contoller;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.app.model.Child;
import com.app.model.MotherFormBean;

@Controller
public class MyController {
	

	@GetMapping("/")
	public String data(ModelMap map) {
		
		List<Child> childrens =Arrays.asList(new Child(10l, "ABC"),new Child(20l, "XYZ"),new Child(10l, "DEF"),new Child(20l, "GHI"));
		
		//map.addAttribute("mother",new MotherFormBean(100l,"Parent",childrens));
		
		return "index";
	}
	
	@PostMapping("/save")
	public String data(@ModelAttribute MotherFormBean motherbean,ModelMap map) {
		map.addAttribute("motherbaen", new MotherFormBean());
		System.out.println(motherbean);
		return "index";
	}
}
