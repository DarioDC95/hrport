package hrport.project.main.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

import hrport.project.main.pojo.Utente;
import hrport.project.main.service.UtenteService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/loginUser")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		try {
			
			Utente utente = UtenteService.getUserByEmailAndPassword(email, password);
			if(utente != null) {
				
				HttpSession session = request.getSession(true);
				
				session.setAttribute("idUtente", utente.getIdUtente());
				
				String isAdmin = utente.isAdmin() ? "true" : "false";
				session.setAttribute("admin", isAdmin);
				
				if(isAdmin.equalsIgnoreCase("false")) {
					
					response.sendRedirect(request.getContextPath() + "/user/home");
				} else {
					
					/* inserire la redirect alla admin/user */
				}
			}
		} catch (Exception e) {
			
			if(e instanceof SQLException) {
				
				String respError = "credenziali errate";
				response.addHeader("data", respError);
			}
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
		}
	}
}
