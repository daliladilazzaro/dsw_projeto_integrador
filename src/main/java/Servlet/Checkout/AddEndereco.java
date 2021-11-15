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


public class AddEndereco extends HttpServlet {

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int idUsuario = Integer.parseInt(request.getParameter("id_usuario"));
        int idCliente = ClienteDAO.getIDCliente(idUsuario);
        int fkEndereco = Integer.parseInt(request.getParameter("enderecoEscolhido"));
        double frete = Double.parseDouble(request.getParameter("frete"));
        
        Checkout endereco = new Checkout(idCliente, fkEndereco, frete);
        Checkout validaExistente = CheckoutDAO.getCliente(idCliente);
        
        boolean ok = false;
        
        if (validaExistente != null){
        
           ok = CheckoutDAO.atualizarCheckoutEndereco(idCliente, fkEndereco, frete);
           ClienteDAO.atualizarPadroesEndereco(idCliente);
           ClienteDAO.atualizarPadraoEndereco(fkEndereco);
        
        }else{
        
          ok = CheckoutDAO.AddEndereco(endereco);
          ClienteDAO.atualizarPadroesEndereco(idCliente);
          ClienteDAO.atualizarPadraoEndereco(fkEndereco);
          
        }
        
        if (ok) {
                System.out.println("Endereço de checkout validado com sucesso!");
                response.sendRedirect("add-endereco-checkout?id_usuario="+idUsuario);                
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
                response.sendRedirect("../Protegido/Cliente/add-cartao?id_usuario="+idUsuario);
    }

}
