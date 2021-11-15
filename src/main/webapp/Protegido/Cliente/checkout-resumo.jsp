<%-- 
    Document   : checkout-resumo
    Created on : 10/11/2021, 21:35:04
    Author     : dilaz
--%>

<%@page import="DAO.ClienteDAO"%>
<%@page import="DAO.CheckoutDAO"%>
<%@page import="Model.Checkout"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="DAO.CarrinhoDAO"%>
<%@page import="java.util.List"%>
<%@page import="Model.Carrinho"%>
<%@page import="Model.Usuario"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="../../css/checkout-resumo.css">
        <title>Checkout - Resumo da compra</title>
    </head>
    <body>
        
        <style>
            
            
            
#nome_produto{
                
                width: 500px;
}
            
.logo{
                height: 35px;
                
}
        </style>
        
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="../../Publico/landing-page"><img src="../../img/LogoLoja03.png" class="logo"/></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="../../Publico/landing-page">Página inicial<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <img src="../../img/person-icon.png" class="logo"> 
           Meu perfil
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            
            <c:choose>  
                    <c:when test="${sessionScope.usuario.grupo!=null}">
                        
                        <a class="dropdown-item" href="../Cliente/alterar-cliente?id_usuario=${sessionScope.usuario.idUsuario}"><img src="../../img/user-icon.png" class="logo"/> Editar meus dados</a>
                        <a class="dropdown-item" href="../Cliente/acompanhar-pedido?id_usuario=${sessionScope.usuario.idUsuario}"><img src="../../img/box-icon.png" id="logo"/>Meus pedidos</a>
                        <a class="dropdown-item" href="../../Publico/LogoutCliente"><img src="../../img/log-out.png" class="logo"/> Fazer logout</a>
                   
                     </c:when>
                    <c:otherwise>
                        
                        <a class="dropdown-item" href="../../Publico/login"><img src="../../img/log-in.png" class="logo"/> Fazer Login</a>
                        <a class="dropdown-item" href="../../Publico/cadastro-cliente.jsp"><img src="../../img/person-icon.png" class="logo"/> Realizar meu cadastro</a>
                    
                    </c:otherwise>
            </c:choose>    
                        
          <div class="dropdown-divider"></div>
        </div>
      </li>
      <%
          int countCarrinho = 0;
      %>
      <li class="nav-item">
        <a class="nav-link" href="../../Publico/add-produto?id_usuario=${sessionScope.usuario.idUsuario}"><img src="../../img/shopping-cart-icon.png" class="logo"/>Carrinho de compras</a>
      </li>
      <%
                           HttpServletRequest httpServletRequest = (HttpServletRequest) request;
                           HttpServletResponse httpServletResponse = (HttpServletResponse) response;
                           Usuario usuario = (Usuario) httpServletRequest.getSession().getAttribute("usuario");
                           int idCliente = ClienteDAO.getIDCliente(usuario.getIdUsuario());
                           List<Carrinho> listaCarrinho = CarrinhoDAO.listaCarrinhoLogado(usuario.getIdUsuario());
                           
                           Checkout checkout = CheckoutDAO.getCliente(idCliente); 
                           double subTotal =0.0;
                           double subTotalSemFrete =0.0;
                           double frete01 = 44.36;
                           double frete02 = 15.44;
                           double frete03 = 10.90;
                           
                           int qtdParcelas = checkout.getQtdParcelas();
                            for(Carrinho c:listaCarrinho){
                                     countCarrinho+=c.getQtdDesejada();
                                     subTotal += (c.getPrecoProduto()*c.getQtdDesejada()) + checkout.getFrete();
                                     subTotalSemFrete += c.getPrecoProduto()*c.getQtdDesejada();
                            }
                            
                            double TotalPedidoParcelado = ((subTotal)/qtdParcelas);
                            DecimalFormat df = new DecimalFormat("#,###.00");
                            
                            String divValidaQtd = "divValidaQtd";
                            String divValidaQtd02 = "divValidaQtd02";
                            String divValidaQtd03 = "divValidaQtd03";
                            int count = 0;
       %>
       <li class="nav-item">
          <h3 style='color: white;'><%= countCarrinho %></h3>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0" action="../../Publico/pesquisa-produtos" method="GET">
      <input class="form-control mr-sm-2" type="search" placeholder="Pesquisar produtos..." aria-label="Search" id="nome_produto" name="nome_produto">
      <button class="btn btn-outline-info my-2 my-sm-0" type="submit">Pesquisar</button>
    </form>
  </div>
