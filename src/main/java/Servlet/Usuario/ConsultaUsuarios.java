/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Usuario;

import DAO.UsuarioDAO;
import Model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ygor.oliveira
 */
public class ConsultaUsuarios extends HttpServlet {

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        Usuario usuario = (Usuario) httpServletRequest.getSession().getAttribute("usuario");
        
        
        if(usuario.isEstoquista()){
            List<Usuario> listaUsuarios = UsuarioDAO.listaUsuariosEstoquista(usuario.getEmail());
            request.setAttribute("listaUsuarios", listaUsuarios);
        
        }else{
            List<Usuario> listaUsuarios = UsuarioDAO.listaUsuarios();
            request.setAttribute("listaUsuarios", listaUsuarios);
        }
        
         request.getRequestDispatcher("/Protegido/Admin_Estoquista/consulta-usuarios.jsp").forward(request, response);
    }

  

}
