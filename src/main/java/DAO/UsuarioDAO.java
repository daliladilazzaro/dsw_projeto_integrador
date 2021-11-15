/**
 *
 * @author Ygor Oliveira | Yasmim Candelária | Juan Dias | Filipe Vital
 */

package DAO;

import static DAO.ProdutoDAO.idProduto;
import Model.Cliente;
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


public class UsuarioDAO {
    public static int idUsuario;
    
    public static boolean cadastrarUsuario(Usuario usuario) {
        boolean ok = true;
        try {
            Connection con = GerenciarConexao.getConexao();
            String query = "insert into usuario(nome, CPF, email, senha, grupo, status) values (?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, usuario.getNome());
            ps.setString(2, usuario.getCPF());
            ps.setString(3, usuario.getEmail());
            ps.setString(4, usuario.getSenha());
            ps.setString(5, usuario.getGrupo());
            ps.setString(6, usuario.getStatus());  
            ps.executeUpdate();
            
            ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                       usuario.setIdUsuario(generatedKeys.getInt(1));
                       idUsuario = usuario.getIdUsuario();
                       System.out.println("ID-Usuário: "+idUsuario);
                       
                }
                
                
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
    }
    
    public static Usuario getUsuario(String login) {
        Usuario usuario = null;
        try {
            Connection con = GerenciarConexao.getConexao();
            String query = "select * from usuario where email=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, login);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                usuario = new Usuario();
                usuario.setIdUsuario(rs.getInt("id_usuario"));
                usuario.setNome(rs.getString("nome"));
                usuario.setCPF(rs.getString("CPF"));
                usuario.setEmail(login);
                usuario.setGrupo(rs.getString("grupo"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setStatus(rs.getString("status"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return usuario;
        
        
    }
    
    public static Usuario getUsuarioCPF(String CPF) {
        Usuario usuario = null;
        try {
            Connection con = GerenciarConexao.getConexao();
            String query = "select * from usuario where CPF=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, CPF);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                usuario = new Usuario();
                usuario.setNome(rs.getString("nome"));
                usuario.setCPF(CPF);
                usuario.setEmail(rs.getString("email"));
                usuario.setGrupo(rs.getString("grupo"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setStatus(rs.getString("status"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return usuario;
        
        
    }
    
    public static List<Usuario> listaUsuarios() {
        List<Usuario> usuarios = new ArrayList<>();
        String query = "select * from usuario where grupo !='Cliente'";
        Connection con;
        try {
            con = GerenciarConexao.getConexao();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                int idUsuario = rs.getInt("id_usuario");
                String nome = rs.getString("nome");
                String CPF = rs.getString("CPF");
                String email = rs.getString("email");
                String senha = rs.getString("senha");
                String grupo = rs.getString("grupo");
                String status = rs.getString("status");
                
                Usuario usuario = new Usuario(idUsuario, nome, CPF, email, senha, grupo, status);
                usuarios.add(usuario);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return usuarios;
    }
    
    public static List<Usuario> listaUsuariosEstoquista(String login) {
        List<Usuario> usuarios = new ArrayList<>();
        String query = "select * from usuario where email =?";
        Connection con;
        try {
            con = GerenciarConexao.getConexao();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, login);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                int idUsuario = rs.getInt("id_usuario");
                String nome = rs.getString("nome");
                String CPF = rs.getString("CPF");
                String email = rs.getString("email");
                String senha = rs.getString("senha");
                String grupo = rs.getString("grupo");
                String status = rs.getString("status");
                
                Usuario usuario = new Usuario(idUsuario, nome, CPF, email, senha, grupo, status);
                usuarios.add(usuario);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return usuarios;
    }
    
    public static boolean atualizarStatus(String status, String email) {
       boolean ok = true;
       String query = "update usuario set status=? where email=?";
       Connection conn;
        try {
            conn = GerenciarConexao.getConexao();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, status);
            ps.setString(2, email);

            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
   }
    
    public static boolean atualizarUsuario(Usuario usuario) {
       boolean ok = true;
       String query = "update usuario set nome=?, CPF=?, email=?, senha=?, grupo=?, status=? where email=?";
       Connection conn;
        try {
            conn = GerenciarConexao.getConexao();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, usuario.getNome());
            ps.setString(2, usuario.getCPF());
            ps.setString(3, usuario.getEmail());
            ps.setString(4, usuario.getSenha());
            ps.setString(5, usuario.getGrupo());
            ps.setString(6, usuario.getStatus());
            ps.setString(7, usuario.getEmail());

            ps.executeUpdate();
                
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
   }
    
    public static boolean atualizarUsuarioNoPassword(Usuario usuario) {
       boolean ok = true;
       String query = "update usuario set nome=?, CPF=?, email=?, grupo=?, status=? where email=?";
       Connection conn;
        try {
            conn = GerenciarConexao.getConexao();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, usuario.getNome());
            ps.setString(2, usuario.getCPF());
            ps.setString(3, usuario.getEmail());
            ps.setString(4, usuario.getGrupo());
            ps.setString(5, usuario.getStatus());
            ps.setString(6, usuario.getEmail());

            ps.executeUpdate();
                
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            ok = false;
        }
        return ok;
   }
    
}
