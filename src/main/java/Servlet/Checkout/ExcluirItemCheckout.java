package Servlet.Checkout;

import DAO.CarrinhoDAO;
import DAO.ProdutoDAO;
import Model.Card;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ExcluirItemCheckout extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            int idItem = Integer.parseInt(request.getParameter("id_item"));
            String nomeCliente = request.getParameter("nome_cliente");
            
            boolean ok = CarrinhoDAO.excluirItem(idItem);
            
            if(ok) {
                System.out.println("Item de carrinho excluído com sucesso!");
                List<Card> listaCards = ProdutoDAO.listaCards();
                request.setAttribute("listaCards", listaCards);
                request.getRequestDispatcher("../../Publico/index.jsp").forward(request, response);
                
                
            } else {
                System.out.println("Falha!");
                response.sendRedirect("Erro.jsp");
            } 
             
          
        }
}
