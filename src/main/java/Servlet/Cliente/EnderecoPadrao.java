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
public class EnderecoPadrao extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int idEndereco = Integer.parseInt(request.getParameter("idEndereco"));
        int idUsuario = Integer.parseInt(request.getParameter("id_usuario"));
        
        Endereco endereco = ClienteDAO.getEndereco(idEndereco);
        
            
            int FkCliente = endereco.getFKCliente();
            
            boolean ok = ClienteDAO.atualizarPadroesEndereco(FkCliente);
            boolean ok02 = ClienteDAO.atualizarPadraoEndereco(idEndereco);
            
            if (ok && ok02) {
                System.out.println("Sucesso!");
                response.sendRedirect("alterar-cliente"
                                    + "?id_usuario="+idUsuario);
            } else {
                System.out.println("Falha!");
                response.sendRedirect("Erro.jsp");
            }
     
           
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        
    }

}
