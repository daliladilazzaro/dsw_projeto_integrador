
package Model;

public class Endereco {
    
    private int idEndereco;
    private String CEP;
    private String logradouro;
    private String bairro;
    private String cidade;
    private String estado;
    private int numero;
    private String tipo;//Entrega ou cobrança;
    private String padrao;//Principal ou secundário;
    private String status;//Ativo ou inativo (cliente exclui no front);
    private int FKCliente;

    public Endereco(int idEndereco, String CEP, String logradouro, String bairro, String cidade, String estado, int numero, String tipo, String padrao, String status, int FKCliente) {
        this.idEndereco = idEndereco;
        this.CEP = CEP;
        this.logradouro = logradouro;
        this.bairro = bairro;
        this.cidade = cidade;
        this.estado = estado;
        this.numero = numero;
        this.tipo = tipo;
        this.padrao = padrao;
        this.status = status;
        this.FKCliente = FKCliente;
    }
    
    public Endereco(String CEP, String logradouro, String bairro, String cidade, String estado, int numero, String tipo, String padrao, String status, int FKCliente) {
        this.CEP = CEP;
        this.logradouro = logradouro;
        this.bairro = bairro;
        this.cidade = cidade;
        this.estado = estado;
        this.numero = numero;
        this.tipo = tipo;
        this.padrao = padrao;
        this.status = status;
        this.FKCliente = FKCliente;
    }
    
    public Endereco(){}

    public int getIdEndereco() {
        return idEndereco;
    }

    public void setIdEndereco(int idEndereco) {
        this.idEndereco = idEndereco;
    }

    public String getCEP() {
        return CEP;
    }

    public void setCEP(String CEP) {
        this.CEP = CEP;
    }

    public String getLogradouro() {
        return logradouro;
    }

    public void setLogradouro(String logradouro) {
        this.logradouro = logradouro;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getPadrao() {
        return padrao;
    }

    public void setPadrao(String padrao) {
        this.padrao = padrao;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getFKCliente() {
        return FKCliente;
    }

    public void setFKCliente(int FKCliente) {
        this.FKCliente = FKCliente;
    }
    
    

        
}
