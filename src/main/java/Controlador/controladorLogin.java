package Controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Entidad.login;
import Modelo.person;

/**
 * Servlet implementation class controladorLogin
 */
public class controladorLogin extends HttpServlet {

	person per = new person();
	login p = new login();
	int r;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String accion = request.getParameter("accion");
		if (accion.equals("Entrar")) {
			String nom = request.getParameter("txtnom");
			String correo = request.getParameter("txtcorreo");
			p.setNom(nom);
			p.setCorreo(correo);
			r = per.validar(p);
			if (r == 1) {
				request.getSession().setAttribute("nom", nom);
				request.getSession().setAttribute("correo", correo);
				request.getRequestDispatcher("home.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		} else {
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	public String getServletInfo() {
		return "Short description";
	}
}
