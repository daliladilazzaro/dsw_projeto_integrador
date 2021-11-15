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
public class Checkout {
    
    private int idCheckout;
    private int fkIdCliente;
    private int fkIdEndereco;
    private double frete;
    private String pagamento;
    private int fkIdCartao;
    private int qtdParcelas;

    public Checkout(int idCheckout, int fkIdCliente, int fkIdEndereco, double frete, String pagamento, int fkIdCartao, int qtdParcelas) {
        this.idCheckout = idCheckout;
        this.fkIdCliente = fkIdCliente;
        this.fkIdEndereco = fkIdEndereco;
        this.frete = frete;
        this.pagamento = pagamento;
        this.fkIdCartao = fkIdCartao;
        this.qtdParcelas = qtdParcelas;
    }
    
    public Checkout(int fkIdCliente, int fkIdEndereco, double frete, String pagamento, int fkIdCartao, int qtdParcelas) {
        this.fkIdCliente = fkIdCliente;
        this.fkIdEndereco = fkIdEndereco;
        this.frete = frete;
        this.pagamento = pagamento;
        this.fkIdCartao = fkIdCartao;
        this.qtdParcelas = qtdParcelas;
    }
    
    public Checkout(int fkIdCliente, int fkIdEndereco, double frete) {
        this.fkIdCliente = fkIdCliente;
        this.fkIdEndereco = fkIdEndereco;
        this.frete = frete;
    }

    public Checkout() {}

    public int getIdCheckout() {
        return idCheckout;
    }

    public void setIdCheckout(int idCheckout) {
        this.idCheckout = idCheckout;
    }

    public int getQtdParcelas() {
        return qtdParcelas;
    }

    public void setQtdParcelas(int qtdParcelas) {
        this.qtdParcelas = qtdParcelas;
    }
    
    

    public int getFkIdCliente() {
        return fkIdCliente;
    }

    public void setFkIdCliente(int fkIdCliente) {
        this.fkIdCliente = fkIdCliente;
    }

    public int getFkIdEndereco() {
        return fkIdEndereco;
    }

    public void setFkIdEndereco(int fkIdEndereco) {
        this.fkIdEndereco = fkIdEndereco;
    }

    public double getFrete() {
        return frete;
    }

    public void setFrete(double frete) {
        this.frete = frete;
    }

    public String getPagamento() {
        return pagamento;
    }

    public void setPagamento(String pagamento) {
        this.pagamento = pagamento;
    }

    public int getFkIdCartao() {
        return fkIdCartao;
    }

    public void setFkIdCartao(int fkIdCartao) {
        this.fkIdCartao = fkIdCartao;
    }
    
    
    
    
    
    
}
