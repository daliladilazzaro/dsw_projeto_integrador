/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Carrinho;

import DAO.CarrinhoDAO;
import Model.Carrinho;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddProdutoDeslogado extends HttpServlet {
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         //Inserir produto no carrinho:
         int qtdDesejada = 1;
         int fkProduto = Integer.parseInt(request.getParameter("id_produto"));
         String nomeCliente = request.getParameter("nome_cliente");
    
         Carrinho validaExistente = CarrinhoDAO.getItemDeslogado(fkProduto, nomeCliente);
         
         if (validaExistente != null) {
            boolean attQtd = CarrinhoDAO.atualizarQtdItemDeslogado(fkProduto, nomeCliente);
            response.sendRedirect("add-produto-deslogado"
                                    + "?nome_cliente="+nomeCliente);
            
        }else{
                  
         Carrinho item = new Carrinho(qtdDesejada, nomeCliente, fkProduto);
         boolean ok = CarrinhoDAO.AddProdutoDeslogado(item);
         
         if (ok) {
                System.out.println("Sucesso!");
                response.sendRedirect("add-produto-deslogado"
                                    + "?nome_cliente="+nomeCliente);
            } else {
                System.out.println("Falha!");
                response.sendRedirect("Erro.jsp");
            }
         
    }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         String nomeCliente =  request.getParameter("nome_cliente");
         List<Carrinho> listaCarrinho = CarrinhoDAO.listaCarrinhoDeslogado(nomeCliente);
         request.setAttribute("listaCarrinho", listaCarrinho);
         
         if (listaCarrinho.isEmpty()) {
            response.sendRedirect("carrinho.jsp?carrinhoVazio=true");
        }else{
            request.getRequestDispatcher("/Publico/carrinho.jsp").forward(request, response);
        }
       
    }
}
