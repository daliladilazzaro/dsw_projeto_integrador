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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CadastrarCliente extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //Inserção no banco:
         String nome = request.getParameter("nome");
         String CPF = request.getParameter("CPF");
         String email = request.getParameter("email");
         String nascimento = request.getParameter("nascimento");
         String genero = request.getParameter("genero");
         String senha = request.getParameter("senha");
         String statusUser = "Ativo";
         String grupoUser = "Cliente";
         
         //Informações endereço de entrega:
         String CEP01 = request.getParameter("CEP01");
         String logradouro01 = request.getParameter("logradouro01");
         String bairro01 = request.getParameter("bairro01");
         String cidade01 = request.getParameter("cidade01");
         String estado01 = request.getParameter("estado01");
         int numero01 = Integer.parseInt(request.getParameter("numero01"));
         String tipoEndEntrega = "Entrega";
         String statusEndEntrega = "Ativo";
         String padraoEndEntrega = "Principal";
         
         //Informações endereço de cobranca:
         String CEP02 = request.getParameter("CEP02");
         String logradouro02 = request.getParameter("logradouro02");
         String bairro02 = request.getParameter("bairro02");
         String cidade02 = request.getParameter("cidade02");
         String estado02 = request.getParameter("estado02");
         int numero02 = Integer.parseInt(request.getParameter("numero02"));
         String tipoEndCobranca = "Cobrança";
         String statusEndCobranca = "Ativo";
         String padraoEndCobranca = "Principal";
         
         
         String HashSenha = CryptoUtils.gerarHash(senha);
         Usuario usuario = new Usuario(nome, CPF, email, HashSenha, grupoUser, statusUser);
         
         
         //Valida e-mail e CPF existente:
         Usuario validaNulo = UsuarioDAO.getUsuario(email);
         Usuario validaCPFNulo = UsuarioDAO.getUsuarioCPF(CPF);
         
        if (validaCPFNulo != null) {
            response.sendRedirect("cadastro-cliente.jsp?CPFExistente=true");
        }
        else if(validaNulo != null){
             response.sendRedirect("cadastro-cliente.jsp?CadastroExistente=true");
        }
        
        else{
        
         //Realiza a inserção e recupera o ID do usuário:
         boolean ok = UsuarioDAO.cadastrarUsuario(usuario);
         int FKUsuario = UsuarioDAO.idUsuario;
         
         Cliente cliente = new Cliente(nome, CPF, email, nascimento, genero, HashSenha, FKUsuario);
         
         //Realiza a inserção e recupera o ID do cliente:
         boolean ok02 = ClienteDAO.cadastrarCliente(cliente);
         int FKCliente = ClienteDAO.idCliente;
         
         Endereco entrega = new Endereco (CEP01, logradouro01, bairro01, cidade01, estado01, numero01, tipoEndEntrega, padraoEndEntrega, statusEndEntrega, FKCliente);
         Endereco cobranca = new Endereco (CEP02, logradouro02, bairro02, cidade02, estado02, numero02, tipoEndCobranca, padraoEndCobranca, statusEndCobranca, FKCliente);
         
         //Realiza a inserção dos endereços e encerra os processos:
         boolean ok03 = ClienteDAO.cadastrarEndereco(entrega);
         boolean ok04 = ClienteDAO.cadastrarEndereco(cobranca);
         String userAgent = request.getHeader("user-agent");
         // Redirecionar para página principal com o cliente logado:
            if (ok && ok02 && ok03 && ok04) {
                System.out.println("Usuário, cliente e endereços salvos com sucesso!");
                request.getRequestDispatcher("/Publico/login"
                        + "?login="+email+"&"
                        +"senha="+senha+"&"
                        +"user_agent="+userAgent
                        ).forward(request, response);
                
            } else {
                System.out.println("Falha!");
                response.sendRedirect("Erro.jsp");
            }
         
         
          
        }
        
    }

}
