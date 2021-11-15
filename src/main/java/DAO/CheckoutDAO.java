
package DAO;

import Model.Checkout;
import Utils.GerenciarConexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CheckoutDAO {
    
    public static int idCheckOut;
    
    public static boolean AddEndereco(Checkout checkout) {
        boolean ok = true;
        try {
            Connection con = GerenciarConexao.getConexao();
            String query = "insert into checkout(fk_id_cliente, fk_id_endereco, frete) values (?,?,?)";
            PreparedStatement ps = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, checkout.getFkIdCliente());
            ps.setInt(2, checkout.getFkIdEndereco());
            ps.setDouble(3, checkout.getFrete()); 
            ps.executeUpdate();
            
            ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                       checkout.setIdCheckout(generatedKeys.getInt(1));
                       idCheckOut = checkout.getIdCheckout();
                       System.out.println("ID-Checkout: "+idCheckOut);
                }
                
                
        } catch (SQLException ex) {
            Logger.getLogger(CheckoutDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
    }
    
    public static Checkout getCliente(int idCliente) {
        Checkout checkout = null;
        try {
            Connection con = GerenciarConexao.getConexao();
            String query = "select * from checkout where fk_id_cliente=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idCliente);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                checkout = new Checkout();
                checkout.setFkIdCliente(rs.getInt("fk_id_cliente"));
                checkout.setFkIdEndereco(rs.getInt("fk_id_endereco"));
                checkout.setFrete(rs.getDouble("frete"));
                checkout.setPagamento(rs.getString("forma_pagamento"));
                checkout.setFkIdCartao(rs.getInt("fk_id_cartao"));
                checkout.setQtdParcelas(rs.getInt("qtd_parcelas"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return checkout;
    }
    
    public static boolean atualizarCheckoutEndereco(int idCliente, int idEndereco, double frete) {
       boolean ok = true;
       String query = "update checkout set fk_id_endereco = ?, frete = ?"
               + "where fk_id_cliente = ?";
       Connection conn;
        try {
            conn = GerenciarConexao.getConexao();
            
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, idEndereco);
            ps.setDouble(2, frete);
            ps.setInt(3, idCliente);

            ps.executeUpdate();
                
        } catch (SQLException ex) {
            Logger.getLogger(CarrinhoDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
   }
    
    public static boolean atualizarCheckoutCartao(int idCliente, String formaPagamento, int idCartao, int qtdParcelas) {
       boolean ok = true;
       String query = "update checkout set forma_pagamento = ?, fk_id_cartao= ?, qtd_parcelas =?"
               + "where fk_id_cliente = ?";
       Connection conn;
        try {
            conn = GerenciarConexao.getConexao();
            
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, formaPagamento);
            ps.setInt(2, idCartao);
            ps.setInt(3, qtdParcelas);
            ps.setInt(4, idCliente);

            ps.executeUpdate();
                
        } catch (SQLException ex) {
            Logger.getLogger(CarrinhoDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
   }
    
    public static boolean atualizarCheckoutBoleto(int idCliente, String formaPagamento, int qtdParcelas) {
       boolean ok = true;
       String query = "update checkout set forma_pagamento = ?, fk_id_cartao= null, qtd_parcelas =?"
               + "where fk_id_cliente = ?";
       Connection conn;
        try {
            conn = GerenciarConexao.getConexao();
            
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, formaPagamento);
            ps.setInt(2, qtdParcelas);
            ps.setInt(3, idCliente);

            ps.executeUpdate();
                
        } catch (SQLException ex) {
            Logger.getLogger(CarrinhoDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
   }
    
     public static List<Checkout> listaCheckout(int idCliente) {
        List<Checkout> itens = new ArrayList<>();
        String query = "select * from checkout where fk_id_cliente = ?";
        Connection con;
        try {
            con = GerenciarConexao.getConexao();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,idCliente);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                int idCheckout = rs.getInt("id_checkout");
                int fkIdCliente = rs.getInt("fk_id_cliente");
                int fkIdEndereco = rs.getInt("fk_id_endereco");
                double frete = rs.getDouble("frete");
                String pagamento = rs.getString("forma_pagamento");
                int fkIdCartao = rs.getInt("fk_id_cartao");
                int qtdParcelas = rs.getInt("qtd_parcelas");
               
                Checkout checkout = new Checkout(idCheckout, fkIdCliente, fkIdEndereco, frete, pagamento, fkIdCartao, qtdParcelas);
                itens.add(checkout);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return itens;   
    }
     
     public static List<Checkout> listaCheckoutPagamentos(int idCliente) {
        List<Checkout> itens = new ArrayList<>();
        String query = "select * from checkout where fk_id_cliente = ? and forma_pagamento like '%t%'";
        Connection con;
        try {
            con = GerenciarConexao.getConexao();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,idCliente);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                int idCheckout = rs.getInt("id_checkout");
                int fkIdCliente = rs.getInt("fk_id_cliente");
                int fkIdEndereco = rs.getInt("fk_id_endereco");
                double frete = rs.getDouble("frete");
                String pagamento = rs.getString("forma_pagamento");
                int fkIdCartao = rs.getInt("fk_id_cartao");
                int qtdParcelas = rs.getInt("qtd_parcelas");
               
                Checkout checkout = new Checkout(idCheckout, fkIdCliente, fkIdEndereco, frete, pagamento, fkIdCartao, qtdParcelas);
                itens.add(checkout);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return itens;   
    }
    
    
    
}
