/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import static DAO.UsuarioDAO.idUsuario;
import Model.Cliente;
import Model.Endereco;
import Model.Usuario;
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

/**
 *
 * @author ygor.oliveira
 */
public class ClienteDAO {
    public static int idCliente;
    public static int idEndereco;
    
    public static boolean cadastrarCliente(Cliente cliente) {
        boolean ok = true;
        try {
            Connection con = GerenciarConexao.getConexao();
            String query = "insert into cliente(nome, CPF, email, nascimento, genero, senha, fk_id_usuario) values (?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, cliente.getNome());
            ps.setString(2, cliente.getCPF());
            ps.setString(3, cliente.getEmail());
            ps.setString(4, cliente.getNascimento());
            ps.setString(5, cliente.getGenero());
            ps.setString(6, cliente.getSenha());
            ps.setInt(7, cliente.getFKUsuario());
            ps.executeUpdate();
            
            ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                       cliente.setIdCliente(generatedKeys.getInt(1));
                       idCliente = cliente.getIdCliente();
                       System.out.println("ID-Cliente: "+idCliente);
                       
                }
                
                
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
    }
    
    public static boolean cadastrarEndereco(Endereco endereco) {
        boolean ok = true;
        try {
            Connection con = GerenciarConexao.getConexao();
            String query = "insert into endereco(CEP, logradouro, bairro, cidade, estado, numero, tipo, padrao, status, fk_id_cliente) values (?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, endereco.getCEP());
            ps.setString(2, endereco.getLogradouro());
            ps.setString(3, endereco.getBairro());
            ps.setString(4, endereco.getCidade());
            ps.setString(5, endereco.getEstado());
            ps.setInt(6, endereco.getNumero());
            ps.setString(7, endereco.getTipo());
            ps.setString(8, endereco.getPadrao());
            ps.setString(9, endereco.getStatus());
            ps.setInt(10, endereco.getFKCliente());
            ps.executeUpdate();
            
            ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                       endereco.setIdEndereco(generatedKeys.getInt(1));
                       idEndereco = endereco.getIdEndereco();
                       System.out.println("ID-Endereço: "+idEndereco);
                       
                }
                
                
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
    }
    
