/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Carrinho;
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

public class CarrinhoDAO {
    
    public static int idItem;
    
    public static boolean AddProdutoLogado(Carrinho item) {
        boolean ok = true;
        try {
            Connection con = GerenciarConexao.getConexao();
            String query = "insert into carrinho(qtd_desejada, nome_cliente, fk_id_produto, fk_id_usuario) values (?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, item.getQtdDesejada());
            ps.setString(2, item.getNomeCliente());
            ps.setInt(3, item.getFkProduto());
            ps.setInt(4, item.getFkUsuario()); 
            ps.executeUpdate();
            
            ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                       item.setIdItem(generatedKeys.getInt(1));
                       idItem = item.getIdItem();
                       System.out.println("ID-Item: "+idItem);
                }
                
                
        } catch (SQLException ex) {
            Logger.getLogger(CarrinhoDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
    }
    
    public static boolean AddProdutoDeslogado(Carrinho item) {
        boolean ok = true;
        try {
            Connection con = GerenciarConexao.getConexao();
            String query = "insert into carrinho(qtd_desejada, nome_cliente, fk_id_produto) values (?,?,?)";
            PreparedStatement ps = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, item.getQtdDesejada());
            ps.setString(2, item.getNomeCliente());
            ps.setInt(3, item.getFkProduto());
            ps.executeUpdate();
            
            ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                       item.setIdItem(generatedKeys.getInt(1));
                       idItem = item.getIdItem();
                       System.out.println("ID-Item: "+idItem);
                }
                
                
        } catch (SQLException ex) {
            Logger.getLogger(CarrinhoDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
    }
    
    public static List<Carrinho> listaCarrinhoLogado(int idUsuario) {
        List<Carrinho> itens = new ArrayList<>();
        String query = "select id_item, produto.nome, imagem.nome, \n" +
"   produto.avaliacao, qtd_desejada, \n" +
"   produto.preco, fk_id_usuario, nome_cliente, carrinho.fk_id_produto, produto.qtd_estoque from carrinho \n" +
"   inner join produto on carrinho.fk_id_produto = produto.id_produto\n" +
"   inner join imagem on carrinho.fk_id_produto = imagem.fk_id_produto\n" +
"   where fk_id_usuario = ? and imagem.PADRAO='Principal'";
        Connection con;
        try {
            con = GerenciarConexao.getConexao();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,idUsuario);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                int IDItem = rs.getInt("id_item");
                String nomeProduto = rs.getString(2);
                String nomeImagem = rs.getString(3);
                String avaliacaoProduto = rs.getString("avaliacao");
                int qtdDesejada = rs.getInt("qtd_desejada");
                double precoProduto = rs.getDouble("preco");
                int fkUsuario = rs.getInt("fk_id_usuario");
                String nomeCliente = rs.getString("nome_cliente");
                int fkProduto = rs.getInt("fk_id_produto");
                int qtdEstoque = rs.getInt("qtd_estoque");
               
                Carrinho item = new Carrinho(IDItem, nomeProduto, nomeImagem, avaliacaoProduto, qtdDesejada, precoProduto, fkUsuario, nomeCliente, fkProduto, qtdEstoque);
                itens.add(item);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return itens;   
    }
    
    public static List<Carrinho> listaCarrinhoDeslogado(String nomeCliente) {
        List<Carrinho> itens = new ArrayList<>();
        String query = "select id_item, produto.nome, imagem.nome, \n" +
"   produto.avaliacao, qtd_desejada, \n" +
"   produto.preco, fk_id_usuario, nome_cliente, carrinho.fk_id_produto, produto.qtd_estoque from carrinho \n" +
"   inner join produto on carrinho.fk_id_produto = produto.id_produto\n" +
"   inner join imagem on carrinho.fk_id_produto = imagem.fk_id_produto\n" +
"   where nome_cliente = ? and imagem.PADRAO='Principal'";
        Connection con;
        try {
            con = GerenciarConexao.getConexao();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,nomeCliente);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                int IDItem = rs.getInt("id_item");
                String nomeProduto = rs.getString(2);
                String nomeImagem = rs.getString(3);
                String avaliacaoProduto = rs.getString("avaliacao");
                int qtdDesejada = rs.getInt("qtd_desejada");
                double precoProduto = rs.getDouble("preco");
                int fkUsuario = rs.getInt("fk_id_usuario");
                String NOMECliente = rs.getString("nome_cliente");
                int fkProduto = rs.getInt("fk_id_produto");
                int qtdEstoque = rs.getInt("qtd_estoque");
               
                Carrinho item = new Carrinho(IDItem, nomeProduto, nomeImagem, avaliacaoProduto, qtdDesejada, precoProduto, fkUsuario, NOMECliente, fkProduto, qtdEstoque);
                itens.add(item);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return itens;   
    }
    
    public static boolean atualizarSessaoCarrinho(String  nomeCliente, String userAgent, int idUsuario) {
       boolean ok = true;
       String query = "update carrinho set nome_cliente = ? \n" +
"   where nome_cliente = ?";
       
       String query02 = "update carrinho set fk_id_usuario = ? \n" +
"   where nome_cliente = ?";
       
       Connection conn;
        try {
            conn = GerenciarConexao.getConexao();
            
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, nomeCliente);
            ps.setString(2, userAgent);
            
            PreparedStatement ps02 = conn.prepareStatement(query02);
            ps02.setInt(1, idUsuario);
            ps02.setString(2, nomeCliente);

            ps.executeUpdate();
            ps02.executeUpdate();
                
        } catch (SQLException ex) {
            Logger.getLogger(CarrinhoDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
   }
    
    public static boolean excluirItem(int idItem) {
       boolean ok = true;
       String query = "delete from carrinho where id_item=?";
       Connection conn;
        try {
            conn = GerenciarConexao.getConexao();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, idItem);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
   }
    
    public static boolean AttQtd(int idItem, int novaQtd) {
       boolean ok = true;
       String query = "delete from carrinho where id_item=?";
       Connection conn;
        try {
            conn = GerenciarConexao.getConexao();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, idItem);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
   }
    
    public static Carrinho getItemLogado(int idProduto, int idUsuario) {
        Carrinho item = null;
        try {
            Connection con = GerenciarConexao.getConexao();
            String query = "select * from carrinho where fk_id_produto=? and fk_id_usuario=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idProduto);
            ps.setInt(2, idUsuario);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                item = new Carrinho();
                item.setQtdDesejada(rs.getInt("qtd_desejada"));
                item.setNomeCliente(rs.getString("nome_cliente"));
                item.setFkProduto(idProduto);
               
            }
        } catch (SQLException ex) {
            Logger.getLogger(CarrinhoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return item; 
    }
    
    public static Carrinho getItemDeslogado(int idProduto, String nomeCliente) {
        Carrinho item = null;
        try {
            Connection con = GerenciarConexao.getConexao();
            String query = "select * from carrinho where fk_id_produto=? and nome_cliente=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idProduto);
            ps.setString(2, nomeCliente);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                item = new Carrinho();
                item.setQtdDesejada(rs.getInt("qtd_desejada"));
                item.setNomeCliente(rs.getString("nome_cliente"));
                item.setFkProduto(idProduto);
               
            }
        } catch (SQLException ex) {
            Logger.getLogger(CarrinhoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return item; 
    }
    
    public static boolean atualizarQtdItemLogado(int idProduto, int idUsuario) {
       boolean ok = true;
       String query = "update carrinho set qtd_desejada = qtd_desejada+1\n" +
"   where fk_id_produto =  ? and fk_id_usuario = ?";
       Connection conn;
        try {
            conn = GerenciarConexao.getConexao();
            
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, idProduto);
            ps.setInt(2, idUsuario);

            ps.executeUpdate();
                
        } catch (SQLException ex) {
            Logger.getLogger(CarrinhoDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
   }
    
    public static boolean atualizarQtdItemDeslogado(int idProduto, String nomeCliente) {
       boolean ok = true;
       String query = "update carrinho set qtd_desejada = qtd_desejada+1\n" +
"   where fk_id_produto =  ? and nome_cliente = ?";
       Connection conn;
        try {
            conn = GerenciarConexao.getConexao();
            
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, idProduto);
            ps.setString(2, nomeCliente);

            ps.executeUpdate();
                
        } catch (SQLException ex) {
            Logger.getLogger(CarrinhoDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
   }
    
    public static boolean AttQtdItem(int idItem, int novaQtd) {
       boolean ok = true;
       String query = "update carrinho set qtd_desejada = ?\n" +
"   where id_item =  ?";
       Connection conn;
        try {
            conn = GerenciarConexao.getConexao();
            
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, novaQtd);
            ps.setInt(2, idItem);

            ps.executeUpdate();
                
        } catch (SQLException ex) {
            Logger.getLogger(CarrinhoDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
   }
    
}
