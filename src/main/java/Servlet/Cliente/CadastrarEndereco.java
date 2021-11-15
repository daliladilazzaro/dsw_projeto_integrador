/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Cliente;

import DAO.ClienteDAO;
import Model.Endereco;
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
public class CadastrarEndereco extends HttpServlet {

   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int idUsuario = Integer.parseInt(request.getParameter("id_usuario"));
        int idCliente = ClienteDAO.getIDCliente(idUsuario);
        
         //Informações endereço de cobranca:
         String CEP02 = request.getParameter("CEP02");
         String logradouro02 = request.getParameter("logradouro02");
         String bairro02 = request.getParameter("bairro02");
         String cidade02 = request.getParameter("cidade02");
         String estado02 = request.getParameter("estado02");
         int numero02 = Integer.parseInt(request.getParameter("numero02"));
         String tipo = request.getParameter("tipo");
         String padrao = "Complementar";  
         String status = "Ativo";
         
         Endereco validaNulo = ClienteDAO.getEnderecoCobranca(idCliente);
         
         if(tipo.equals("Cobrança") && validaNulo != null){
                            response.sendRedirect("alterar-cliente"
                                    + "?id_usuario="+idUsuario
                                    + "&EnderecoExistente=true");

        }else{
         
         Endereco endereco = new Endereco (CEP02, logradouro02, bairro02, cidade02, estado02, numero02, tipo, padrao, status, idCliente);
         boolean ok = ClienteDAO.cadastrarEndereco(endereco);
         
         // Redirecionar para página principal com o cliente logado:
            if (ok) {
                System.out.println("Endereço salvo com sucesso!");
                response.sendRedirect("alterar-cliente?id_usuario="+idUsuario);               
                
            } else {
                System.out.println("Falha!");
                response.sendRedirect("Erro.jsp");
            }
         }
        
    }

}
