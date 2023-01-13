package Controlador;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import Entidad.EntidadCliente;
import Modelo.Modelo_Cliente;

/**
 * Servlet implementation class ControladorCliente
 */
public class ControladorCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControladorCliente() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			/* TODO output your page here. You may use following sample code. */
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet ControladorCliente</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>Servlet ControladorCliente at " + request.getContextPath() + "</h1>");
			out.println("</body>");
			out.println("</html>");
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher vista = null;

		String opcion = request.getParameter("op");
		Modelo_Cliente obj = new Modelo_Cliente();
		EntidadCliente cli;
		int xid;

		String xtipo = "";
		String xnro = "";
		String xnom = "";
		String xdir = "";
		int xiddis;
		String xest = "";

		switch (opcion) {
		// LISTAR
		case "1":
			vista = request.getRequestDispatcher("Vista/Cliente/Vista_Cliente.jsp");
			break;
		case "2":
			vista = request.getRequestDispatcher("Vista/Cliente/Vista_IngCliente.jsp");
			break;
		case "3":// modificar
			xid = Integer.parseInt(request.getParameter("id"));
			request.setAttribute("idCli", xid);
			vista = request.getRequestDispatcher("Vista/Cliente/Vista_modCliente.jsp");
			break;
		case "4":// eliminar
			xid = Integer.parseInt(request.getParameter("id"));
			boolean res = obj.EliminarCliente(xid);
			vista = request.getRequestDispatcher("Vista/Cliente/Vista_Cliente.jsp");
			break;

		case "Agregar":
			xtipo = request.getParameter("txtTipo");
			xnro = request.getParameter("txtNro");
			xnom = request.getParameter("txtNom");
			xdir = request.getParameter("txtDir");
			xiddis = Integer.parseInt(request.getParameter("txtDis"));
			xest = request.getParameter("txtEst");

			cli = new EntidadCliente();
			cli.setTipodoc(xtipo);
			cli.setNrodoc(xnro);
			cli.setNombre(xnom);
			cli.setDirec(xdir);
			cli.setIddis(xiddis);
			cli.setEstado(xest);

			obj.IngresarCliente(cli);
			vista = request.getRequestDispatcher("Vista/Cliente/Vista_Cliente.jsp");
			break;
		case "Grabar":
			xid = Integer.parseInt(request.getParameter("txtid"));
			xtipo = request.getParameter("txtTipo");
			xnro = request.getParameter("txtNro");
			xnom = request.getParameter("txtNom");
			xdir = request.getParameter("txtDir");
			xiddis = Integer.parseInt(request.getParameter("txtDis"));
			xest = request.getParameter("txtEst");

			cli = new EntidadCliente();
			cli.setId(xid);
			cli.setTipodoc(xtipo);
			cli.setNrodoc(xnro);
			cli.setNombre(xnom);
			cli.setDirec(xdir);
			cli.setIddis(xiddis);
			cli.setEstado(xest);

			obj.ModificarCliente(cli);
			vista = request.getRequestDispatcher("Vista/Cliente/Vista_Cliente.jsp");
			break;
		}
		vista.forward(request, response);
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
