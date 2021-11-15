
package Model;

//O cliente só existe se tiver um usuário criado;
public class Cliente {
    
    private int idCliente;
    private String nome;
    private String CPF;
    private String email;
    private String nascimento;
    private String genero;
    private String senha;
    private int FKUsuario;

    public Cliente(int idCliente, String nome, String CPF, String email, String nascimento, String genero, String senha, int FKUsuario) {
        this.idCliente = idCliente;
        this.nome = nome;
        this.CPF = CPF;
        this.email = email;
        this.nascimento = nascimento;
        this.genero = genero;
        this.senha = senha;
        this.FKUsuario = FKUsuario;
    }
    
    public Cliente(String nome, String CPF, String email, String nascimento, String genero, String senha, int FKUsuario) {
        this.nome = nome;
        this.CPF = CPF;
        this.email = email;
        this.nascimento = nascimento;
        this.genero = genero;
        this.senha = senha;
        this.FKUsuario = FKUsuario;
    }
    
    public Cliente(){}

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
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

    public String getNascimento() {
        return nascimento;
    }

    public void setNascimento(String nascimento) {
        this.nascimento = nascimento;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public int getFKUsuario() {
        return FKUsuario;
    }

    public void setFKUsuario(int FKUsuario) {
        this.FKUsuario = FKUsuario;
    }
    
    
    
    
    
}
