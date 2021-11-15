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
public class AttFrete extends HttpServlet {

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
            //Altera tabela de checkout com o novo frete:
            int idUsuario = Integer.parseInt(request.getParameter("id_usuario"));
            int idCliente = ClienteDAO.getIDCliente(idUsuario);
            int idEndereco = Integer.parseInt(request.getParameter("id_endereco"));
            double frete = Double.parseDouble(request.getParameter("novo_frete"));
            boolean ok = CheckoutDAO.atualizarCheckoutEndereco(idCliente, idEndereco, frete);
            
            if (ok) {
                System.out.println("Frete de checkout validado com sucesso!");
            } else {
                System.out.println("Falha!");
                response.sendRedirect("Erro.jsp");
            }
    }

}
