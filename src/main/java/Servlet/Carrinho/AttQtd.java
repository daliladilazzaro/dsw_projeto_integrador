package Servlet.Carrinho;

import DAO.CarrinhoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AttQtd extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            int idItem = Integer.parseInt(request.getParameter("id_item"));
            int novaQtd = Integer.parseInt(request.getParameter("qtd_desejada"));
            String nomeCliente = request.getParameter("nome_cliente");
            
            boolean ok = CarrinhoDAO.AttQtdItem(idItem, novaQtd);
            
            String URL = "";
            
            if(nomeCliente.length() > 80){
                 response.sendRedirect("add-produto-deslogado"
                                    + "?nome_cliente="+nomeCliente);
            
            }else{
            
                int idUsuario = Integer.parseInt(request.getParameter("id_usuario"));
                response.sendRedirect("add-produto"
                                      +"?id_usuario="+idUsuario);
            }
             
          
        }
}
