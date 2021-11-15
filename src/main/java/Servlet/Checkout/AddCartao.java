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
public class AddCartao extends HttpServlet {
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
             String nome = request.getParameter("nome");
             String numero = request.getParameter("numero");
             int CVV = Integer.parseInt(request.getParameter("CVV"));
             String expiracao = request.getParameter("expiracao");
             int idUsuario = Integer.parseInt(request.getParameter("id_usuario"));
             int idCliente = ClienteDAO.getIDCliente(idUsuario);
             
             Cartao cartao = new Cartao(nome, numero, CVV, expiracao, idCliente);
             boolean ok = CartaoDAO.cadastrarCartao(cartao);
             
              if (ok) {
                System.out.println("Cartão cadastrado com sucesso!");
                response.sendRedirect("add-cartao?id_usuario="+idUsuario);                
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
        
                List<Cartao> listaCartoes = CartaoDAO.listaCartao(idCliente);
                request.setAttribute("listaCartoes", listaCartoes);
                
                List<Checkout> listaCheckout = CheckoutDAO.listaCheckout(idCliente);
                request.setAttribute("listaCheckout", listaCheckout);
                
                List<Checkout> listaCheckoutPagamentos = CheckoutDAO.listaCheckoutPagamentos(idCliente);
                request.setAttribute("listaCheckoutPagamentos", listaCheckoutPagamentos);
                
                System.out.println("Chegout até a parte de redirecionar!");
                
                request.getRequestDispatcher("checkout-pagamento.jsp").forward(request, response);
        }
    

}
