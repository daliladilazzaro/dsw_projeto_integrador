
package Model;

public class Card {
    //imagens:
    private int idImagem;
    private String nomeImagem;
    private String padrao;
    private int FKProduto;

    //produtos:
    private int idProduto;
    private String nomeProd;
    private String avaliacao;
    private String descricao;
    private String status;
    private double preco;
    private int qtdEstoque;

    public Card(int idImagem, String nomeImagem, String padrao, int FKProduto, int idProduto, String nomeProd, String avaliacao, String descricao, String status, double preco, int qtdEstoque) {
        this.idImagem = idImagem;
        this.nomeImagem = nomeImagem;
        this.padrao = padrao;
        this.FKProduto = FKProduto;
        this.idProduto = idProduto;
        this.nomeProd = nomeProd;
        this.avaliacao = avaliacao;
        this.descricao = descricao;
        this.status = status;
        this.preco = preco;
        this.qtdEstoque = qtdEstoque;
    }

    public int getIdImagem() {
        return idImagem;
    }

    public void setIdImagem(int idImagem) {
        this.idImagem = idImagem;
    }

    public String getNomeImagem() {
        return nomeImagem;
    }

    public void setNomeImagem(String nomeImagem) {
        this.nomeImagem = nomeImagem;
    }

    public String getPadrao() {
        return padrao;
    }

    public void setPadrao(String padrao) {
        this.padrao = padrao;
    }

    public int getFKProduto() {
        return FKProduto;
    }

    public void setFKProduto(int FKProduto) {
        this.FKProduto = FKProduto;
    }

    public int getIdProduto() {
        return idProduto;
    }

    public void setIdProduto(int idProduto) {
        this.idProduto = idProduto;
    }

    public String getNomeProd() {
        return nomeProd;
    }

    public void setNomeProd(String nomeProd) {
        this.nomeProd = nomeProd;
    }

    public String getAvaliacao() {
        return avaliacao;
    }

    public void setAvaliacao(String avaliacao) {
        this.avaliacao = avaliacao;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public int getQtdEstoque() {
        return qtdEstoque;
    }

    public void setQtdEstoque(int qtdEstoque) {
        this.qtdEstoque = qtdEstoque;
    }
    
    
    
}
