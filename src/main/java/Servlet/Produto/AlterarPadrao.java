/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Produto;

import DAO.ProdutoDAO;
import Model.Imagem;
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
public class AlterarPadrao extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            int idImagem = Integer.parseInt(request.getParameter("idImagem"));
            Imagem imagem = ProdutoDAO.getImagem(idImagem);
            
            int FkProduto = imagem.getFKProduto();
            
            boolean ok = ProdutoDAO.atualizarPadroesImagem(FkProduto);
            boolean ok02 = ProdutoDAO.atualizarPadraoImagem(idImagem);
            request.getRequestDispatcher("/Protegido/Admin_Estoquista/alterar-produto?idproduto="+FkProduto).forward(request, response);
     
            if (ok && ok02) {
                System.out.println("Sucesso!");
            } else {
                System.out.println("Falha!");
                response.sendRedirect("Erro.jsp");
            }
      
    }

}
