    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="../../css/cadastro-cliente.css">
      
        <title>Cadastrar dados</title>
        
    </head>
    <body>
        
        <style>
            
            .cardEndereco{
    
                height: auto;
                background-color: rgba(253, 253, 253,  0.89); /* For browsers that do not support gradients */
                background-image: linear-gradient(to bottom right, #c0c0c0, transparent);
                border-radius: 30px;
    
            }
            
            .cardEndereco > li{
    
                margin-left: 5%;
    
            }
            
            #principal{
                
                height: 30px;
            }
            
            #lixeira{
                
                height: 40px;
                margin-left: 87%;
            }
            
            
            
        </style>
            
            
        
       <c:import url="../../Publico/menu-cliente-logado.jsp"/>
       
       <c:if test="${param.EnderecoExistente}">
            <div class="alert alert-danger" role="alert">
               Você já tem um endereço de cobrança cadastrado!
            </div>
        </c:if>
       
        <form action="alterar-cliente?id_usuario=${sessionScope.usuario.idUsuario}" method="POST" class="formulario" autocomplete="off">
        <div class="container mt-5">
            <fieldset class="border p-3 fieldset mb-25 col py-3 px-md-5 border" id="grad">
                
                        <legend  class="w-auto legend">
                            <div class="container">
                                <h2> Meus dados pessoais</h2>
                                <img src="../../img/person-icon.png" alt="person">
                            </div>
                        </legend>
        <c:if test="${not empty cliente}">
        <div class="row">
                        <div class="col-sm">
                            <label for="colFormLabelLg" class="form-label h4">* Nome Completo: </label>
                            <input class="form-control form-control-lg" id="nome" type="text" name="nome" value="${cliente.nome}" required><br>
                        </div>
                
                        <div class="col-sm">
                            <label for="colFormLabelLg" class="form-label h4">* CPF (Ex: 123.456.789-00): </label>
                            <input class="form-control form-control-lg" id="CPF" type="text" name="CPF" x pattern="\d{3}\.\d{3}\.\d{3}-\d{2}" value="${cliente.CPF}" readOnly="true" required><br>

                        </div>
        </div>
                        
        <div class="row">
                        <div class="col-sm">
                            <label for="colFormLabelLg" class="form-label h4">* E-mail: </label>
                            <input class="form-control form-control-lg" id="email" type="email" maxlength="100" name="email" value="${cliente.email}" readOnly="true" required><br>
                        </div>
        </div>
                
        <div class="row">
            
                        <div class="col-sm">
                            <label for="colFormLabelLg" class="form-label h4">* Nascimento: </label>
                            <input class="form-control form-control-lg" id="nascimento" type="date" name="nascimento" value="${cliente.nascimento}" required><br>
                        </div>
            
                        <div class="col-sm">
                        <label for="colFormLabelLg" class="form-label h4">* Genêro: </label>
                             <select name="genero" id="genero" class="form-control" required>
                                    <option value="${cliente.genero}">${cliente.genero}</option>
                                    <option value="Masculino">Masculino</option>
                                    <option value="Feminino">Feminino</option>
                                    <option value="Não quero informar">Não quero informar</option>
                             </select>
                        </div>
        </div>
                        
                        
        <div class="row">
                        <div class="col-sm">
                            <label for="colFormLabelLg" class="form-label h4"> Senha (opcional): </label>
                            <input class="form-control form-control-lg" id="senha" type="password" name="senha"><br>
                        </div>
            
                        <div class="col-sm">
                            <label for="colFormLabelLg" class="form-label h4"> Confirmação de senha: </label>
                            <input class="form-control form-control-lg" id="confirmSenha" type="password" name="confirmSenha" onChange="validaSenha()"><br>
                        </div>
            
        </div>
        <div class="row">
            <div class="col-sm">
                          <button onclick="validaSenha()" type="submit" class="btn btn-dark form-control form-control-lg h4">Alterar dados</button>
            </div>
                       
          </div>
      
            </c:if> 
            </fieldset>
        </div>
   </form>
            
        <div class="container mt-5">
            <fieldset class="border p-3 fieldset mb-25 col py-3 px-md-5 border" id="grad">
              
                        <legend  class="w-auto legend">
                            <div class="container">
                                <h2> Meus endereços</h2>
                                <img src="../../img/Maps-Pin-Place-icon.png" alt="person">
                            </div>
                        </legend>
                
               <div class="row">
                    
                    <c:forEach var="endereco" items="${listaEnderecos}">
                    <div class="col-md-5">
                        <div class="cardEndereco">
                            <br>
                            <center><h5>Endereço de ${endereco.tipo}</h5></center>
                            <li><b>CEP:</b> <span>${endereco.CEP}</span></li>
                            <li><b>Logradouro:</b> <span>${endereco.logradouro}</span></li>
                            <li><b>Bairro:</b> <span>${endereco.bairro}</span></li>
                            <li><b>Cidade:</b> <span>${endereco.cidade}</span></li>
                            <li><b>Estado:</b> <span>${endereco.estado}</span></li>
                            <li><b>Número:</b> <span>${endereco.numero}</span></li>
                            
                            <c:choose>
                            <c:when test="${endereco.tipo=='Entrega'}">
                                        <c:choose>
                                        <c:when test="${endereco.padrao=='Complementar'}">
                                         <li><span><b>Utilizar este endereço no checkout ? </b></span><a href="endereco-padrao?idEndereco=${endereco.idEndereco}&id_usuario=${sessionScope.usuario.idUsuario}"><img src="../../img/Status-user-busy-icon.png" alt="principal/complementar" class="bin"/></a></li>
                                        </c:when>
                                        <c:otherwise>
                                          <li><span><b>Utilizar este endereço no checkout ? </b></span><a href="endereco-padrao?idEndereco=${endereco.idEndereco}&id_usuario=${sessionScope.usuario.idUsuario}"><img src="../../img/Status-user-online-icon.png" alt="principal/complementar" class="bin"/></a></li>
                                         </c:otherwise>
                                        </c:choose>
                            </c:when>
                            </c:choose>
                            
                            <img src="../../img/garbageIcon.png" alt="lixeira" onclick="confirmarExclusao(${endereco.idEndereco})"id="lixeira">
                            <br><br>
                            
                        </div>
                        
                        <br>
                    </div>
                            
                    </c:forEach>
                    </div>
            </fieldset>
        </div>
            
       <form action="cadastrar-endereco?id_usuario=${sessionScope.usuario.idUsuario}" method="POST" class="formulario" autocomplete="off">
        <div class="container mt-5">
            <fieldset class="border p-3 fieldset mb-25 col py-3 px-md-5 border" id="grad">
                
                        <legend  class="w-auto legend">
                            <div class="container">
                                <h2> Cadastrar novo endereço</h2>
                                <img src="../../img/Maps-Pin-Place-icon.png" alt="person">
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
                            <div class="col-sm">
                                <label for="colFormLabelLg" class="form-label h4">* Tipo: </label>
                                     <select name="tipo" id="tipo" class="form-control" required>
                                            <option value="Entrega">Endereço de Entrega</option>
                                            <option value="Cobrança">Endereço de Cobrança</option>
                                     </select>
                            </div>
            
            </div>
          <div class="row">
            <div class="col-sm">
                          <button type="submit" class="btn btn-dark form-control form-control-lg h4" onClick="window.location.reload();">Adicionar endereço</button>
            </div>
                       
          </div>
                
            </fieldset>
        </div>
        
        <div class="modal" tabindex="-1" id="modal1">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title">Confirmar Exclusão</h5>
                  <button type="button" class="btn-close"
                          data-bs-dismiss="modal" aria-label="Close" onclick="fecharModal()"></button>
                </div>
                <div class="modal-body">
                    <p>Confirmar a exclusão do endereço?<label id="idEndereco" style="color: white"></label></p>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="fecharModal()">Cancelar</button>
                  <button type="button" class="btn btn-danger" onclick="deletarEndereco()">Confirmar</button>
                </div>
              </div>
            </div>
          </div>
        
       </form>
      
    
       
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
        <script>
            
            function confirmarExclusao(IdEndereco) {
                console.log("Sucesso!" , IdEndereco);
                $("#idEndereco").html(IdEndereco);
                $("#modal1").show();
            }
            
            function fecharModal(){
                $(".modal").hide();
            }
            
            function deletarEndereco() {
                var idEndereco = $("#idEndereco").html();
                $("#modal1").hide();
                //Chamada AJAX para o servlet
                $.ajax({
                    method: "GET",
                    url: "inativar-endereco?idEndereco="+idEndereco
                })
                .done(function( msg ) {
                   location.reload();
                });
            }
            
            $("#CPF").mask("000.000.000-00");

            function validaSenha() {
                

                let s1 = document.getElementById('senha').value
                let s2 = document.getElementById('confirmSenha').value

                if (s2 != s1) {
                    event.preventDefault();
                    alert("Confirmação de senha inválida!");
                    document.getElementById("confirmSenha").value = "";
                }
            }
            
            
            //Validações CEP:
            
    function limpa_formulário_cep() {
            //Limpa valores do formulário de cep.
            document.getElementById('logradouro01').value=("");
            document.getElementById('bairro01').value=("");
            document.getElementById('cidade01').value=("");
            document.getElementById('estado01').value=("");
    }
    
    function limpa_formulário_cep02() {
            //Limpa valores do formulário de cep.
            document.getElementById('logradouro02').value=("");
            document.getElementById('bairro02').value=("");
            document.getElementById('cidade02').value=("");
            document.getElementById('estado02').value=("");
    }

    function meu_callback(conteudo) {
        if (!("erro" in conteudo)) {
            //Atualiza os campos com os valores.
            document.getElementById('logradouro01').value=(conteudo.logradouro);
            document.getElementById('bairro01').value=(conteudo.bairro);
            document.getElementById('cidade01').value=(conteudo.localidade);
            document.getElementById('estado01').value=(conteudo.uf);
        } //end if.
        else {
            //CEP não Encontrado.
            limpa_formulário_cep();
            alert("CEP não encontrado.");
        }
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
        
    function pesquisacep(valor) {

        //Nova variável "cep" somente com dígitos.
        var cep = valor.replace(/\D/g, '');

        //Verifica se campo cep possui valor informado.
        if (cep != "") {

            //Expressão regular para validar o CEP.
            var validacep = /^[0-9]{8}$/;

            //Valida o formato do CEP.
            if(validacep.test(cep)) {

                //Preenche os campos com "..." enquanto consulta webservice.
                document.getElementById('logradouro01').value="...";
                document.getElementById('bairro01').value="...";
                document.getElementById('cidade01').value="...";
                document.getElementById('estado01').value="...";

                //Cria um elemento javascript.
                var script = document.createElement('script');

                //Sincroniza com o callback.
                script.src = 'https://viacep.com.br/ws/'+ cep + '/json/?callback=meu_callback';

                //Insere script no documento e carrega o conteúdo.
                document.body.appendChild(script);

            } //end if.
            else {
                //cep é inválido.
                limpa_formulário_cep();
                alert("Formato de CEP inválido.");
            }
        } //end if.
        else {
            //cep sem valor, limpa formulário.
            limpa_formulário_cep();
        }
    };
    
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
