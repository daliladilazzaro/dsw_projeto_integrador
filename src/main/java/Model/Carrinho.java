
package Model;


public class Carrinho {
    
    private int idItem;
    private String nomeProduto;
    private String nomeImagem;
    private String avaliacaoProduto;
    private int qtdDesejada;
    private double precoProduto;
    private int fkUsuario;
    private String nomeCliente; //Usar o user-agent para insert no banco caso o cliente esteja deslogado;
    private int fkProduto;
    private int qtdEstoque;
    
    public Carrinho(){}

    public Carrinho(int idItem, int qtdDesejada, String nomeCliente, int fkProduto, int fkUsuario) {
        this.idItem = idItem;
        this.qtdDesejada = qtdDesejada;
        this.nomeCliente = nomeCliente;
        this.fkProduto = fkProduto;
        this.fkUsuario = fkUsuario;
    }
    
    public Carrinho(int qtdDesejada, String nomeCliente, int fkProduto, int fkUsuario) {
        this.qtdDesejada = qtdDesejada;
        this.nomeCliente = nomeCliente;
        this.fkProduto = fkProduto;
        this.fkUsuario = fkUsuario;
    }
    public Carrinho(int qtdDesejada, String nomeCliente, int fkProduto) {
        this.qtdDesejada = qtdDesejada;
        this.nomeCliente = nomeCliente;
        this.fkProduto = fkProduto;
    }

    public Carrinho(int idItem, String nomeProduto, String nomeImagem, String avaliacaoProduto, int qtdDesejada, double precoProduto, int fkUsuario, String nomeCliente, int fkProduto, int qtdEstoque) {
        this.idItem = idItem;
        this.nomeProduto = nomeProduto;
        this.nomeImagem = nomeImagem;
        this.avaliacaoProduto = avaliacaoProduto;
        this.qtdDesejada = qtdDesejada;
        this.precoProduto = precoProduto;
        this.fkUsuario = fkUsuario;
        this.nomeCliente = nomeCliente;
        this.fkProduto = fkProduto;
        this.qtdEstoque = qtdEstoque;
    }

    public int getIdItem() {
        return idItem;
    }

    public void setIdItem(int idItem) {
        this.idItem = idItem;
    }

    public int getQtdEstoque() {
        return qtdEstoque;
    }

    public void setQtdEstoque(int qtdEstoque) {
        this.qtdEstoque = qtdEstoque;
    }
    
    

    

    public int getQtdDesejada() {
        return qtdDesejada;
    }

    public void setQtdDesejada(int qtdDesejada) {
        this.qtdDesejada = qtdDesejada;
    }

    public String getNomeCliente() {
        return nomeCliente;
    }

    public void setNomeCliente(String nomeCliente) {
        this.nomeCliente = nomeCliente;
    }

    public int getFkProduto() {
        return fkProduto;
    }

    public void setFkProduto(int fkProduto) {
        this.fkProduto = fkProduto;
    }

    public int getFkUsuario() {
        return fkUsuario;
    }

    public void setFkUsuario(int fkUsuario) {
        this.fkUsuario = fkUsuario;
    }

    public String getNomeProduto() {
        return nomeProduto;
    }

    public void setNomeProduto(String nomeProduto) {
        this.nomeProduto = nomeProduto;
    }

    public String getNomeImagem() {
        return nomeImagem;
    }

    public void setNomeImagem(String nomeImagem) {
        this.nomeImagem = nomeImagem;
    }

    public String getAvaliacaoProduto() {
        return avaliacaoProduto;
    }

    public void setAvaliacaoProduto(String avaliacaoProduto) {
        this.avaliacaoProduto = avaliacaoProduto;
    }

    public double getPrecoProduto() {
        return precoProduto;
    }

    public void setPrecoProduto(double precoProduto) {
        this.precoProduto = precoProduto;
    }
    
    

    
}
