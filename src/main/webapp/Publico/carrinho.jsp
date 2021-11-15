<%-- 
    Document   : carrinho
    Created on : 07/11/2021, 09:37:12
    Author     : ygor.oliveira
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="Model.Usuario"%>
<%@page import="Model.Checkout"%>
<%@page import="DAO.CheckoutDAO"%>
<%@page import="DAO.ClienteDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Carrinho"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <title>Carrinho de compras</title>
    </head>
    <body>
        
        <style>
            
            body{
                background-position:center;
                background-image: url(../img/FundoWallpaper04.jpg);
                position: relative;
                height: 100vh;
                width: 100vw;
                /* adicionando imagem de fundo */
                background-size: cover;

            }
            
            #grad {
                height: auto;
                background-color: rgba(255, 255, 255, 1); /* For browsers that do not support gradients */
                border-radius: 30px;
            }
            
            #iconProd{
                max-width: 200px;
                max-height: 180px;
                margin-left: 20%;
            }
            
            #lixeira{
                
                height: 40px;
                margin-left: 87%;
            }
            
            #subTotalFim{
                
                margin-left: 55%;
                
            }
            
            .cardFrete{
                width: 280px;
                padding: 15px;
                margin: 10px;
                border-radius: 15px;
                flex-direction: row;
                justify-content: space-between;
                background-color: rgba(255, 255, 255, 1); /* For browsers that do not support gradients */
         }
         
         .linha {
                    border-top: 1px solid #DDDDDD;
                    margin: 10px 0px;
            }
            
            .card-total {
                display: flex;
                justify-content: space-between;
}
            
         </style>
         
         <%
                            double subTotal = 0.0;
                            double fretePadrao = 15.44;
                            String divValidaQtd = "divValidaQtd";
                            String divValidaQtd02 = "divValidaQtd02";
                            String divValidaQtd03 = "divValidaQtd03";
                            String divExcluirProd = "excluirProd";
                            String divQtdDesejada = "divQtdDesejada";
                            int count = 0;
                            DecimalFormat df = new DecimalFormat("#,###.00");
                                
                            
                            
        %>
        
        <%  
                          Object LISTA = request.getAttribute("listaCarrinho");
                                if(LISTA!=null){

                                ArrayList<Carrinho> lista = (ArrayList)LISTA;

                                for(Carrinho c:lista){

                                  subTotal+=(c.getPrecoProduto()*c.getQtdDesejada());
                                }
                             }
        %>
        
        <c:import url="menu-cliente.jsp"/>
        
        <div class="container mt-5" style="display: flex;">
            
                <fieldset class="border p-3 fieldset mb-25 col py-3 px-md-5 border" id="grad">
                   
                    <legend  class="w-auto legend">
                        <div class="container">
                            <h2>Carrinho de compras</h2>
                             <c:if test="${not empty listaCarrinho}">
                             <legend id="subTotalInicio"><b>Sub-total dos itens:</b> <%= df.format(subTotal) %></legend>
                             </c:if>
                        </div>
                    </legend>
                    <br><br>
                    
                    <c:if test="${param.carrinhoVazio}">
                        <div class="row">
                            <center><legend>Seu carrinho está vazio...</legend></center>
                            <br>
                        </div>
                    </c:if>
                    
                    <c:forEach var="carrinho" items="${listaCarrinho}">
                           
                         <div class="row">
                             
                             <div class="col-sm">
                                <img src="../img/${carrinho.nomeImagem}" alt="iconProd" name="iconProd" id="iconProd"/>
                             </div>
                                
                         <div class="col-sm">
                         <legend  class="w-auto legend">
                                <div class="container">
                                    <h2>${carrinho.nomeProduto}</h2>
                                </div>
                         </legend>
                             
                            <div class="row">
                            <div class="col-sm">
                                <p><b><li>Preço:</b> R$ ${carrinho.precoProduto}</li></p>
                            </div>
                            <div class="col-sm">
                                <p><b><li>Qtd:</b> R$ ${carrinho.precoProduto*carrinho.qtdDesejada}</li></p>
                            </div>
                            </div>
                                <c:if test="${param.qtdAcima}">
                                            
                                                <legend>Este produto possui apenas x em estoque.</legend>
                                            
                                </c:if>
                                                
                                <%
                                   count ++;
                                   divValidaQtd = "divValidaQtd"+count;
                                   divValidaQtd02 = "divValidaQtd02"+count;
                                   divValidaQtd03 = "divValidaQtd03"+count;
                                   divExcluirProd = "divExcluirProd"+count;
                                   divQtdDesejada = "divQtdDesejada"+count;
                                %>
                                <div class="row">
                                <div class="col-sm" id="<%= divQtdDesejada %>">
                                <select name="qtd_desejada" id="qtd_desejada" class="form-control" onChange="validarQtd(this,'<%= divValidaQtd %>', '<%= divValidaQtd03 %>', '<%= divExcluirProd %>','<%= divQtdDesejada %>','${carrinho.idItem}', '${carrinho.fkUsuario}', '${carrinho.nomeCliente}', '${carrinho.qtdEstoque}');" required>
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
                                </select>
                                </div>
                                 
                                               
                            
                            <div class="col-sm" style='display: none;' id="<%= divValidaQtd %>">
                            <label for="colFormLabelLg" class="form-label h4"> Qtd: </label>
                            <input class="form-control form-control-lg" type="number" id="<%= divValidaQtd02 %>" min="0" name="validaQtd" required>
                            </div>
                            <div class="col-sm" style='display: none;' id="<%= divValidaQtd03 %>" name="BTNAtt">
                            <button type="submit" class="btn btn-dark form-control form-control-lg h4" onClick="validarQtdBTN('<%= divValidaQtd02 %>','${carrinho.idItem}', '${carrinho.fkUsuario}', '${carrinho.nomeCliente}', '${carrinho.qtdEstoque}');">Atualizar</button>
                            </div>      
                                               
                            <div class="col-sm"  id="<%= divExcluirProd %>">
                                ,<h7><b><a href="remover-item?id_item=${carrinho.idItem}&id_usuario=${carrinho.fkUsuario}&nome_cliente=${carrinho.nomeCliente}">Excluir</a></b></h7>
                            </div>
                         </div>
                         <br>
                         </div>
                         </div>
                         <br><br>
                    </c:forEach>
                    
                         
               
                        
                        <c:if test="${not empty listaCarrinho}">
                            <legend id="subTotalFim"><b>Sub-total dos itens:</b> <%= df.format(subTotal) %></legend>
                         <div class="row">
                         <div class="col-sm">
                                        <a href="landing-page"><button type="button" class="btn btn-dark form-control form-control-lg h4">Continuar comprando</button></a>
                         </div>
                    <c:choose>
                                <c:when test="${sessionScope.usuario.grupo!=null}">
                                 
                                    <div class="col-sm">
                                        <a href="checkout-endereco?id_usuario=${sessionScope.usuario.idUsuario}"><button type="button" class="btn btn-dark form-control form-control-lg h4">Fechar pedido</button></a>
                                    </div>
                                    
                                </c:when>
                               
                        <c:otherwise>
                                    <div class="col-sm">
                                        <a href="login.jsp"><button type="button" class="btn btn-dark form-control form-control-lg h4">Fechar pedido</button></a>
                                    </div>
                        </c:otherwise>
                    </c:choose>            
                         </div>
                        </c:if>
                </fieldset>
                
                <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
        
                
                <script>
                    
                           function validarFreteDeslogado(){
                               var x = document.getElementById("opcoes-frete");
                               var y = document.getElementById("CEP").value;
                               var z = y.length;
                               
                               if(y === ''){
                                   window.alert("Informe o CEP!");
                                   var x = document.getElementById("opcoes-frete");
                                   x.style.display = "none";
                                   return;
                               }else if (z < 8 || z > 9){
                                   window.alert("Informe um CEP válido!");
                                   var x = document.getElementById("opcoes-frete");
                                   x.style.display = "none";
                                   return;

                               }else{
                                   
                                   x.style.display = "block";
                                   
                               }
                               
                           }
                           
                           function calcularTotalDeslogado(valorFrete, subTotal){
                
                                let novoValor = parseFloat(subTotal)+parseFloat(valorFrete);
                                document.getElementById("total_pedido").innerHTML = "R$ "+novoValor.toFixed(2);
                                document.getElementById("frete_pedido").innerHTML = "R$ "+valorFrete.toFixed(2);
                            }
                       
                            function validarQtd(elemento, div, div03, divExcluir, divQtdDesejada, idItem, idUsuario, nomeCliente, qtdEstoque){
                            
                            let QtdDesejada = parseInt(elemento.value);
                            let estoque = parseInt(qtdEstoque);
                            
                            if(elemento.value === '0'){
                                $.ajax({
                                    method: "GET",
                                    url: "remover-item?id_item="+idItem+"&id_usuario="+idUsuario+"&nome_cliente="+nomeCliente
                                })
                                .done(function( msg ) {
                                    location.reload();
                                 });
                            }
                            else if (elemento.value === '10'){
                                
                                    var x = document.getElementById(div);
                                    var y = document.getElementById(div03);
                                    var z = document.getElementById(divExcluir);
                                    var a = document.getElementById(divQtdDesejada);
                                    x.style.display = "flex";
                                    y.style.display = "flex";
                                    z.style.display = "none";
                                    a.style.display = "none";
                                    return;
                            }
                            
                            
                            else if (QtdDesejada > estoque){
                                     
                                    window.alert("Este produto possui apenas "+ estoque + " itens em estoque.");
                                    document.getElementById("qtd_desejada").value = qtdEstoque;
                                    
                                    $.ajax({
                                    method: "GET",
                                    url: "att-qtd?id_item="+idItem+"&id_usuario="+idUsuario+"&nome_cliente="+nomeCliente+"&qtd_desejada="+qtdEstoque
                                })
                                 .done(function( msg ) {
                                            location.reload();
                                 });
                                 
                                   }
                                   else{
                                    
                                        $.ajax({
                                    method: "GET",
                                    url: "att-qtd?id_item="+idItem+"&id_usuario="+idUsuario+"&nome_cliente="+nomeCliente+"&qtd_desejada="+elemento.value
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
                                    url: "remover-item?id_item="+idItem+"&id_usuario="+idUsuario+"&nome_cliente="+nomeCliente
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
                                    url: "att-qtd?id_item="+idItem+"&id_usuario="+idUsuario+"&nome_cliente="+nomeCliente+"&qtd_desejada="+qtdEstoque
                                })
                                 .done(function( msg ) {
                                            location.reload();
                                 });
                                 
                                   }
                                   else{
                                    
                                        $.ajax({
                                    method: "GET",
                                    url: "att-qtd?id_item="+idItem+"&id_usuario="+idUsuario+"&nome_cliente="+nomeCliente+"&qtd_desejada="+elemento
                                        })
                                        .done(function( msg ) {
                                            location.reload();
                                 });
                                        
                                    }
                                    
                            }
                </script>
                
                
                
                <c:choose>
                    <c:when test="${sessionScope.usuario.grupo!=null}">
                        <c:if test="${not empty listaCarrinho}">
                <div>
                
                <div class="cardFrete">
                    
                    <h3>Calcular frete</h3>
                    <div class="card-total">
                    <p>CEP do endereço principal: <input class="form-control form-control-lg" type="text" id="CEP" name="CEP" value="${CEP}" required></p>
                    </div>
                    <div class="linha"></div>
                    <div class="card-total">
                        <div>Itens</div>
                        <div>R$ <%= df.format(subTotal) %></div>
                    </div>
                    <div class="card-total">
                        <div>Frete e manuseio</div>
                        <c:if test="${empty listaCheckout}">
                            <div id="frete_pedido">R$ <%= df.format(fretePadrao) %></div>
                        </div>
                        <div class="linha"></div>
                        <h3>Total do pedido:</h3>
                            <h4 id="total_pedido">R$ <%= df.format(subTotal+fretePadrao) %></h4>
                        </c:if>
                        <c:forEach var="checkout" items="${listaCheckout}">
                            
                            <%
                            HttpServletRequest httpServletRequest = (HttpServletRequest) request;
                            HttpServletResponse httpServletResponse = (HttpServletResponse) response;
                            Usuario usuario = (Usuario) httpServletRequest.getSession().getAttribute("usuario");
                            int idCliente = ClienteDAO.getIDCliente(usuario.getIdUsuario());
                            Checkout checkout = CheckoutDAO.getCliente(idCliente);
                            
                            double freteCheckout = checkout.getFrete();
                            %>
                            <div id="frete_pedido">R$ <%= df.format(freteCheckout) %></div>
                        </div>
                        <div class="linha"></div>
                        <h3>Total do pedido:</h3>
                            <h4 id="total_pedido">R$ <%= df.format(subTotal+freteCheckout) %></h4>
                        </c:forEach>
                        <button type="submit" class="btn btn-dark form-control form-control-lg h4" onClick="validarFreteDeslogado();">Calcular frete</button>
                    <div id="opcoes-frete">
                                <p><b>Opções de frete</b></p>
                                <c:if test="${empty listaCheckout}">
                                            <div class="form-check">
                                                                  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="44.36" onClick="calcularTotalDeslogado(44.36,'<%= subTotal%>');" required>
                                                                  <label class="form-check-label" for="flexRadioDefault1">
                                                                      <b>R$ 44,36 Entrega Expressa</b> - Receba amanhã
                                                                  </label>
                                                </div>

                                                <div class="form-check">
                                                                  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="15.44" checked onClick="calcularTotalDeslogado(15.44,'<%= subTotal%>');" required>
                                                                  <label class="form-check-label" for="flexRadioDefault2">
                                                                      <b>R$ 15,44 Entrega padrão</b> - 5 dias úteis
                                                                  </label>
                                                </div>

                                                <div class="form-check">
                                                                  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3" value="10.90" onClick="calcularTotalDeslogado(10.90,'<%= subTotal%>');" required>
                                                                  <label class="form-check-label" for="flexRadioDefault3">
                                                                      <b>R$ 10,90 Entrega Sedex</b> - 10 dias úteis
                                                                  </label>
                                                </div>
                                </c:if>
                                
                                <c:forEach var="checkout" items="${listaCheckout}">
                            
                                        <c:choose>
                                        <c:when test="${checkout.frete==44.36}">
                                
                                        <div class="form-check">
                                                                  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="44.36" checked onClick="calcularTotalDeslogado(44.36,'<%= subTotal%>');" required>
                                                                  <label class="form-check-label" for="flexRadioDefault1">
                                                                      <b>R$ 44,36 Entrega Expressa</b> - Receba amanhã
                                                                  </label>
                                                </div>

                                                <div class="form-check">
                                                                  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="15.44"  onClick="calcularTotalDeslogado(15.44,'<%= subTotal%>');" required>
                                                                  <label class="form-check-label" for="flexRadioDefault2">
                                                                      <b>R$ 15,44 Entrega padrão</b> - 5 dias úteis
                                                                  </label>
                                                </div>

                                                <div class="form-check">
                                                                  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3" value="10.90" onClick="calcularTotalDeslogado(10.90,'<%= subTotal%>');" required>
                                                                  <label class="form-check-label" for="flexRadioDefault3">
                                                                      <b>R$ 10,90 Entrega Sedex</b> - 10 dias úteis
                                                                  </label>
                                                </div>
                                
                                
                            </c:when>
                            
                            <c:when test="${checkout.frete==15.44}">
                                
                                        <div class="form-check">
                                                                  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="44.36"  onClick="calcularTotalDeslogado(44.36,'<%= subTotal%>');" required>
                                                                  <label class="form-check-label" for="flexRadioDefault1">
                                                                      <b>R$ 44,36 Entrega Expressa</b> - Receba amanhã
                                                                  </label>
                                                </div>

                                                <div class="form-check">
                                                                  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="15.44" checked onClick="calcularTotalDeslogado(15.44,'<%= subTotal%>');" required>
                                                                  <label class="form-check-label" for="flexRadioDefault2">
                                                                      <b>R$ 15,44 Entrega padrão</b> - 5 dias úteis
                                                                  </label>
                                                </div>

                                                <div class="form-check">
                                                                  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3" value="10.90" onClick="calcularTotalDeslogado(10.90,'<%= subTotal%>');" required>
                                                                  <label class="form-check-label" for="flexRadioDefault3">
                                                                      <b>R$ 10,90 Entrega Sedex</b> - 10 dias úteis
                                                                  </label>
                                                </div>
                                
                            </c:when>
                            
                            <c:when test="${checkout.frete==10.90}">
                                
                               <div class="form-check">
                                                                  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="44.36"  onClick="calcularTotalDeslogado(44.36,'<%= subTotal%>');" required>
                                                                  <label class="form-check-label" for="flexRadioDefault1">
                                                                      <b>R$ 44,36 Entrega Expressa</b> - Receba amanhã
                                                                  </label>
                                                </div>

                                                <div class="form-check">
                                                                  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="15.44"  onClick="calcularTotalDeslogado(15.44,'<%= subTotal%>');" required>
                                                                  <label class="form-check-label" for="flexRadioDefault2">
                                                                      <b>R$ 15,44 Entrega padrão</b> - 5 dias úteis
                                                                  </label>
                                                </div>

                                                <div class="form-check">
                                                                  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3" value="10.90"  checked onClick="calcularTotalDeslogado(10.90,'<%= subTotal%>');" required>
                                                                  <label class="form-check-label" for="flexRadioDefault3">
                                                                      <b>R$ 10,90 Entrega Sedex</b> - 10 dias úteis
                                                                  </label>
                                                </div>
                                
                            </c:when>
            </c:choose>
                             </c:forEach>
                                
                                
                                
                                
                                
                                
                    </div>
                </div>
               </div>
             </c:if>
                        
                        
                        
                     </c:when>
                    <c:otherwise>
                        
                        
                        <c:if test="${not empty listaCarrinho}">
                <div>
                
                <div class="cardFrete">
                    
                    <h3>Calcular frete</h3>
                    <div class="card-total">
                    <p>CEP: <input class="form-control form-control-lg" type="text" id="CEP" name="CEP" required></p>
                    </div>
                    <div class="linha"></div>
                    <div class="card-total">
                        <div>Itens</div>
                        <div>R$ <%= df.format(subTotal) %></div>
                    </div>
                    <div class="card-total">
                        <div>Frete e manuseio</div>
                        <div id="frete_pedido">R$ </div>
                    </div>
                    <div class="linha"></div>
                    <h3>Total do pedido:</h3>
                        <h4 id="total_pedido">R$ <%= df.format(subTotal) %></h4>
                        <button type="submit" class="btn btn-dark form-control form-control-lg h4" onClick="validarFreteDeslogado();">Calcular frete</button>
                    <div id="opcoes-frete" style="display: none;">
                                <p><b>Opções de frete</b></p>
                                            <div class="form-check">
                                                                  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="44.36" onClick="calcularTotalDeslogado(44.36,'<%= subTotal%>');" required>
                                                                  <label class="form-check-label" for="flexRadioDefault1">
                                                                      <b>R$ 44,36 Entrega Expressa</b> - Receba amanhã
                                                                  </label>
                                                </div>

                                                <div class="form-check">
                                                                  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="15.44" onClick="calcularTotalDeslogado(15.44,'<%= subTotal%>');" required>
                                                                  <label class="form-check-label" for="flexRadioDefault2">
                                                                      <b>R$ 15,44 Entrega padrão</b> - 5 dias úteis
                                                                  </label>
                                                </div>

                                                <div class="form-check">
                                                                  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3" value="10.90" onClick="calcularTotalDeslogado(10.90,'<%= subTotal%>');" required>
                                                                  <label class="form-check-label" for="flexRadioDefault3">
                                                                      <b>R$ 10,90 Entrega Sedex</b> - 10 dias úteis
                                                                  </label>
                                                </div>
                    </div>
                </div>
               </div>
             </c:if>     
                        
                    </c:otherwise>
            </c:choose>
                
                
                

       </div>
         
    </body>
</html>
