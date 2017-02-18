package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.StateDao;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.model.City;
import com.model.State;

public class StateController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private StateDao stateDao;
	public StateController(){
		stateDao = new StateDao();
	}
	
	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		
		//System.out.println("into cities");
		
		String action = request.getParameter("action");
		List<State> stateList = new ArrayList<State>();
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		response.setContentType("application/json");
		
		
		if (action != null) {
			if (action.equals("list")) {
				try {
					
					// Fetch Data from Student Table
					stateList = stateDao.getAllState();
					// Convert Java Object to Json
					String jsonArray = gson.toJson(stateList);
					// Return Json in the format required by jTable plugin

					response.getWriter().print(jsonArray);
					
				} catch (Exception e) {
					String error = "Message : " + e.getMessage();
					response.getWriter().print(error);
					System.err.println(e.getMessage());
				}
			}
		}
		
	}
}


