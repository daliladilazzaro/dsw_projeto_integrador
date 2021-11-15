/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Usuario;

import DAO.UsuarioDAO;
import Model.Usuario;
import Utils.CryptoUtils;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ygor.oliveira
 */
public class AlterarUsuario extends HttpServlet {
    
  

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //INSERE O PRODUTO NO BANCO;
         String nome = request.getParameter("nome");
         String CPF = request.getParameter("CPF");
         String email = request.getParameter("email");
         String senha = request.getParameter("senha");
         String grupo = request.getParameter("grupo");
         String status = request.getParameter("status");
         
         boolean ok = false;
         
         String HashSenha = CryptoUtils.gerarHash(senha);
         Usuario usuario = new Usuario(nome, CPF, email, HashSenha, grupo, status);
         
        
         if(senha.equals("")){
                ok = UsuarioDAO.atualizarUsuarioNoPassword(usuario);

          }else{
                ok = UsuarioDAO.atualizarUsuario(usuario);

        }
         
         // Passo 3: Redirecionar para sucesso.jsp
            if (ok) {
                System.out.println("Usuário alterado com sucesso!");
                response.sendRedirect("../Admin_Estoquista/consulta-usuarios");                
            } else {
                System.out.println("Falha!");
                response.sendRedirect("Erro.jsp");
            }
    }
  
      
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        Usuario usuario = UsuarioDAO.getUsuario(email);
        
        request.setAttribute("usuario", usuario);
        
        request.getRequestDispatcher("/Protegido/Admin_Estoquista/alterar-usuarios.jsp").forward(request, response);

    }


}
