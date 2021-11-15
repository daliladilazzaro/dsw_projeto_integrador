/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Produto;

import DAO.ProdutoDAO;
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
public class ImagemServlet extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            int idImagem = Integer.parseInt(request.getParameter("idImagem"));
            int FkProduto = ProdutoDAO.idProduto; 
            
            boolean ok = ProdutoDAO.atualizarPadroesImagem(FkProduto);
            boolean ok02 = ProdutoDAO.atualizarPadraoImagem(idImagem);
     
            if (ok && ok02) {
                System.out.println("Sucesso!");
                response.sendRedirect("consulta-produtos");
            } else {
                System.out.println("Falha!");
                response.sendRedirect("Erro.jsp");
            }
      
    }

}
