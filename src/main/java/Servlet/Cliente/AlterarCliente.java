/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Cliente;

import DAO.ClienteDAO;
import DAO.UsuarioDAO;
import Model.Cliente;
import Model.Endereco;
import Model.Usuario;
import Utils.CryptoUtils;
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
public class AlterarCliente extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int idUsuario = Integer.parseInt(request.getParameter("id_usuario"));
        int idCliente = ClienteDAO.getIDCliente(idUsuario);
        
        Cliente cliente = ClienteDAO.getCliente(idCliente);
        
        request.setAttribute("cliente", cliente);
        
        List<Endereco> listaEnderecos = ClienteDAO.listaEnderecos(idCliente);
        request.setAttribute("listaEnderecos", listaEnderecos);
        
        request.getRequestDispatcher("/Protegido/Cliente/alterar-cliente.jsp").forward(request, response);
        
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         //Inserção no banco:
         int idUsuario = Integer.parseInt(request.getParameter("id_usuario"));
         int idCliente = ClienteDAO.getIDCliente(idUsuario);
         String nome = request.getParameter("nome");
         String CPF = request.getParameter("CPF");
         String email = request.getParameter("email");
         String nascimento = request.getParameter("nascimento");
         String genero = request.getParameter("genero");
         String senha = request.getParameter("senha");
         
         String grupoUser="Cliente";
         String statusUser="Ativo";
         
         boolean ok = false;
         boolean ok02 = false;
         String HashSenha = CryptoUtils.gerarHash(senha);
         Cliente cliente = new Cliente(idCliente, nome, CPF, email, nascimento, genero, HashSenha, idUsuario);
         Usuario usuario = new Usuario(nome, CPF, email, HashSenha, grupoUser, statusUser);
         
         if(senha.equals("")){
             
             ok = ClienteDAO.atualizarClienteNoPassword(cliente);
             
         
            if (ok) {
                System.out.println("Cliente alterado com sucesso!");
                response.sendRedirect("../../Publico/landing-page");                
            } else {
                System.out.println("Falha!");
                response.sendRedirect("Erro.jsp");
            }
         
             
         }else{
              
             ok = ClienteDAO.atualizarCliente(cliente);
             ok02 = UsuarioDAO.atualizarUsuario(usuario);
             
             
            if (ok && ok02) {
                System.out.println("Cliente alterado com sucesso!");
                response.sendRedirect("../../Publico/landing-page");                
            } else {
                System.out.println("Falha!");
                response.sendRedirect("Erro.jsp");
            }

         }
         
        
    }

}
