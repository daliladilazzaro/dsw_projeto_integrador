/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Pedido;

import DAO.CheckoutDAO;
import DAO.ClienteDAO;
import DAO.PedidoDAO;
import Model.Checkout;
import Model.Pedido;
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
public class AcompanharPedido extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int idUsuario = Integer.parseInt(request.getParameter("id_usuario"));
        int idCliente = ClienteDAO.getIDCliente(idUsuario);
        
        List<Pedido> listaPedidos = PedidoDAO.listaPedidos(idCliente);
        request.setAttribute("listaPedidos", listaPedidos);
        
        request.getRequestDispatcher("meus-pedidos.jsp").forward(request, response);
            
        
        
        
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
