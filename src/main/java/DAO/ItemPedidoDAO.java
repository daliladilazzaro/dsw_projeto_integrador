
package DAO;

import Model.ItemPedido;
import Model.Pedido;
import Utils.GerenciarConexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;


public class ItemPedidoDAO {
    
    public static int idItemPedido;
    
    
    public static boolean salvarItemPedido(ItemPedido item) {
        boolean ok = true;
        try {
            Connection con = GerenciarConexao.getConexao();
            String query = "insert into item_pedido(valor_unitario, qtd_comprada, fk_id_produto, fk_id_pedido) values (?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
            ps.setDouble(1, item.getPreco());
            ps.setInt(2, item.getQtdVendida());
            ps.setInt(3, item.getFkIdProduto());
            ps.setInt(4, item.getFkIdPedido());
            ps.executeUpdate();
            
            ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                       item.setIdItem(generatedKeys.getInt(1));
                       idItemPedido = item.getIdItem();
                       System.out.println("ID-Item do pedido: "+idItemPedido);
                }
        } catch (SQLException ex) {
            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
    }
    
    public static boolean atualizarEstoque(int idProduto, int qtdVendida) {
       boolean ok = true;
       String query = "update produto set qtd_estoque = qtd_estoque - ? where id_produto = ?";
       Connection conn;
        try {
            conn = GerenciarConexao.getConexao();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, qtdVendida);
            ps.setInt(2, idProduto);

            ps.executeUpdate();
                
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
   }
    
    public static boolean DeletarCheckout(int idCliente, int idUsuario) {
       boolean ok = true;
       String query = "delete from checkout where fk_id_cliente = ?";
       String query02 = "delete from carrinho where fk_id_usuario = ?";
       Connection conn;
        try {
            conn = GerenciarConexao.getConexao();
            PreparedStatement ps = conn.prepareStatement(query);
            PreparedStatement ps02 = conn.prepareStatement(query02);
            ps.setInt(1, idCliente);
            ps02.setInt(1, idUsuario);

            ps.executeUpdate();
            ps02.executeUpdate();
                
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
   }


    
    
}
