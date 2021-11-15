/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author ygor.oliveira
 */
public class Usuario {
    private int idUsuario;
    private String nome;
    private String CPF;
    private String email;
    private String senha;
    private String grupo;
    private String status;

    public Usuario(int idUsuario, String nome, String CPF, String email, String senha, String grupo, String status) {
        this.idUsuario = idUsuario;
        this.nome = nome;
        this.CPF = CPF;
        this.email = email;
        this.senha = senha;
        this.grupo = grupo;
        this.status = status;
    }

    public Usuario(String nome, String CPF, String email, String senha, String grupo, String status) {
        this.nome = nome;
        this.CPF = CPF;
        this.email = email;
        this.senha = senha;
        this.grupo = grupo;
        this.status = status;
    }
    
    public Usuario(){}
    
    public boolean isEstoquista(){
        return grupo.equalsIgnoreCase("Estoquista");
    }
    
    public boolean isAdmin() {
        return grupo.equalsIgnoreCase("Admin");
    }
    
    public boolean isCliente() {
        return grupo.equalsIgnoreCase("Cliente");
    }
    
    public boolean isNulo() {
        return grupo == null;
    }
    
    
    
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCPF() {
        return CPF;
    }

    public void setCPF(String CPF) {
        this.CPF = CPF;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getGrupo() {
        return grupo;
    }

    public void setGrupo(String grupo) {
        this.grupo = grupo;
    }
    
    
    
    
    
    
}
