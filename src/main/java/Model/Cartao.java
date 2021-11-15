package Model;


public class Cartao {
    
    private int idCartao;
    private String nome;
    private String numero;
    private int CVV;
    private String expiracao;
    private int fkIdCliente;

    public Cartao(int idCartao, String nome, String numero, int CVV, String expiracao, int fkIdCliente) {
        this.idCartao = idCartao;
        this.nome = nome;
        this.numero = numero;
        this.CVV = CVV;
        this.expiracao = expiracao;
        this.fkIdCliente = fkIdCliente;
    }
    
    public Cartao(String nome, String numero, int CVV, String expiracao, int fkIdCliente) {
        this.nome = nome;
        this.numero = numero;
        this.CVV = CVV;
        this.expiracao = expiracao;
        this.fkIdCliente = fkIdCliente;
    }
    
    public Cartao(){}

    public int getIdCartao() {
        return idCartao;
    }

    public void setIdCartao(int idCartao) {
        this.idCartao = idCartao;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public int getCVV() {
        return CVV;
    }

    public void setCVV(int CVV) {
        this.CVV = CVV;
    }

    public String getExpiracao() {
        return expiracao;
    }

    public void setExpiracao(String expiracao) {
        this.expiracao = expiracao;
    }

    public int getFkIdCliente() {
        return fkIdCliente;
    }

    public void setFkIdCliente(int fkIdCliente) {
        this.fkIdCliente = fkIdCliente;
    }
    
    
    
    
    
    
    
    
    
    
}
