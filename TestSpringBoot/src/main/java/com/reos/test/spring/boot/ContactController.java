package com.reos.test.spring.boot;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class ContactController {

	@RequestMapping("/contact")
	public @ResponseBody List<Contact> listContacts(HttpServletResponse response){
		
		System.out.println("cccccccccccccccccccccccccccccccccccccccc");
		
		//response.setHeader("Access-Control-Allow-Origin", "*");//OK
		//response.setHeader("Access-Control-Allow-Origin", "http://localhost:8080");//FAIL
		response.setHeader("Access-Control-Allow-Origin", "http://localhost:9090");//OK
		response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
		response.setHeader("Access-Control-Max-Age", "3600");
		response.setHeader("Access-Control-Allow-Headers", "x-requested-with");
		
		
		List<Contact> contacts = new ArrayList<Contact>();
		Contact contact = new Contact();
		contact.setName("Rommel Oramas");
		contact.setPhoneNumber("99999999999");
		contact.setAddress("12 de Octubre");
		contacts.add(contact);
		return contacts;
	}
	
	@RequestMapping("/init")
	public String loadInitPage(){
		return "contacts";
	}
}
