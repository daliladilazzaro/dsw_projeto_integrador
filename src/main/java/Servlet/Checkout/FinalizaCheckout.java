
package Servlet.Checkout;

import DAO.CarrinhoDAO;
import DAO.CartaoDAO;
import DAO.CheckoutDAO;
import DAO.ClienteDAO;
import DAO.ItemPedidoDAO;
import DAO.PedidoDAO;
import Model.Carrinho;
import Model.Cartao;
import Model.Checkout;
import Model.Cliente;
import Model.Endereco;
import Model.ItemPedido;
import Model.Pedido;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FinalizaCheckout extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            int idUsuario = Integer.parseInt(request.getParameter("id_usuario"));
            int idCliente = ClienteDAO.getIDCliente(idUsuario);
            
            
                List<Carrinho> listaCarrinho = CarrinhoDAO.listaCarrinhoLogado(idUsuario);
                
                if(listaCarrinho.isEmpty()){
                    
                    response.sendRedirect("checkout-resumo.jsp?carrinhoVazio=true");
                    
                
                }else{
                
                
                
            
                List<Checkout> listaCheckout = CheckoutDAO.listaCheckout(idCliente);
                
                Endereco endereco = new Endereco();
                Cartao cartao = new Cartao();
                Cliente cliente = new Cliente();
                
                 for(Checkout c: listaCheckout){      
                 endereco = ClienteDAO.getEndereco(c.getFkIdEndereco());
                 cartao = CartaoDAO.getCartao(c.getFkIdCartao());
                 cliente = ClienteDAO.getCliente(c.getFkIdCliente());
                 
              }
                double validaTotal = 0.0;
                Checkout checkout = CheckoutDAO.getCliente(idCliente);
                
                for(Carrinho c: listaCarrinho){
                        validaTotal += c.getPrecoProduto()*c.getQtdDesejada();
              }
                
                //1º Passo - Salvar pedido:
                
                boolean salvarPedido = false;
                
                Pedido metodo = new Pedido();
                String data = metodo.dataAtual();
                String numero = metodo.gerarCodigoPedido();
                double subTotal = validaTotal;
                double frete = checkout.getFrete();
                double total = subTotal+frete;
                String formaPagamento = checkout.getPagamento();
                int qtdParcelas = checkout.getQtdParcelas();
                String status = "Aguardando pagamento";
                int fkIdCliente = idCliente;
                int fkIdEndereco = endereco.getIdEndereco();
                
                if(formaPagamento.equals("Boleto")){
                    
                        Pedido pedido = new Pedido(data, numero, subTotal, frete, total, formaPagamento,
                            qtdParcelas, status, fkIdCliente, fkIdEndereco);
                         salvarPedido = PedidoDAO.salvarPedidoBoleto(pedido);
                         System.out.println("Pedido salvo!");
                         
                }else{
                    
                    int fkIdCartao = cartao.getIdCartao();
                    Pedido pedido = new Pedido(data, numero, subTotal, frete, total, formaPagamento,
                        qtdParcelas, status, fkIdCliente, fkIdEndereco, fkIdCartao);
                        salvarPedido = PedidoDAO.salvarPedidoCartao(pedido);
                        System.out.println("Pedido salvo!");
                } 
                
                //2º Passo - Salvar itens pedido e validar estoque do produto:
                boolean salvarItemPedido = false;
                boolean atualizarEstoque = false;
                
                int fkIdPedido = PedidoDAO.idPedido;
                
                for(Carrinho c: listaCarrinho){
                    
                    double precoUnitario = c.getPrecoProduto();
                    int qtdVendida = c.getQtdDesejada();
                    int fkIdProduto = c.getFkProduto();
                    
                    ItemPedido item = new ItemPedido(precoUnitario, qtdVendida, fkIdProduto, fkIdPedido);
                    salvarItemPedido = ItemPedidoDAO.salvarItemPedido(item);
                    System.out.println("Item salvo!");
                    atualizarEstoque = ItemPedidoDAO.atualizarEstoque(fkIdProduto, qtdVendida);  
                    System.out.println("Estoque atualizado!");
              }
                //3º Passo - Truncar checkout e carrinho do cliente:
                               
                boolean truncaTables = ItemPedidoDAO.DeletarCheckout(idCliente, idUsuario);
                
                if(salvarPedido && salvarItemPedido && atualizarEstoque && truncaTables){
                    System.out.println("Pedido realizado com sucesso!");
                    request.setAttribute("numero", numero);
                    request.getRequestDispatcher("pedido-realizado.jsp").forward(request, response);
                    
                    
                    
            }   else{
                    System.out.println("Erro!");
                }
                }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
          int idUsuario = Integer.parseInt(request.getParameter("id_usuario"));
          int idCliente = ClienteDAO.getIDCliente(idUsuario);
          
                
                List<Checkout> listaCheckout = CheckoutDAO.listaCheckout(idCliente);
                request.setAttribute("listaCheckout", listaCheckout);
                
                Endereco endereco = new Endereco();
                Cartao cartao = new Cartao();
                Cliente cliente = new Cliente();
                
                 for(Checkout c: listaCheckout){       
                 endereco = ClienteDAO.getEndereco(c.getFkIdEndereco());
                 cartao = CartaoDAO.getCartao(c.getFkIdCartao());
                 cliente = ClienteDAO.getCliente(c.getFkIdCliente());
                 
              }
                
                request.setAttribute("enderecoCheckout", endereco);
                request.setAttribute("cartaoCheckout", cartao);
                request.setAttribute("clienteCheckout", cliente);
                
                List<Carrinho> listaCarrinho = CarrinhoDAO.listaCarrinhoLogado(idUsuario);
                request.setAttribute("listaCarrinho", listaCarrinho);
               
                
                System.out.println("Chegout até a parte de redirecionar para tela de resumo!");
                
                request.getRequestDispatcher("checkout-resumo.jsp").forward(request, response);
    }

}
