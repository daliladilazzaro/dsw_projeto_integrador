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


public class CadastrarUsuario extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //INSERE O PRODUTO NO BANCO;
         String nome = request.getParameter("nome");
         String CPF = request.getParameter("CPF");
         String email = request.getParameter("email");
         String senha = request.getParameter("senha");
         String grupo = request.getParameter("grupo");
         String status = "Ativo";
         
         String HashSenha = CryptoUtils.gerarHash(senha);
         Usuario usuario = new Usuario(nome, CPF, email, HashSenha, grupo, status);
         
         Usuario validaNulo = UsuarioDAO.getUsuario(email);
         
        if (validaNulo != null) {
            response.sendRedirect("cadastro-usuarios.jsp?CadastroExistente=true");
        }else{
        
         boolean ok = UsuarioDAO.cadastrarUsuario(usuario);
         
         // Passo 3: Redirecionar para sucesso.jsp
            if (ok) {
                System.out.println("Usuário salvo com sucesso!");
                response.sendRedirect("../Admin_Estoquista/consulta-usuarios");                
            } else {
                System.out.println("Falha!");
                response.sendRedirect("Erro.jsp");
            }
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }



}
