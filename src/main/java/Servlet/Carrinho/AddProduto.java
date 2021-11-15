/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Carrinho;

import DAO.CarrinhoDAO;
import DAO.CheckoutDAO;
import DAO.ClienteDAO;
import Model.Carrinho;
import Model.Checkout;
import Model.Endereco;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddProduto extends HttpServlet {
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         //Inserir produto no carrinho:
         int qtdDesejada = 1;
         int fkProduto = Integer.parseInt(request.getParameter("id_produto"));
         String nomeCliente = request.getParameter("nome_cliente");
         int fkUsuario = Integer.parseInt(request.getParameter("id_usuario"));
         
         Carrinho validaExistente = CarrinhoDAO.getItemLogado(fkProduto, fkUsuario);
         
         if (validaExistente != null) {
            boolean attQtd = CarrinhoDAO.atualizarQtdItemLogado(fkProduto, fkUsuario);
            response.sendRedirect("add-produto"
                                    + "?id_usuario="+fkUsuario);
            
        }else{
         
         
         Carrinho item = new Carrinho(qtdDesejada, nomeCliente, fkProduto, fkUsuario);
         boolean ok = CarrinhoDAO.AddProdutoLogado(item);
         
         
         if (ok) {
                System.out.println("Sucesso!");
                response.sendRedirect("add-produto"
                                    + "?id_usuario="+fkUsuario);
            } else {
                System.out.println("Falha!");
                response.sendRedirect("Erro.jsp");
            }
         
    }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         int fkUsuario = Integer.parseInt(request.getParameter("id_usuario"));
         int idCliente = ClienteDAO.getIDCliente(fkUsuario);
         
         Endereco endereco = ClienteDAO.getEnderecoPrincipal(idCliente);
         
         String CEP = endereco.getCEP();
         
         request.setAttribute("CEP", CEP);
         
         List<Carrinho> listaCarrinho = CarrinhoDAO.listaCarrinhoLogado(fkUsuario);
         request.setAttribute("listaCarrinho", listaCarrinho);
         
         List<Checkout> listaCheckout = CheckoutDAO.listaCheckout(idCliente);
         request.setAttribute("listaCheckout", listaCheckout);
         
         
        if (listaCarrinho.isEmpty()) {
            response.sendRedirect("carrinho.jsp?carrinhoVazio=true");
        }else{
            request.getRequestDispatcher("/Publico/carrinho.jsp").forward(request, response);
        }
        
    }
}
