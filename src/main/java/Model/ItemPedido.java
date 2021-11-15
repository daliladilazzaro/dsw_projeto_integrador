
package Model;


public class ItemPedido {
    
    private int idItem;
    private double preco;
    private int qtdVendida;
    private int fkIdProduto;
    private int fkIdPedido;

    public ItemPedido(double preco, int qtdVendida, int fkIdProduto, int fkIdPedido) {
        this.preco = preco;
        this.qtdVendida = qtdVendida;
        this.fkIdProduto = fkIdProduto;
        this.fkIdPedido = fkIdPedido;
    }
    
    public ItemPedido(int idItem, double preco, int qtdVendida, int fkIdProduto, int fkIdPedido) {
        this.idItem = idItem;
        this.preco = preco;
        this.qtdVendida = qtdVendida;
        this.fkIdProduto = fkIdProduto;
        this.fkIdPedido = fkIdPedido;
    }
    
    public ItemPedido(){}

    public int getIdItem() {
        return idItem;
    }

    public void setIdItem(int idItem) {
        this.idItem = idItem;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public int getQtdVendida() {
        return qtdVendida;
    }

    public void setQtdVendida(int qtdVendida) {
        this.qtdVendida = qtdVendida;
    }

    public int getFkIdProduto() {
        return fkIdProduto;
    }

    public void setFkIdProduto(int fkIdProduto) {
        this.fkIdProduto = fkIdProduto;
    }

    public int getFkIdPedido() {
        return fkIdPedido;
    }

    public void setFkIdPedido(int fkIdPedido) {
        this.fkIdPedido = fkIdPedido;
    }
    
    
    
    
    
    
    
    
    
}
