package pw2;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class Save extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String user = req.getParameter("user");
		String pass = req.getParameter("pass");
		String name = req.getParameter("name");
		String lastname = req.getParameter("lastname");
		String email = req.getParameter("email");
		String color = req.getParameter("color");
		
		Persona p = new Persona(user, pass, name, lastname, email, color," ");
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		
		try{
			//Hacemos persistente la clase persona
			pm.makePersistent(p);
			resp.getWriter().println("Datos grabados correctamente ");
			

		}catch(Exception e){
			System.out.println(e);
			resp.getWriter().println("Ocurrio un error, <a href='index.jsp'>vuelva a intentarlo</a>");
		}finally{
			pm.close();
		}
	}
}