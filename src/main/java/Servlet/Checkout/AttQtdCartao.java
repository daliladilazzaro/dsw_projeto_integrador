/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Checkout;

import DAO.CheckoutDAO;
import DAO.ClienteDAO;
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
public class AttQtdCartao extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
                
            //Altera tabela de checkout com id de cartão atrelado:
            String formaPagamento = "Cartão";
            int idUsuario = Integer.parseInt(request.getParameter("id_usuario"));
            int idCliente = ClienteDAO.getIDCliente(idUsuario);
            int qtdParcelas = Integer.parseInt(request.getParameter("qtd_desejada"));
            System.out.println("Qtd parcelas que chegou até o servlet: "+qtdParcelas);
            int idCartao = Integer.parseInt(request.getParameter("id_cartao"));
            System.out.println("id cartão: "+qtdParcelas);
            System.out.println("id cliente: "+idCliente);
            boolean ok = CheckoutDAO.atualizarCheckoutCartao(idCliente, formaPagamento, idCartao, qtdParcelas);
            
            if (ok) {
                System.out.println("Pagamento de checkout validado com sucesso!");
            } else {
                System.out.println("Falha!");
                response.sendRedirect("Erro.jsp");
            }   
    }
}
