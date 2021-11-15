/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Usuario;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.UsuarioDAO;
import Model.Usuario;

public class InativarUsuario extends HttpServlet {
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String emailLogado = request.getParameter("emailLogado");
        
        System.out.println(email);
        System.out.println(emailLogado);
        
        if(email.equals(emailLogado)){
            response.sendRedirect("consulta-usuarios?erroInativacao=true");
        }
        else{
            
        Usuario usuario = UsuarioDAO.getUsuario(email);
        String validaStatus ="";
        if(usuario.getStatus().equals("Ativo")){
            validaStatus="Inativo";
        }
        else{
            validaStatus="Ativo";
        }
        
        boolean ok = UsuarioDAO.atualizarStatus(validaStatus, email);
        
        // Passo 3: Redirecionar para sucesso.jsp
            if (ok) {
                System.out.println("Sucesso!");
                response.sendRedirect("consulta-usuarios");
            } else {
                System.out.println("Falha!");
            }
   
    }
    
}
        
        
} 
        
        

