package org.kosta.AeyongTown.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	@RequestMapping(method = RequestMethod.GET, path = {"/", "home"})
	public String home(Model model) {
		return "home.tiles";
	}
}
