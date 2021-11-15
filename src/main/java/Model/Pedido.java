/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 *
 * @author ygor.oliveira
 */
public class Pedido {
    
    private int idPedido;
    private String data;
    private String numero;
    private double subTotal;
    private double frete;
    private double total;
    private String formaPagamento;
    private int qtdParcelas;
    private String status; //Aguardando pagamento;
    private int fkIdCliente;
    private int fkIdEndereco;
    private int fkIdCartao;

    public Pedido(int idPedido, String data, String numero, double subTotal, double frete, double total, String formaPagamento, int qtdParcelas, String status, int fkIdCliente, int fkIdEndereco, int fkIdCartao) {
        this.idPedido = idPedido;
        this.data = data;
        this.numero = numero;
        this.subTotal = subTotal;
        this.frete = frete;
        this.total = total;
        this.formaPagamento = formaPagamento;
        this.qtdParcelas = qtdParcelas;
        this.status = status;
        this.fkIdCliente = fkIdCliente;
        this.fkIdEndereco = fkIdEndereco;
        this.fkIdCartao = fkIdCartao;
    }

    public Pedido(String data, String numero, double subTotal, double frete, double total, String formaPagamento, int qtdParcelas, String status, int fkIdCliente, int fkIdEndereco, int fkIdCartao) {
        this.data = data;
        this.numero = numero;
        this.subTotal = subTotal;
        this.frete = frete;
        this.total = total;
        this.formaPagamento = formaPagamento;
        this.qtdParcelas = qtdParcelas;
        this.status = status;
        this.fkIdCliente = fkIdCliente;
        this.fkIdEndereco = fkIdEndereco;
        this.fkIdCartao = fkIdCartao;
    }

    public Pedido(int idPedido, String data, String numero, double subTotal, double frete, double total, String formaPagamento, int qtdParcelas, String status, int fkIdCliente, int fkIdEndereco) {
        this.idPedido = idPedido;
        this.data = data;
        this.numero = numero;
        this.subTotal = subTotal;
        this.frete = frete;
        this.total = total;
        this.formaPagamento = formaPagamento;
        this.qtdParcelas = qtdParcelas;
        this.status = status;
        this.fkIdCliente = fkIdCliente;
        this.fkIdEndereco = fkIdEndereco;
    }

    public Pedido(String data, String numero, double subTotal, double frete, double total, String formaPagamento, int qtdParcelas, String status, int fkIdCliente, int fkIdEndereco) {
        this.data = data;
        this.numero = numero;
        this.subTotal = subTotal;
        this.frete = frete;
        this.total = total;
        this.formaPagamento = formaPagamento;
        this.qtdParcelas = qtdParcelas;
        this.status = status;
        this.fkIdCliente = fkIdCliente;
        this.fkIdEndereco = fkIdEndereco;
    }

    
    public Pedido(){}

    public int getQtdParcelas() {
        return qtdParcelas;
    }

    public void setQtdParcelas(int qtdParcelas) {
        this.qtdParcelas = qtdParcelas;
    }
    
    

    public int getFkIdEndereco() {
        return fkIdEndereco;
    }

    public void setFkIdEndereco(int fkIdEndereco) {
        this.fkIdEndereco = fkIdEndereco;
    }

        
    
    public int getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    
    public double getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(double subTotal) {
        this.subTotal = subTotal;
    }

    public double getFrete() {
        return frete;
    }

    public void setFrete(double frete) {
        this.frete = frete;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getFormaPagamento() {
        return formaPagamento;
    }

    public void setFormaPagamento(String formaPagamento) {
        this.formaPagamento = formaPagamento;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getFkIdCliente() {
        return fkIdCliente;
    }

    public void setFkIdCliente(int fkIdCliente) {
        this.fkIdCliente = fkIdCliente;
    }

    public int getFkIdCartao() {
        return fkIdCartao;
    }

    public void setFkIdCartao(int fkIdCartao) {
        this.fkIdCartao = fkIdCartao;
    }
    
     public static String gerarCodigoPedido() {
        String codigoPedido = "PD-";
        String componentes = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        
        Random random = new Random();
        
        for (int i = 0; i < 20; i++) {
            int caractere = 1 + random.nextInt((99 - 1) + 1);
            codigoPedido += caractere;            
        }
        return codigoPedido;
    }
     
     public static String dataAtual(){
        
        Date dataAtual = new Date();
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        String dataFormatada = dateFormat.format(dataAtual);        
        return dataFormatada;
        
        }
}