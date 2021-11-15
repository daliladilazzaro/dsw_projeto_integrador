package Servlet.Checkout;

import DAO.CarrinhoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AttQtdItem extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            int idItem = Integer.parseInt(request.getParameter("id_item"));
            int novaQtd = Integer.parseInt(request.getParameter("qtd_desejada"));
            String nomeCliente = request.getParameter("nome_cliente");
            
            boolean ok = CarrinhoDAO.AttQtdItem(idItem, novaQtd);
            
            if(ok) {
                System.out.println("Item de carrinho validado com sucesso!");
            } else {
                System.out.println("Falha!");
                response.sendRedirect("Erro.jsp");
            } 
             
          
        }
}
