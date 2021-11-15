/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Checkout;

import DAO.CartaoDAO;
import DAO.CheckoutDAO;
import DAO.ClienteDAO;
import Model.Cartao;
import Model.Checkout;
import Model.Endereco;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddPagamento extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        String formaPagamento = request.getParameter("forma_pagamento");
        int idUsuario = Integer.parseInt(request.getParameter("id_usuario"));
        int idCliente = ClienteDAO.getIDCliente(idUsuario);
        
        boolean ok = false;
        
        if(formaPagamento.equals("Cartão")){
        
            //Altera tabela de checkout com id de cartão atrelado:
            int qtdParcelas = Integer.parseInt(request.getParameter("qtd_parcelas"));
            int idCartao = Integer.parseInt(request.getParameter("Cartão"));
            
            ok = CheckoutDAO.atualizarCheckoutCartao(idCliente, formaPagamento, idCartao, qtdParcelas);
            
        }else{
            //Altera tabela de checkout sem id de cartão atrelado:
             int qtdParcelas = 1;
             ok = CheckoutDAO.atualizarCheckoutBoleto(idCliente, formaPagamento, qtdParcelas);
        }
        
        if (ok) {
                System.out.println("Pagamento de checkout validado com sucesso!");
                response.sendRedirect("add-pagamento-checkout?id_usuario="+idUsuario);                
            } else {
                System.out.println("Falha!");
                response.sendRedirect("Erro.jsp");
            } 
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
                int idUsuario = Integer.parseInt(request.getParameter("id_usuario"));
                int idCliente = ClienteDAO.getIDCliente(idUsuario);
                
                System.out.println("Chegout até a parte de redirecionar!");
                response.sendRedirect("finaliza-checkout?id_usuario="+idUsuario); 
        
      
    }
}
