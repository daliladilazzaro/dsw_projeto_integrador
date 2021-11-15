
package DAO;

import static DAO.CheckoutDAO.idCheckOut;
import Model.Cartao;
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


public class CartaoDAO {
    public static int idCartao;
    
    public static boolean cadastrarCartao(Cartao cartao) {
        boolean ok = true;
        try {
            Connection con = GerenciarConexao.getConexao();
            String query = "insert into cartao(nome, numero, CVV, expiracao, fk_id_cliente) values (?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, cartao.getNome());
            ps.setString(2, cartao.getNumero());
            ps.setInt(3, cartao.getCVV());
            ps.setString(4, cartao.getExpiracao()); 
            ps.setInt(5, cartao.getFkIdCliente());
            ps.executeUpdate();
            
            ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                       cartao.setIdCartao(generatedKeys.getInt(1));
                       idCartao = cartao.getIdCartao();
                       System.out.println("ID-Cartão: "+idCartao);
                }
                
                
        } catch (SQLException ex) {
            Logger.getLogger(CartaoDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
    }
    
    public static List<Cartao> listaCartao(int idCliente) {
        List<Cartao> itens = new ArrayList<>();
        String query = "select * from cartao where fk_id_cliente = ?";
        Connection con;
        try {
            con = GerenciarConexao.getConexao();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,idCliente);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                int IDCartao = rs.getInt("id_cartao");
                String nome = rs.getString("nome");
                String numero = rs.getString("numero");
                int CVV = rs.getInt("CVV");
                String expiracao = rs.getString("expiracao");
                int fkIdCliente = rs.getInt("fk_id_cliente");
               
                Cartao cartao = new Cartao(IDCartao, nome, numero, CVV, expiracao, fkIdCliente);
                itens.add(cartao);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return itens;   
    }
    
    public static Cartao getCartao(int idCartao) {
        Cartao cartao = null;
        try {
            Connection con = GerenciarConexao.getConexao();
            String query = "select * from cartao where id_cartao=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idCartao);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                cartao = new Cartao();
                cartao.setIdCartao(rs.getInt("id_cartao"));
                cartao.setNome(rs.getString("nome"));
                cartao.setNumero(rs.getString("numero"));
                cartao.setCVV(rs.getInt("CVV"));
                cartao.setExpiracao(rs.getString("expiracao"));
                cartao.setFkIdCliente(rs.getInt("fk_id_cliente"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cartao;
    }
    
    
    
}