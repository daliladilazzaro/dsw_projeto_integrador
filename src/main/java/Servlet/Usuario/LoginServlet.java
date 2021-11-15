/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Usuario;

import DAO.CarrinhoDAO;
import DAO.UsuarioDAO;
import Model.Usuario;
import Utils.CryptoUtils;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ygor.oliveira
 */
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("Chegou aqui");
                
            
        String login = request.getParameter("login");
        String senhaAberta = request.getParameter("senha");
        
        Usuario usuario = UsuarioDAO.getUsuario(login);
        if (usuario == null) {
            response.sendRedirect("login.jsp?erroLogin=true");
        }
        
        else if (usuario.getStatus().equals("Inativo")) {
            response.sendRedirect("login.jsp?usuarioInativo=true");
        
        }
        
        else {
             boolean senhaOK = CryptoUtils.validarSenha(senhaAberta, usuario.getSenha());
            if (senhaOK) { // Login OK
                HttpSession sessao = request.getSession();
                sessao.setAttribute("usuario", usuario);
                
                if(usuario.getGrupo().equals("Cliente")){
                            
                      //Loguei como cliente, preciso pegar os produtos que adicionei deslogado e tacar no meu carrinho:
                      String nomeCliente = usuario.getNome();
                      int idUsuario = usuario.getIdUsuario();
                      String userAgent = request.getParameter("user_agent");
                      boolean okSessao = CarrinhoDAO.atualizarSessaoCarrinho(nomeCliente, userAgent, idUsuario);
                    
                                response.sendRedirect("landing-page");
                }else{
                response.sendRedirect("../Protegido/Admin_Estoquista/index-backoffice.jsp");
                }
            } else { // Login falhou
                response.sendRedirect("login.jsp?erroLogin=true");
            }
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       HttpSession session = request.getSession();
       session.invalidate();
       response.sendRedirect(request.getContextPath() + "/Publico/login.jsp");
    }

}

        