</nav>  
        <div class="container cards">
            <div class="">
                        <c:if test="${param.carrinhoVazio}">
                        <div class="alert alert-danger" role="alert">
                            Adicione algum produto no carrinho para finalizar a compra!
                        </div>
                    </c:if>
                <div class="card card-display">
                    <div><h3>1) Revisar - Endereço de entrega</h3></div>
                    <div>
                        
                        <p><b>Titular: </b>${clienteCheckout.nome}</p>
                        <p><b>Endereço: </b>${enderecoCheckout.logradouro}, ${enderecoCheckout.numero} - ${enderecoCheckout.cidade} - ${enderecoCheckout.estado}</p>
                        <p><b>CEP: </b>${enderecoCheckout.CEP}</p>
                    </div>
                    <div><a href="../../Publico/checkout-endereco?id_usuario=${sessionScope.usuario.idUsuario}">Alterar</a></div>
                </div>
                
                <div class="card card-display">
                    <div><h3>2) Revisar - Método de pagamento</h3></div>
                    <div>
                        <c:forEach var="checkout" items="${listaCheckout}">
                            
                            <c:choose>
                                <c:when test="${checkout.pagamento=='Boleto'}">
                                    
                                    <p><b>Pagar em boleto</b> - vence em até um dia útil</p>
                                    <p><b>Opções de parcelamentos:</b></p>
                                     <select name="qtd_parcelas" id="qtd_parcelas" class="form-select" required>
                                            <option value="1">Pagar à vista</option>
                                </select>
                                </c:when>
                                                    
                                <c:otherwise>
                                    
                                    <p><b>MasterCard </b> - vence em ${cartaoCheckout.expiracao}</p>
                                    <p><b>Numeração: </b> ${cartaoCheckout.numero} - ${cartaoCheckout.CVV}</p>
                                    <p><b>Opções de parcelamentos: </b></p>
                                    <select name="qtd_parcelas" id="qtd_parcelas" class="form-select" onChange="validarParcelas(this,'${sessionScope.usuario.idUsuario}','${checkout.fkIdCartao}');" required>
                                            <option value="${checkout.qtdParcelas}">Opção atual: Pagar em ${checkout.qtdParcelas} parcela(s).</option>
                                            <option value="1">1 vez de <%= df.format(subTotal/1)%></option>
                                            <option value="2">2 vezes de <%= df.format(subTotal/2)%></option>
                                            <option value="3">3 vezes de <%= df.format(subTotal/3)%></option>
                                            <option value="4">4 vezes de <%= df.format(subTotal/4)%></option>
                                            <option value="5">5 vezes de <%= df.format(subTotal/5)%></option>
                                            <option value="6">6 vezes de <%= df.format(subTotal/6)%></option>
                                            <option value="7">7 vezes de <%= df.format(subTotal/7)%></option>
                                            <option value="8">8 vezes de <%= df.format(subTotal/8)%></option>
                                            <option value="9">9 vezes de <%= df.format(subTotal/9)%></option>
                                            <option value="10">10 vezes de <%= df.format(subTotal/10)%></option>
                                </select>                  
                                </c:otherwise>
                            </c:choose>
                           
                        </c:forEach>
                    </div>
                    <div><a href="../../Publico/add-endereco-checkout?id_usuario=${sessionScope.usuario.idUsuario}">Alterar</a></div>
                </div>
                
                
                <div class="card">
                    <div><h3>3) Revisar - Itens de envio</h3><span><b>Sub-total dos itens:</b> R$ <%= df.format(subTotalSemFrete)%></span></div>
                    <div>
                        <div class="card-display"> 
                        <div style="display: block">
                        <c:forEach var="carrinho" items="${listaCarrinho}">
                            <div><img src="../../img/${carrinho.nomeImagem}" id="foto_produto"></div>
                            <div>
                                <p><b>${carrinho.nomeProduto}</b></p>
                                <p><b>Preço: </b>R$ ${carrinho.precoProduto} <b>Qtd:</b> R$ ${carrinho.precoProduto*carrinho.qtdDesejada}</b></p>
                                
                                <%
                                   count ++;
                                   divValidaQtd = "divValidaQtd"+count;
                                   divValidaQtd02 = "divValidaQtd02"+count;
                                   divValidaQtd03 = "divValidaQtd03"+count;
                            
                            
                                %>
                                 <div class="row">
                                     <div class="col-sm">
                                <select name="qtd_desejada" id="qtd_desejada" class="form-control" onChange="validarQtd(this,'<%= divValidaQtd %>', '<%= divValidaQtd03 %>', '${carrinho.idItem}', '${carrinho.fkUsuario}', '${carrinho.nomeCliente}', '${carrinho.qtdEstoque}');" required>
                                               <option value="${carrinho.qtdDesejada}">Qtd atual: ${carrinho.qtdDesejada}</option>
                                               <option value="0">Qtd: 0 (Excluir) </option>
                                               <option value="1">Qtd: 1</option>
                                               <option value="2">Qtd: 2</option>
                                               <option value="3">Qtd: 3</option>
                                               <option value="4">Qtd: 4</option>
                                               <option value="5">Qtd: 5</option>
                                               <option value="6">Qtd: 6</option>
                                               <option value="7">Qtd: 7</option>
                                               <option value="8">Qtd: 8</option>
                                               <option value="9">Qtd: 9</option>
                                               <option value="10">Qtd: 10+</option>
                                </select></div>
                           
                                        <div class="col-sm" style='display: none;' id="<%= divValidaQtd %>">
                                        <label for="colFormLabelLg" class="form-label h6"> Qtd: </label>
                                        <input class="form-control form-control-lg" type="number" id="<%= divValidaQtd02 %>"  min="0" name="validaQtd" required>
                                        </div>
                                        <div class="col-sm" style='display: none;' id="<%= divValidaQtd03 %>" name="BTNAtt">
                                        <button type="submit" class="btn btn-dark form-control form-control-lg h4" onClick="validarQtdBTN('<%= divValidaQtd02 %>','${carrinho.idItem}', '${carrinho.fkUsuario}', '${carrinho.nomeCliente}', '${carrinho.qtdEstoque}');">Atualizar</button>
                                        </div>
                                        </div>
                            </div>
                            <br>
                          </c:forEach>
                            <p><b>Sub-total dos itens:</b> R$ <%= df.format(subTotalSemFrete)%></p>
                        </div> 
                        </div>
                    </div>
                </div>
            </div>
                        
             <form action="finaliza-checkout?id_usuario=${sessionScope.usuario.idUsuario}" method="POST" class="formulario" autocomplete="off">       
               <div>
                <c:forEach var="checkout" items="${listaCheckout}">
                <div class="card card-pagamento">
                    
                    
                    <button type="submit">Fazer Pedido</button>
                    <h3>Resumo do Pedido</h3>
                    <div class="linha"></div>
                    <div class="card-total">
                        <div>Itens</div>
                        <div>R$ <%= df.format(subTotalSemFrete)%></div>
                    </div>
                    <div class="card-total">
                        <div>Frete e manuseio</div>
                        
                        <div>R$ ${checkout.frete}</div>
                    </div>
                    <div class="linha"></div>
                    <h3>Total do pedido: R$ <%= df.format(subTotalSemFrete+checkout.getFrete())%></h3>
                        <p>Em ${checkout.qtdParcelas}x de R$ <%= df.format(TotalPedidoParcelado)%> sem juros</p>
                    </c:forEach>
                    <div>
                                <p><b>Revisão de frete</b></p>
                                
                                <c:forEach var="checkout" items="${listaCheckout}">
                            
                                    <c:choose>
                                    <c:when test="${checkout.frete==44.36}">
                                
                                                <div class="form-check">
                                                                  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="44.36" checked onClick="validarFrete('<%=frete01%>','${sessionScope.usuario.idUsuario}','${checkout.fkIdEndereco}');" required>
                                                                  <label class="form-check-label" for="flexRadioDefault1">
                                                                      <b>R$ 44,36 Entrega Expressa</b> - Receba amanhã
                                                                  </label>
                                                </div>

                                                <div class="form-check">
                                                                  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="15.44" onClick="validarFrete('<%=frete02%>','${sessionScope.usuario.idUsuario}','${checkout.fkIdEndereco}');" required>
                                                                  <label class="form-check-label" for="flexRadioDefault2">
                                                                      <b>R$ 15,44 Entrega padrão</b> - 5 dias úteis
                                                                  </label>
                                                </div>

                                                <div class="form-check">
                                                                  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3" value="10.90" onClick="validarFrete('<%=frete03%>','${sessionScope.usuario.idUsuario}','${checkout.fkIdEndereco}');" required>
                                                                  <label class="form-check-label" for="flexRadioDefault3">
                                                                      <b>R$ 10,90 Entrega Sedex</b> - 10 dias úteis
                                                                  </label>
                                                </div>
                                    </c:when>
                            
                            <c:when test="${checkout.frete==15.44}">
                                
                                                <div class="form-check">
                                                                  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="44.36" onClick="validarFrete('<%=frete01%>','${sessionScope.usuario.idUsuario}','${checkout.fkIdEndereco}');"required>
                                                                  <label class="form-check-label" for="flexRadioDefault1">
                                                                      <b>R$ 44,36 Entrega Expressa</b> - Receba amanhã
                                                                  </label>
                                                </div>

                                                <div class="form-check">
                                                                  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="15.44" checked onClick="validarFrete('<%=frete02%>','${sessionScope.usuario.idUsuario}','${checkout.fkIdEndereco}');" required>
                                                                  <label class="form-check-label" for="flexRadioDefault2">
                                                                      <b>R$ 15,44 Entrega padrão</b> - 5 dias úteis
                                                                  </label>
                                                </div>

                                                <div class="form-check">
                                                                  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3" value="10.90" onClick="validarFrete('<%=frete03%>','${sessionScope.usuario.idUsuario}','${checkout.fkIdEndereco}');" required>
                                                                  <label class="form-check-label" for="flexRadioDefault3">
                                                                      <b>R$ 10,90 Entrega Sedex</b> - 10 dias úteis
                                                                  </label>
                                                </div>
                                
                            </c:when>
                            
                            <c:when test="${checkout.frete==10.90}">
                                
                                                <div class="form-check">
                                                                  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="44.36" onClick="validarFrete('<%=frete01%>','${sessionScope.usuario.idUsuario}','${checkout.fkIdEndereco}');" required>
                                                                  <label class="form-check-label" for="flexRadioDefault1">
                                                                      <b>R$ 44,36 Entrega Expressa</b> - Receba amanhã
                                                                  </label>
                                                </div>

                                                <div class="form-check">
                                                                  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="15.44"  onClick="validarFrete('<%=frete02%>','${sessionScope.usuario.idUsuario}','${checkout.fkIdEndereco}');" required>
                                                                  <label class="form-check-label" for="flexRadioDefault2">
                                                                      <b>R$ 15,44 Entrega padrão</b> - 5 dias úteis
                                                                  </label>
                                                </div>

                                                <div class="form-check">
                                                                  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3" value="10.90" checked onClick="validarFrete('<%=frete03%>','${sessionScope.usuario.idUsuario}','${checkout.fkIdEndereco}');" required>
                                                                  <label class="form-check-label" for="flexRadioDefault3">
                                                                      <b>R$ 10,90 Entrega Sedex</b> - 10 dias úteis
                                                                  </label>
                                                </div>
                            </c:when>
            </c:choose>
                             </c:forEach>
                            </div>
                </div>
               </div></form>
        </div>

        <!-- Optional JavaScript; choose one of the two! -->

        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

        <!-- Option 2: Separate Popper and Bootstrap JS -->
        <!--
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        -->
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
        <script>
            function validarParcelas(qtdParcelas, idUsuario, idCartao){
                    $.ajax({
                        method: "GET",
                        url: "att-qtd-cartao?id_usuario="+idUsuario+"&qtd_desejada="+qtdParcelas.value+"&id_cartao="+idCartao
                        })
                                .done(function( msg ) {
                                location.reload();
               });
            }
            
            function validarFrete(frete, idUsuario, idEndereco){
                    $.ajax({
                          method: "GET",
                          url: "att-frete?id_usuario="+idUsuario+"&novo_frete="+frete+"&id_endereco="+idEndereco
                        })
                                .done(function( msg ) {
                                location.reload();
               });
            }
            
            
            
            function validarQtd(elemento, div, div03, idItem, idUsuario, nomeCliente, qtdEstoque){
                            
                            let QtdDesejada = parseInt(elemento.value);
                            let estoque = parseInt(qtdEstoque);
                            
                            if(elemento.value === '0'){
                                $.ajax({
                                    method: "GET",
                                    url: "excluir-item-checkout?id_item="+idItem+"&id_usuario="+idUsuario+"&nome_cliente="+nomeCliente
                                })
                                .done(function( msg ) {
                                    location.reload();
                                 });
                            }
                            else if (elemento.value === '10'){
                                
                                    var x = document.getElementById(div);
                                    var y = document.getElementById(div03);
                                    x.style.display = "flex";
                                    y.style.display = "flex";
                                    return;
                            }
                            
                            
                            else if (QtdDesejada > estoque){
                                     
                                    window.alert("Este produto possui apenas "+ estoque + " itens em estoque.");
                                    document.getElementById("qtd_desejada").value = qtdEstoque;
                                    
                                    $.ajax({
                                    method: "GET",
                                    url: "att-qtd-item?id_item="+idItem+"&id_usuario="+idUsuario+"&nome_cliente="+nomeCliente+"&qtd_desejada="+qtdEstoque
                                })
                                 .done(function( msg ) {
                                            location.reload();
                                 });
                                 
                                   }
                                   else{
                                    
                                    $.ajax({
                                    method: "GET",
                                    url: "att-qtd-item?id_item="+idItem+"&id_usuario="+idUsuario+"&nome_cliente="+nomeCliente+"&qtd_desejada="+elemento.value
                                        })
                                        .done(function( msg ) {
                                            location.reload();
                                 });
                                        
                                    }
                                    
                            }
                            
                            function validarQtdBTN(div, idItem, idUsuario, nomeCliente, qtdEstoque){
                            var inputQtd = document.getElementById(div);
                            var elemento = inputQtd.value;
                                
                            
                            let QtdDesejada = parseInt(elemento);
                            let estoque = parseInt(qtdEstoque);
                            
                            if (elemento === ''){
                                
                                    window.alert("Informe algum valor!");
                                    return;
                            }
                            else if(elemento <= '0'){
                                $.ajax({
                                    method: "GET",
                                    url: "excluir-item-checkout?id_item="+idItem+"&id_usuario="+idUsuario+"&nome_cliente="+nomeCliente
                                })
                                .done(function( msg ) {
                                    location.reload();
                                 });
                            }
                            else if (QtdDesejada > estoque){
                                     
                                    window.alert("Este produto possui apenas "+ estoque + " itens em estoque.");
                                    document.getElementById("qtd_desejada").value = qtdEstoque;
                                    
                                    $.ajax({
                                    method: "GET",
                                    url: "att-qtd-item?id_item="+idItem+"&id_usuario="+idUsuario+"&nome_cliente="+nomeCliente+"&qtd_desejada="+qtdEstoque
                                })
                                 .done(function( msg ) {
                                            location.reload();
                                 });
                                 
                                   }
                                   else{
                                    
                                    $.ajax({
                                    method: "GET",
                                    url: "att-qtd-item?id_item="+idItem+"&id_usuario="+idUsuario+"&nome_cliente="+nomeCliente+"&qtd_desejada="+elemento
                                        })
                                        .done(function( msg ) {
                                            location.reload();
                                 });   
                                    }
                            }    
        </script>
    </body>
</html>