<%-- 
    Document   : checkout
    Created on : 07/11/2021, 09:37:12
    Author     : ygor.oliveira
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="Model.Checkout"%>
<%@page import="DAO.CheckoutDAO"%>
<%@page import="DAO.ClienteDAO"%>
<%@page import="Model.Usuario"%>
<%@page import="Model.Carrinho"%>
<%@page import="DAO.CarrinhoDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <title>Checkout da compra</title>
    </head>
    <body>
        
        <style>
                            /*imagem do h1 e h2*/
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

                #grad{
                                height: auto;
                                background-color: #fff;
                                border-radius: 30px;
                }


                body{
                                background-position:center;
                                background-image: url(../img/FundoWallpaper04.jpg);
                                position: relative;
                                height: 100vh;
                                width: 100vw;
                                /* adicionando imagem de fundo */
                                background-size: cover;
                }

                .cardEndereco{

                                height: auto;
                                background-color: rgba(252, 182, 245, 1); /* For browsers that do not support gradients */
                                background-image: linear-gradient(to bottom right, #F78EEE, transparent);
                                border-radius: 30px;
                                width: auto;

                }

                .cardEndereco > li{

                                margin-left: 5%;
                }
            
        </style>
        
        <c:import url="menu-cliente.jsp"/>
         <%
                           String userAgent = request.getHeader("user-agent");
                           double subTotal =0.0;
                           double fretePadrao = 15.44;
                           double freteCheckout = 0.0;
                           HttpServletRequest httpServletRequest = (HttpServletRequest) request;
                           HttpServletResponse httpServletResponse = (HttpServletResponse) response;
                           Usuario usuario = (Usuario) httpServletRequest.getSession().getAttribute("usuario");
                           
                           if (session.getAttribute("usuario") != null) {
                                 List<Carrinho> listaCarrinho = CarrinhoDAO.listaCarrinhoLogado(usuario.getIdUsuario());
                                 for(Carrinho c:listaCarrinho){
                                    subTotal+= (c.getPrecoProduto()*c.getQtdDesejada());
                                 }
                           }
                           DecimalFormat df = new DecimalFormat("#,###.00");
                           
                           
         %>
                    <div class="container mt-5">
            
                       <form action="add-endereco-checkout?id_usuario=${sessionScope.usuario.idUsuario}" method="POST" class="formulario" autocomplete="off">
                       <fieldset class="border p-3 fieldset mb-25 col py-3 px-md-5 border" id="grad">
                           <legend  class="w-auto legend">
                            <div class="container">
                                <h2>Endereço</h2>
                                <img src="../img/Maps-Pin-Place-icon.png" alt="person">
                            </div>
                           
                            </legend>
                           <p><li><a href="add-produto?id_usuario=${sessionScope.usuario.idUsuario}">Editar itens do carrinho</a></li></p>
                        
                    <div class="row">
                     <p>Marque abaixo o endereço para realizar a entrega do pedido</p>
                
                    <c:forEach var="endereco" items="${listaEnderecos}">
                        <div class="col-md-5">
                        <div class="cardEndereco">
                            
                            
                            <c:choose>
                            <c:when test="${endereco.padrao=='Principal'}">
                        
                        <input class="form-check-input" type="radio" name="enderecoEscolhido" id="enderecoEscolhido" value="${endereco.idEndereco}" checked required>
                        <br>
                            <li>${endereco.logradouro}, ${endereco.numero} - ${endereco.bairro} - ${endereco.cidade} - ${endereco.estado}</li>
                        <br>
                        
                     </c:when>
                    <c:otherwise>
                    
                    <input class="form-check-input" type="radio" name="enderecoEscolhido" id="enderecoEscolhido" value="${endereco.idEndereco}" required>
                        <br>
                            <li>${endereco.logradouro}, ${endereco.numero} - ${endereco.bairro} - ${endereco.cidade} - ${endereco.estado}</li>
                        <br>
                    </c:otherwise>
            </c:choose> 
                        </div>
                            <br>
                     </div>
                    </c:forEach>
                    </div>
                        <br>
                        
                        <p>Selecione uma opção de frete</p>
                        
                        
                        <c:if test="${empty listaCheckout}">
                            
                            <div class="form-group form-check-inline">
                                                  <input class="form-check-input" type="radio" name="frete" id="Frete01" value="44.36"  onClick="attSubTotal('<%= subTotal %>',44.36)" required>
                                                  <label class="form-check-label" for="Frete01">
                                                      <b>R$ 44,36 Entrega Expressa</b> - Receba amanhã
                                                  </label>
                                        </div>

                                        <div class="form-group form-check-inline">
                                                  <input class="form-check-input" type="radio" name="frete" id="Frete02" value="15.44" checked onClick="attSubTotal('<%= subTotal %>',15.44)" required>
                                                  <label class="form-check-label" for="Frete02">
                                                      <b>R$ 15,44 Entrega padrão</b>    - 5 dias úteis
                                                  </label>
                                        </div>

                                        <div class="form-group form-check-inline">
                                                    <input class="form-check-input" type="radio" name="frete" id="Frete03" value="10.90"  onClick="attSubTotal('<%= subTotal %>',10.90)" required>
                                                    <label class="form-check-label" for="Frete03">
                                                        <b>R$ 10,90 Entrega sedex</b> - 10 dias úteis
                                                    </label>
                                        </div>
                            
                        </c:if>
                        
                        
                        
                        
                        
                        <div class="row" id="FreteEscolhido">
                        <div class="col-sm">
                            <c:forEach var="checkout" items="${listaCheckout}">
                                
                                <%
                                       
                                        int idCliente = ClienteDAO.getIDCliente(usuario.getIdUsuario());
                                        Checkout checkout = CheckoutDAO.getCliente(idCliente);

                                        freteCheckout = checkout.getFrete();
                                %>
                            
                            <c:choose>
                            <c:when test="${checkout.frete==44.36}">
                                
                                        <div class="form-group form-check-inline">
                                                  <input class="form-check-input" type="radio" name="frete" id="Frete01" value="44.36" checked onClick="attSubTotal('<%= subTotal %>',44.36)" required>
                                                  <label class="form-check-label" for="Frete01">
                                                      <b>R$ 44,36 Entrega Expressa</b> - Receba amanhã
                                                  </label>
                                        </div>

                                        <div class="form-group form-check-inline">
                                                  <input class="form-check-input" type="radio" name="frete" id="Frete02" value="15.44"  onClick="attSubTotal('<%= subTotal %>',15.44)" required>
                                                  <label class="form-check-label" for="Frete02">
                                                      <b>R$ 15,44 Entrega padrão</b>     - 5 dias úteis
                                                  </label>
                                        </div>

                                        <div class="form-group form-check-inline">
                                                    <input class="form-check-input" type="radio" name="frete" id="Frete03" value="10.90" onClick="attSubTotal('<%= subTotal %>',10.90)" required>
                                                    <label class="form-check-label" for="Frete03">
                                                        <b>R$ 10,90 Entrega sedex</b> - 10 dias úteis
                                                    </label>
                                        </div>
                                
                                
                            </c:when>
                            
                            <c:when test="${checkout.frete==15.44}">
                                
                                        <div class="form-group form-check-inline">
                                                  <input class="form-check-input" type="radio" name="frete" id="Frete01" value="44.36"  onClick="attSubTotal('<%= subTotal %>',44.36)" required>
                                                  <label class="form-check-label" for="Frete01">
                                                      <b>R$ 44,36 Entrega Expressa</b> - Receba amanhã
                                                  </label>
                                        </div>

                                        <div class="form-group form-check-inline">
                                                  <input class="form-check-input" type="radio" name="frete" id="Frete02" value="15.44" checked onClick="attSubTotal('<%= subTotal %>',15.44)" required>
                                                  <label class="form-check-label" for="Frete02">
                                                      <b>R$ 15,44 Entrega padrão</b>     - 5 dias úteis
                                                  </label>
                                        </div>

                                        <div class="form-group form-check-inline">
                                                    <input class="form-check-input" type="radio" name="frete" id="Frete03" value="10.90" onClick="attSubTotal('<%= subTotal %>',10.90)" required>
                                                    <label class="form-check-label" for="Frete03">
                                                        <b>R$ 10,90 Entrega sedex</b> - 10 dias úteis
                                                    </label>
                                        </div>
                                
                            </c:when>
                            
                            <c:when test="${checkout.frete==10.90}">
                                
                                <div class="form-group form-check-inline">
                                                  <input class="form-check-input" type="radio" name="frete" id="Frete01" value="44.36"  onClick="attSubTotal('<%= subTotal %>',44.36)" required>
                                                  <label class="form-check-label" for="Frete01">
                                                      <b>R$ 44,36 Entrega Expressa</b> - Receba amanhã
                                                  </label>
                                        </div>

                                        <div class="form-group form-check-inline">
                                                  <input class="form-check-input" type="radio" name="frete" id="Frete02" value="15.44"  onClick="attSubTotal('<%= subTotal %>',15.44)" required>
                                                  <label class="form-check-label" for="Frete02">
                                                      <b>R$ 15,44 Entrega padrão</b>     - 5 dias úteis
                                                  </label>
                                        </div>

                                        <div class="form-group form-check-inline">
                                                    <input class="form-check-input" type="radio" name="frete" id="Frete03" value="10.90" checked onClick="attSubTotal('<%= subTotal %>',10.90)" required>
                                                    <label class="form-check-label" for="Frete03">
                                                        <b>R$ 10,90 Entrega sedex</b> - 10 dias úteis
                                                    </label>
                                        </div>
                                
                            </c:when>
            </c:choose>
                             </c:forEach>
                            
                        </div></div>
                        
                                    <c:choose>
                                            <c:when test="${empty listaCheckout}">
                                            
                                            <center><span><b>Sub-total: R$</b></span><legend id="subTotal"><%= df.format(subTotal+fretePadrao) %></legend></center>
    
                                            
                                            </c:when>
                                            <c:otherwise>
                                                
                                            <center><span><b>Sub-total: R$</b></span><legend id="subTotal"><%= df.format(subTotal+freteCheckout) %></legend></center>

                                            </c:otherwise>
                                </c:choose> 
                                    
                                    <div class="col-sm">
                                      <button type="submit" class="btn btn-dark form-control form-control-lg h4">Prosseguir para pagamento</button>
                                    </div>
                                    
                       </fieldset></form></div> 
                                    
        <form action="checkout-endereco?id_usuario=${sessionScope.usuario.idUsuario}" method="POST" class="formulario" autocomplete="off">
        <div class="container mt-5">
            <fieldset class="border p-3 fieldset mb-25 col py-3 px-md-5 border" id="grad">
                
                        <legend  class="w-auto legend">
                            <div class="container">
                                <h2>Cadastrar novo endereço</h2>
                                <img src="../img/Maps-Pin-Place-icon.png" alt="person">
                            </div>
                        </legend>
                
            <div class="row">
                            <div class="col-sm">
                                            <label for="colFormLabelLg" class="form-label h4">* Digite o CEP: </label>
                                            <input class="form-control form-control-lg" name="CEP02" type="text" id="CEP02" value="" size="10" maxlength="9" onblur="pesquisacep02(this.value);" required><br>
                            </div>
                            <div class="col-sm">
                                <label for="colFormLabelLg" class="form-label h4">* Logradouro: </label>
                                <input class="form-control form-control-lg" id="logradouro02" type="text" name="logradouro02" readOnly="true" required><br>
                            </div>
            </div>
            
            <div class="row">
                            <div class="col-sm">
                                <label for="colFormLabelLg" class="form-label h4">* Bairro: </label>
                                <input class="form-control form-control-lg" id="bairro02" type="text" name="bairro02" readOnly="true" required><br>
                            </div>
                
                            <div class="col-sm">
                                <label for="colFormLabelLg" class="form-label h4">* Cidade: </label>
                                <input class="form-control form-control-lg" id="cidade02" type="text" name="cidade02" readOnly="true" required><br>
                            </div>
                
                            <div class="col-sm">
                                <label for="colFormLabelLg" class="form-label h4">* Estado: </label>
                                <input class="form-control form-control-lg" id="estado02" type="text" name="estado02" readOnly="true" required><br>
                            </div>
                
                            <div class="col-sm">
                                <label for="colFormLabelLg" class="form-label h4">* Número: </label>
                                <input class="form-control form-control-lg" id="numero02" type="number" min="0" name="numero02" required><br>
                            </div>
            
            </div>
          <div class="row">
            <div class="col-sm">
                          <button type="submit" class="btn btn-dark form-control form-control-lg h4" onClick="window.location.reload();">Adicionar endereço</button>
            </div>
                       
          </div>
                
            </fieldset>
        </div>
        
       </form>
        
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
        <script>
            
            function attSubTotal(subTotal, valorFrete){
                
                 let novoValor = parseFloat(subTotal)+parseFloat(valorFrete);
                 document.getElementById("subTotal").innerHTML = novoValor.toFixed(2);
                 
            }
            
            function exibiFrete(){
               var frete = document.getElementById("CEP02");
               
               if (frete.value === ''){
                                
                    window.alert("Informe o CEP!");
                    var x = document.getElementById("NextPayment");
                    var y = document.getElementById("EscolhaFrete");
                    
                    x.style.display = "none";
                    y.style.display = "none";
                    
                    return;

             }else{
                 
                 var x = document.getElementById("NextPayment");
                 var y = document.getElementById("EscolhaFrete");
                 x.style.display = "block";
                 y.style.display = "block";
                 return;
                 
             }
                
                
                
            }
     
    
    function limpa_formulário_cep02() {
            //Limpa valores do formulário de cep.
            document.getElementById('logradouro02').value=("");
            document.getElementById('bairro02').value=("");
            document.getElementById('cidade02').value=("");
            document.getElementById('estado02').value=("");
    }
    
    function meu_callback02(conteudo) {
        if (!("erro" in conteudo)) {
            //Atualiza os campos com os valores.
            document.getElementById('logradouro02').value=(conteudo.logradouro);
            document.getElementById('bairro02').value=(conteudo.bairro);
            document.getElementById('cidade02').value=(conteudo.localidade);
            document.getElementById('estado02').value=(conteudo.uf);
        } //end if.
        else {
            //CEP não Encontrado.
            limpa_formulário_cep02();
            alert("CEP não encontrado.");
        }
    }
          
    
    function pesquisacep02(valor) {

        //Nova variável "cep" somente com dígitos.
        var cep = valor.replace(/\D/g, '');

        //Verifica se campo cep possui valor informado.
        if (cep != "") {

            //Expressão regular para validar o CEP.
            var validacep = /^[0-9]{8}$/;

            //Valida o formato do CEP.
            if(validacep.test(cep)) {

                //Preenche os campos com "..." enquanto consulta webservice.
                document.getElementById('logradouro02').value="...";
                document.getElementById('bairro02').value="...";
                document.getElementById('cidade02').value="...";
                document.getElementById('estado02').value="...";

                //Cria um elemento javascript.
                var script = document.createElement('script');

                //Sincroniza com o callback.
                script.src = 'https://viacep.com.br/ws/'+ cep + '/json/?callback=meu_callback02';

                //Insere script no documento e carrega o conteúdo.
                document.body.appendChild(script);

            } //end if.
            else {
                //cep é inválido.
                limpa_formulário_cep02();
                alert("Formato de CEP inválido.");
                    var x = document.getElementById("NextPayment");
                    var y = document.getElementById("EscolhaFrete");
                    x.style.display = "none";
                    y.style.display = "none";
            }
        } //end if.
        else {
            //cep sem valor, limpa formulário.
            limpa_formulário_cep02();
        }
    };
        </script>
        
         
    </body>
</html>




