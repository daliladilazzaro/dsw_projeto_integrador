/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Cliente;

import DAO.ClienteDAO;
import Model.Endereco;
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
public class InativarEndereco extends HttpServlet {

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int idEndereco = Integer.parseInt(request.getParameter("idEndereco"));
        Endereco endereco = ClienteDAO.getEndereco(idEndereco);
        
        String novoStatus ="Inativo";

                boolean ok = ClienteDAO.atualizarStatus(novoStatus, idEndereco);

                // Passo 3: Redirecionar para sucesso.jsp
                if (ok) {
                        System.out.println("Sucesso!");
                } else {
                        System.out.println("Falha!");
                }
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

 

}
