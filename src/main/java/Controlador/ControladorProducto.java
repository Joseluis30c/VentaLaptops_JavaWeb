package Controlador;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import Entidad.EntidadProducto;
import Modelo.Modelo_Producto;

/**
 * Servlet implementation class ControladorProducto
 */
public class ControladorProducto extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControladorProducto() {
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
			out.println("<title>Servlet ControladorProducto</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>Servlet ControladorProducto at " + request.getContextPath() + "</h1>");
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
		Modelo_Producto obj = new Modelo_Producto();
		EntidadProducto p;

		int xid;

		String xnom = "";
		int xmar;
		Double xpre;
		String ximagen = "";
		String xest = "";

		switch (opcion) {
		// LISTAR
		case "1":
			vista = request.getRequestDispatcher("Vista/Producto/Vista_Producto.jsp");
			break;
		case "2":// INGRESAR
			vista = request.getRequestDispatcher("Vista/Producto/Vista_IngProducto.jsp");
			break;
		case "3":// editar
			xid = Integer.parseInt(request.getParameter("id"));
			request.setAttribute("idPro", xid);
			vista = request.getRequestDispatcher("Vista/Producto/Vista_modProducto.jsp");
			break;
		case "4":// ELIMINAR
			xid = Integer.parseInt(request.getParameter("id"));
			boolean xres = obj.EliminarProducto(xid);
			vista = request.getRequestDispatcher("Vista/Producto/Vista_Producto.jsp");
			break;
		case "Agregar":
			xnom = request.getParameter("txtnom");
			xmar = Integer.parseInt(request.getParameter("txtmarca"));
			xpre = Double.parseDouble(request.getParameter("txtprecio"));
			ximagen = request.getParameter("fileImagen");
			xest = request.getParameter("txtestado");

			p = new EntidadProducto();
			p.setNompro(xnom);
			p.setMarca(xmar);
			p.setPre(xpre);
			p.setImgpro(ximagen);
			p.setEstado(xest);

			obj.IngresarProducto(p);
			vista = request.getRequestDispatcher("Vista/Producto/Vista_Producto.jsp");
			break;
		case "Grabar":
			xid = Integer.parseInt(request.getParameter("txtid"));
			xnom = request.getParameter("txtnom");
			xmar = Integer.parseInt(request.getParameter("txtmarca"));
			xpre = Double.parseDouble(request.getParameter("txtprecio"));
			ximagen = request.getParameter("fileImagen");
			xest = request.getParameter("txtestado");

			p = new EntidadProducto();

			p.setIdpro(xid);
			p.setNompro(xnom);
			p.setMarca(xmar);
			p.setPre(xpre);
			p.setImgpro(ximagen);
			p.setEstado(xest);

			obj.ModificarProducto(p);
			vista = request.getRequestDispatcher("Vista/Producto/Vista_Producto.jsp");
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
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}
