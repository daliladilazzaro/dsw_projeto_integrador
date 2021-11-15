package Servlet.Carrinho;

import DAO.CarrinhoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ExcluirItem extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            int idItem = Integer.parseInt(request.getParameter("id_item"));
            String nomeCliente = request.getParameter("nome_cliente");
            
            boolean ok = CarrinhoDAO.excluirItem(idItem);
            
            
            String URL = "";
            
            if(nomeCliente.length() > 60){
                 response.sendRedirect("add-produto-deslogado"
                                    + "?nome_cliente="+nomeCliente);
            
            }else{
            
                int idUsuario = Integer.parseInt(request.getParameter("id_usuario"));
                response.sendRedirect("add-produto"
                                      +"?id_usuario="+idUsuario);
            }
             
          
        }
}
