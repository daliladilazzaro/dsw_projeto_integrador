
package DAO;

import static DAO.ProdutoDAO.idProduto;
import Model.Pedido;
import Model.Produto;
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

public class PedidoDAO {
    
    public static int idPedido;
    
    
    public static boolean salvarPedidoBoleto(Pedido pedido) {
        boolean ok = true;
        try {
            Connection con = GerenciarConexao.getConexao();
            String query = "insert into pedido(data_pedido, numero, sub_total, frete, total, forma_pagamento, qtd_parcelas, status, fk_id_cliente, fk_id_endereco) values (?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, pedido.getData());
            ps.setString(2, pedido.getNumero());
            ps.setDouble(3, pedido.getSubTotal());
            ps.setDouble(4, pedido.getFrete());
            ps.setDouble(5, pedido.getTotal());
            ps.setString(6, pedido.getFormaPagamento());
            ps.setInt(7, pedido.getQtdParcelas());
            ps.setString(8, pedido.getStatus()); 
            ps.setInt(9, pedido.getFkIdCliente());
            ps.setInt(10, pedido.getFkIdEndereco());
            ps.executeUpdate();
            
            ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                       pedido.setIdPedido(generatedKeys.getInt(1));
                       idPedido = pedido.getIdPedido();
                       System.out.println("ID-Pedido: "+idPedido);
                       
                }
        } catch (SQLException ex) {
            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
    }
    
    public static boolean salvarPedidoCartao(Pedido pedido) {
        boolean ok = true;
        try {
            Connection con = GerenciarConexao.getConexao();
            String query = "insert into pedido(data_pedido, numero, sub_total, frete, total, forma_pagamento, qtd_parcelas, status, fk_id_cliente, fk_id_endereco, fk_id_cartao) values (?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, pedido.getData());
            ps.setString(2, pedido.getNumero());
            ps.setDouble(3, pedido.getSubTotal());
            ps.setDouble(4, pedido.getFrete());
            ps.setDouble(5, pedido.getTotal());
            ps.setString(6, pedido.getFormaPagamento());
            ps.setInt(7, pedido.getQtdParcelas());
            ps.setString(8, pedido.getStatus()); 
            ps.setInt(9, pedido.getFkIdCliente());
            ps.setInt(10, pedido.getFkIdEndereco());
            ps.setInt(11, pedido.getFkIdCartao());
            ps.executeUpdate();
            
            ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                       pedido.setIdPedido(generatedKeys.getInt(1));
                       idPedido = pedido.getIdPedido();
                       System.out.println("ID-Pedido: "+idPedido);
                       
                }
        } catch (SQLException ex) {
            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
    }
    
   public static List<Pedido> listaPedidos(int idCliente) {
        List<Pedido> pedidos = new ArrayList<>();
        String query = "select * from pedido where fk_id_cliente = ? order by id_pedido desc";
        Connection con;
        try {
            con = GerenciarConexao.getConexao();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,idCliente);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                int IDPedido = rs.getInt("id_pedido");
                String data = rs.getString("data_pedido");
                String numero = rs.getString("numero");
                double subTotal = rs.getDouble("sub_total");
                double frete = rs.getDouble("frete");
                double total = rs.getDouble("total");
                String formaPagamento = rs.getString("forma_pagamento");
                int qtdParcelas = rs.getInt("qtd_parcelas");
                String status = rs.getString("status");
                int fkIdCliente = rs.getInt("fk_id_cliente");
                int fkIdEndereco = rs.getInt("fk_id_endereco");
                int fkIdCartao = rs.getInt("fk_id_cartao");
                
                Pedido pedido = new Pedido(IDPedido, data, numero, subTotal, frete, total,
                formaPagamento, qtdParcelas, status, fkIdCliente, fkIdEndereco, fkIdCartao);
                pedidos.add(pedido);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pedidos;   
    }
     
}
