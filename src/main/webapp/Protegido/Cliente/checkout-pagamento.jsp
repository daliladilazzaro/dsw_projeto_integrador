<%-- 
    Document   : checkout-pagamento
    Created on : 08/11/2021, 21:29:52
    Author     : ygor.oliveira
--%>

<%@page import="DAO.CheckoutDAO"%>
<%@page import="Model.Checkout"%>
<%@page import="DAO.ClienteDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Model.Carrinho"%>
<%@page import="DAO.CarrinhoDAO"%>
<%@page import="DAO.CarrinhoDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="Model.Usuario"%>
<%@page import="Model.Usuario"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <title>Checkout da compra</title>
    </head>
    <body onLoad="validarPagamentoOnLoad();">
        
        <c:import url="../../Publico/menu-cliente-logado.jsp"/>
        
         <%
                           double subTotal =0.0;
                           double qtdCartoes = 0;
                           HttpServletRequest httpServletRequest = (HttpServletRequest) request;
                           HttpServletResponse httpServletResponse = (HttpServletResponse) response;
                           Usuario usuario = (Usuario) httpServletRequest.getSession().getAttribute("usuario");
                           
                           int idCliente = ClienteDAO.getIDCliente(usuario.getIdUsuario());
                           
                           List<Carrinho> listaCarrinho = CarrinhoDAO.listaCarrinhoLogado(usuario.getIdUsuario());
                           Checkout checkout = CheckoutDAO.getCliente(idCliente);
                           
                           for(Carrinho c:listaCarrinho){
                                    subTotal+= (c.getPrecoProduto()*c.getQtdDesejada());
                                 }
                                 
                            subTotal+=checkout.getFrete();
                            DecimalFormat df = new DecimalFormat("#,###.00");
                           
         %>
        
         
         <style>
             
               img{
                   height: 50px;
               }
               /*imagem lixeira*/
               .bin{
                   height: 20px; 
               }

               /*div class titulos h1 e h2*/
               .container{
                   display: flex;
                   align-items: center;
               }

               .legend{
                   display: flex;
                   align-items: center;
                   left: 50%;
                   font-style: bold;
                   font-family: "Segoe UI", "Arial";
               }

                #grad {
                               height: auto;
                               background-color: rgba(255, 255, 255, 1); /* For browsers that do not support gradients */
                               border-radius: 30px;
               }


               body{
                               background-position:center;
                               background-image: url(../../img/FundoWallpaper04.jpg);
                               position: relative;
                               height: 100vh;
                               width: 100vw;
                               /* adicionando imagem de fundo */
                               background-size: cover;
               }



               .cardCartao{

                               height: auto;
                               background-color: rgba(252, 182, 245, 1); /* For browsers that do not support gradients */
                               background-image: linear-gradient(to bottom right, #F78EEE, transparent);
                               border-radius: 30px;

                }

               .cardCartao > li{

                               margin-left: 5%;

               }

             
         </style>
            
         
         <form action="add-pagamento-checkout?id_usuario=${sessionScope.usuario.idUsuario}" method="POST" class="formulario" autocomplete="off">
         <div class="container mt-5">
            
            <fieldset class="border p-3 fieldset mb-25 col py-3 px-md-5 border" id="grad">
                
                        <legend  class="w-auto legend">
                            <div class="container">
                                <h2>Pagamento</h2>
                                <img src="../../img/credit-card-icon.png" alt="person">
                            </div>
                        </legend>
                            <p><li><a href="../../Publico/checkout-endereco?id_usuario=${sessionScope.usuario.idUsuario}">Editar dados de endereço</a></li></p>
                            
                                <c:choose>
                                       <c:when test="${empty listaCheckoutPagamentos}">
                                
                                
                             <div class="row">
                            
                            <div class="col-md-6">
                    
                                <label for="colFormLabelLg" class="form-label h4">Selecione uma forma de pagamento: </label>
                                <select name="forma_pagamento" id="forma_pagamento" class="form-control" onChange="validarPagamento(this);" required>
                                                                                        <option value="Cartão">Cartão</option>
                                                                                        <option value="Boleto">Boleto</option>          
                                                               
                                </select>
                            </div><br>
                            
                    
                        <div class="col-md-6">
                    
                                <label for="colFormLabelLg" class="form-label h4">* Nº de parcelas: </label>
                                <select name="qtd_parcelas" id="qtd_parcelas" class="form-control" required>
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
                        </div></div>
                                
                                <br>
                        <p id="titleCard">Selecione um cartão abaixo: </p>
                        <div class = "row" id="divCartoes" style='display: flex;'>
                                    <c:forEach var="cartao" items="${listaCartoes}">
                                        <%qtdCartoes+=1;%>
                                        <div class="col-md-6"> 
                                        <div class="cardCartao">
                                        <input class="form-check-input" type="radio" name="Cartão" id="Cartão" value="${cartao.idCartao}" checked required>
                                        <br>
                                            <li>Nome: ${cartao.nome} </li>
                                            <li>Número: ${cartao.numero} </li>
                                            <li>CVV: ${cartao.CVV} </li>
                                            <li>Data de expiração: ${cartao.expiracao}</li>
                                        <br>
                                        </div>
                                            <br>
                                        </div>
                                    </c:forEach>
                         </div>
                                <p></p>
                            
                            </c:when>
                                
                                <c:otherwise>
                                       <c:forEach var="checkout" items="${listaCheckoutPagamentos}">
                            <div class="row">
                            <div class="col-md-6">
                    
                                <label for="colFormLabelLg" class="form-label h4">Selecione uma forma de pagamento: </label>
                                <select name="forma_pagamento" id="forma_pagamento" class="form-control" onChange="validarPagamento(this);" required>
                                                                                        <option value="${checkout.pagamento}">Opção atual: ${checkout.pagamento}</option>
                                                                                        <option value="Cartão">Cartão</option>
                                                                                        <option value="Boleto">Boleto</option>          
                                                               
                                </select>
                            </div><br>
                            
                    
                        <div class="col-md-6">
                    
                                <label for="colFormLabelLg" class="form-label h4">* Nº de parcelas: </label>
                                <select name="qtd_parcelas" id="qtd_parcelas" class="form-control" required>
                                                                
                                               <c:choose>
                                                    <c:when test="${checkout.pagamento=='Boleto'}">
                                                               <option value="${checkout.qtdParcelas}">Opção atual: 1 vez de <%= df.format(subTotal/1)%></option>

                                                    </c:when>
                                                    
                                                    <c:otherwise>
                                                        
                                                                <option value="${checkout.qtdParcelas}">Opção atual: Pagar em ${checkout.qtdParcelas} parcela(s).</option>
                                                        
                                                    </c:otherwise>
                                                </c:choose>
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
                        </div></div>
                                
                                <br>
                        <p id="titleCard">Selecione um cartão abaixo: </p>
                        <div class = "row" id="divCartoes" style='display: flex;'>
                                    <c:forEach var="cartao" items="${listaCartoes}">
                                        <%qtdCartoes+=1;%>
                                        <div class="col-md-6">
                                        <div class="cardCartao">
                                            
                                            <c:choose>
                                                    <c:when test="${checkout.fkIdCartao == cartao.idCartao}">
                                                        
                                                        <input class="form-check-input" type="radio" name="Cartão" id="Cartão" value="${cartao.idCartao}" checked required>
                                                        
                                                    </c:when>
                                                        
                                                        <c:when test="${checkout.pagamento == 'Boleto'}">
                                                        
                                                        <input class="form-check-input" type="radio" name="Cartão" id="Cartão" value="${cartao.idCartao}" checked required>
                                                        
                                                        </c:when>
                                                    
                                                    <c:otherwise>
                                                        
                                                        <input class="form-check-input" type="radio" name="Cartão" id="Cartão" value="${cartao.idCartao}" required>

                                                    </c:otherwise>
                                                </c:choose>
                                            
                                        <br>
                                            <li>Nome: ${cartao.nome} </li>
                                            <li>Número: ${cartao.numero} </li>
                                            <li>CVV: ${cartao.CVV} </li>
                                            <li>Data de expiração: ${cartao.expiracao}</li>
                                        <br>
                                        </div>
                                            <br>
                                        </div>
                                    </c:forEach>
                         </div>
                            </c:forEach>
                                <p></p>                 
                                                        
                                </c:otherwise>
                   </c:choose>
                                
                            
                    <div class="row">
                                      <button type="submit" class="btn btn-dark form-control form-control-lg h4" onClick="cartoesCadastrados('<%=qtdCartoes%>');">Ver resumo do pedido</button>
                    </div>
            
                </fieldset></div></form>
                                
                                
                                
                <form action="add-cartao?id_usuario=${sessionScope.usuario.idUsuario}" method="POST" class="formulario" autocomplete="off">
                <div class="container mt-5">
                    <fieldset class="border p-3 fieldset mb-25 col py-3 px-md-5 border" id="grad">
                                        <legend  class="w-auto legend">
                                            <div class="container">
                                                <h2>Cadastrar um novo cartão</h2>
                                                <img src="../../img/credit-card-icon.png" alt="person">
                                            </div>
                                        </legend>
                
                <div class="row">
                            <div class="col-sm">
                                            <label for="colFormLabelLg" class="form-label h4">* Nome impresso no cartão: </label>
                                            <input class="form-control form-control-lg" name="nome" type="text" id="nome" value="" maxlength="70" required><br>
                            </div>
                            <div class="col-sm">
                                <label for="colFormLabelLg" class="form-label h4">* Número: </label>
                                <input class="form-control form-control-lg" id="numero" type="text" name="numero" required><br>
                            </div>
                </div>
                
                <div class="row">
                    
                            <div class="col-sm">
                                <label for="colFormLabelLg" class="form-label h4">* CVV: </label>
                                <input class="form-control form-control-lg" id="CVV" type="number" name="CVV" max="999" min ="000" minLength="3" required><br>
                            </div>
                    
                            <div class="col-sm">
                                <label for="colFormLabelLg" class="form-label h4">* Data de expiração: </label>
                                <input class="form-control form-control-lg" id="expiracao" type="date" name="expiracao" required><br>
                            </div>
                </div>
                
                
                <div class="col-sm">
                                      <button type="submit" class="btn btn-dark form-control form-control-lg h4">Adicionar cartão</button>
                </div>
                                               
            </fieldset>
        </div>
       </form>
                
                <script>
                    
                    function cartoesCadastrados(qtdCartoes){
                        
                        var y = document.getElementById("forma_pagamento");
                        
                        if(qtdCartoes === '0.0' && y.value !== 'Boleto'){
                            event.preventDefault();
                            window.alert("Cadastre um cartão de crédito abaixo.");
                            return;
                       }
                    }
                    
                    function validarPagamento(elemento){
                        
                        if(elemento.value === 'Cartão'){
                            
                            var x = document.getElementById("divCartoes");
                            var y = document.getElementById("qtd_parcelas");
                            var z = document.getElementById("titleCard");
                            x.style.display = "flex";
                            z.style.display = "block";
                            y.disabled = false;
                            
                            
                        }else{
                            
                        var x = document.getElementById("divCartoes");
                        var y = document.getElementById("qtd_parcelas");
                        var z = document.getElementById("titleCard");
                            x.style.display = "none";
                            z.style.display = "none";
                            y.value='1';
                            y.disabled = true;
                            
                        }
                    }
                    
                    function validarPagamentoOnLoad(){
                        
                        let elemento = document.getElementById("forma_pagamento");
                        
                        if(elemento.value === 'Cartão'){
                            
                            var x = document.getElementById("divCartoes");
                            var y = document.getElementById("qtd_parcelas");
                            var z = document.getElementById("titleCard");
                            x.style.display = "flex";
                            z.style.display = "block";
                            y.disabled = false;
                            
                            
                        }else{
                            
                        var x = document.getElementById("divCartoes");
                        var y = document.getElementById("qtd_parcelas");
                        var z = document.getElementById("titleCard");
                            x.style.display = "none";
                            z.style.display = "none";
                            y.value='1';
                            y.disabled = true;
                            
                        }
                    }
                </script>
    </body>
</html>