    public static Cliente getCliente(int idCliente) {
        Cliente cliente = null;
        try {
            Connection con = GerenciarConexao.getConexao();
            String query = "select * from cliente where id_cliente=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idCliente);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                cliente = new Cliente();
                cliente.setIdCliente(rs.getInt("id_cliente"));
                cliente.setNome(rs.getString("nome"));
                cliente.setCPF(rs.getString("CPF"));
                cliente.setEmail(rs.getString("email"));
                cliente.setNascimento(rs.getString("nascimento"));
                cliente.setGenero(rs.getString("genero"));
                cliente.setSenha(rs.getString("senha"));
                cliente.setFKUsuario(rs.getInt("fk_id_usuario"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cliente;
    }
    
    public static boolean atualizarPadroesEndereco(int idCliente) {
       boolean ok = true;
       String query01 = "update endereco set padrao='Complementar' where fk_id_cliente=?";
       Connection conn;
        try {
            conn = GerenciarConexao.getConexao();
            
            PreparedStatement ps01 = conn.prepareStatement(query01);
            ps01.setInt(1, idCliente);

            ps01.executeUpdate();
                
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
   }
     
     public static boolean atualizarPadraoEndereco(int idEndereco) {
       boolean ok = true;
       String query02 = "update endereco set padrao='Principal' where id_endereco=?";
       Connection conn;
        try {
            conn = GerenciarConexao.getConexao();
            
            PreparedStatement ps02  = conn.prepareStatement(query02);
            ps02.setInt(1, idEndereco);

            ps02.executeUpdate();
                
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
   }
    
    public static Endereco getEndereco(int idEndereco) {
        Endereco endereco = null;
        try {
            Connection con = GerenciarConexao.getConexao();
            String query = "select * from endereco where id_endereco=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idEndereco);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                endereco = new Endereco();
                endereco.setIdEndereco(rs.getInt("id_endereco"));
                endereco.setCEP(rs.getString("CEP"));
                endereco.setLogradouro(rs.getString("logradouro"));
                endereco.setBairro(rs.getString("bairro"));
                endereco.setCidade(rs.getString("cidade"));
                endereco.setEstado(rs.getString("estado"));
                endereco.setNumero(rs.getInt("numero"));
                endereco.setTipo(rs.getString("tipo"));
                endereco.setPadrao(rs.getString("padrao"));
                endereco.setStatus(rs.getString("status"));
                endereco.setFKCliente(rs.getInt("fk_id_cliente"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return endereco;
    }
    
    public static Endereco getEnderecoPrincipal(int idCliente) {
        Endereco endereco = null;
        try {
            Connection con = GerenciarConexao.getConexao();
            String query = "select * from endereco where fk_id_cliente=? and padrao='Principal'";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idCliente);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                endereco = new Endereco();
                endereco.setIdEndereco(rs.getInt("id_endereco"));
                endereco.setCEP(rs.getString("CEP"));
                endereco.setLogradouro(rs.getString("logradouro"));
                endereco.setBairro(rs.getString("bairro"));
                endereco.setCidade(rs.getString("cidade"));
                endereco.setEstado(rs.getString("estado"));
                endereco.setNumero(rs.getInt("numero"));
                endereco.setTipo(rs.getString("tipo"));
                endereco.setPadrao(rs.getString("padrao"));
                endereco.setStatus(rs.getString("status"));
                endereco.setFKCliente(rs.getInt("fk_id_cliente"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return endereco;
    }
    
    public static Endereco getEnderecoCobranca(int idCliente) {
        Endereco endereco = null;
        try {
            Connection con = GerenciarConexao.getConexao();
            String query = "select * from endereco\n" +
"   where fk_id_cliente =? and tipo ='Cobrança' and status ='Ativo'";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idCliente);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                endereco = new Endereco();
                endereco.setIdEndereco(rs.getInt("id_endereco"));
                endereco.setCEP(rs.getString("CEP"));
                endereco.setLogradouro(rs.getString("logradouro"));
                endereco.setBairro(rs.getString("bairro"));
                endereco.setCidade(rs.getString("cidade"));
                endereco.setEstado(rs.getString("estado"));
                endereco.setNumero(rs.getInt("numero"));
                endereco.setTipo(rs.getString("tipo"));
                endereco.setPadrao(rs.getString("padrao"));
                endereco.setStatus(rs.getString("status"));
                endereco.setFKCliente(rs.getInt("fk_id_cliente"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return endereco;
    }
    
    public static boolean atualizarStatus(String status, int idEndereco) {
       boolean ok = true;
       String query = "update endereco set status=? where id_endereco=?";
       Connection conn;
        try {
            conn = GerenciarConexao.getConexao();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, status);
            ps.setInt(2, idEndereco);

            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
   }
    
    public static int getIDCliente(int idUsuario) {
        int Id_Cliente = 0;
        try {
            Connection con = GerenciarConexao.getConexao();
            String query = "select id_cliente from usuario\n" +
"   inner join cliente on usuario.id_usuario = cliente.fk_id_usuario\n" +
"   where id_usuario = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idUsuario);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Id_Cliente = rs.getInt("id_cliente");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Id_Cliente;
    }
    
    public static List<Endereco> listaEnderecos(int idCliente) {
        List<Endereco> enderecos = new ArrayList<>();
        String query = "select id_endereco, CEP, logradouro,\n" +
"   bairro, cidade, estado, numero,\n" +
"   tipo, padrao, status, fk_id_cliente from endereco\n" +
"   inner join cliente on endereco.fk_id_cliente = cliente.id_cliente\n" +
"   where id_cliente = ? and status='Ativo'";
        Connection con;
        try {
            con = GerenciarConexao.getConexao();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,idCliente);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                int id_Endereco = rs.getInt("id_endereco");
                String CEP = rs.getString("CEP");
                String logradouro = rs.getString("logradouro");
                String bairro = rs.getString("bairro");
                String cidade = rs.getString("cidade");
                String estado = rs.getString("estado");
                int numero = rs.getInt("numero");
                String tipo = rs.getString("tipo");
                String padrao = rs.getString("padrao");
                String status = rs.getString("status");
                int FKCliente = rs.getInt("fk_id_cliente");
               
                Endereco endereco = new Endereco(id_Endereco, CEP, logradouro, bairro, cidade, 
                        estado, numero, tipo, padrao, status, FKCliente);
                
                enderecos.add(endereco);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return enderecos;   
    }
    
    public static List<Endereco> listaEnderecosEntrega(int idCliente) {
        List<Endereco> enderecos = new ArrayList<>();
        String query = "select id_endereco, CEP, logradouro,\n" +
"   bairro, cidade, estado, numero,\n" +
"   tipo, padrao, status, fk_id_cliente from endereco\n" +
"   inner join cliente on endereco.fk_id_cliente = cliente.id_cliente\n" +
"   where id_cliente = ? and status='Ativo' and tipo ='Entrega' order by tipo";
        Connection con;
        try {
            con = GerenciarConexao.getConexao();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,idCliente);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                int id_Endereco = rs.getInt("id_endereco");
                String CEP = rs.getString("CEP");
                String logradouro = rs.getString("logradouro");
                String bairro = rs.getString("bairro");
                String cidade = rs.getString("cidade");
                String estado = rs.getString("estado");
                int numero = rs.getInt("numero");
                String tipo = rs.getString("tipo");
                String padrao = rs.getString("padrao");
                String status = rs.getString("status");
                int FKCliente = rs.getInt("fk_id_cliente");
               
                Endereco endereco = new Endereco(id_Endereco, CEP, logradouro, bairro, cidade, 
                        estado, numero, tipo, padrao, status, FKCliente);
                
                enderecos.add(endereco);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return enderecos;   
    }
    
    public static boolean atualizarCliente(Cliente cliente) {
       boolean ok = true;
       String query = "update cliente set nome=?, CPF=?, email=?, nascimento=?, genero=?, senha=? where id_cliente=?";
       Connection conn;
        try {
            conn = GerenciarConexao.getConexao();
            PreparedStatement ps = conn.prepareStatement(query);
             ps.setString(1, cliente.getNome());
            ps.setString(2, cliente.getCPF());
            ps.setString(3, cliente.getEmail());
            ps.setString(4, cliente.getNascimento());
            ps.setString(5, cliente.getGenero());
            ps.setString(6, cliente.getSenha());
            ps.setInt(7, cliente.getIdCliente());

            ps.executeUpdate();
                
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
   }
    
    public static boolean atualizarClienteNoPassword(Cliente cliente) {
       boolean ok = true;
       String query = "update cliente set nome=?, CPF=?, email=?, nascimento=?, genero=? where id_cliente=?";
       Connection conn;
        try {
            conn = GerenciarConexao.getConexao();
            PreparedStatement ps = conn.prepareStatement(query);
             ps.setString(1, cliente.getNome());
            ps.setString(2, cliente.getCPF());
            ps.setString(3, cliente.getEmail());
            ps.setString(4, cliente.getNascimento());
            ps.setString(5, cliente.getGenero());
            ps.setInt(6, cliente.getIdCliente());

            ps.executeUpdate();
                
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
   }
    
}
