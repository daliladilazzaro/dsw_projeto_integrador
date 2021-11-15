
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="../css/cadastro-cliente.css">
      
        <title>Cadastrar dados</title>
        
    </head>
    <body>
        
        <style>
            #ValidaEndereco{            
                
                margin-top: 25%;
            }
            #flexCheckDefault{
                
                margin-top: 23%;
                
            }
            
            
        </style>
        
       <c:import url="menu-cliente.jsp"/>
       
        <c:if test="${param.CadastroExistente}">
            <div class="alert alert-danger" role="alert">
               Já possui uma conta cadastrada com este e-mail!
            </div>
        </c:if>
       
       <c:if test="${param.CPFExistente}">
            <div class="alert alert-danger" role="alert">
               Já possui uma conta cadastrada com este CPF!
            </div>
        </c:if>
        <form  action="cadastro-cliente" method="POST" class="formulario" autocomplete="off">
        <div class="container mt-5">
            <fieldset class="border p-3 fieldset mb-25 col py-3 px-md-5 border" id="grad">
                
                        <legend  class="w-auto legend">
                            <div class="container">
                                <h2> Cadastrar meus dados</h2>
                                <img src="../img/person-icon.png" alt="person">
                            </div>
                        </legend>
            
        <div class="row">
                        <div class="col-sm">
                            <label for="colFormLabelLg" class="form-label h4">* Nome Completo: </label>
                            <input class="form-control form-control-lg" id="nome" type="text" name="nome" minlength="3" required><br>
                        </div>
                
                        <div class="col-sm">
                            <label for="colFormLabelLg" class="form-label h4">* CPF (Ex: 123.456.789-00): </label>
                            <input class="form-control form-control-lg" id="CPF" type="text" name="CPF" pattern="\d{3}\.\d{3}\.\d{3}-\d{2}" required><br>

                        </div>
        </div>
                        
        <div class="row">
                        <div class="col-sm">
                            <label for="colFormLabelLg" class="form-label h4">* E-mail: </label>
                            <input class="form-control form-control-lg" id="email" type="email" maxlength="100" name="email" required><br>
                        </div>
        </div>
                
        <div class="row">
            
                        <div class="col-sm">
                            <label for="colFormLabelLg" class="form-label h4">* Nascimento: </label>
                            <input class="form-control form-control-lg" id="nascimento" type="date" name="nascimento" required><br>
                        </div>
            
                        <div class="col-sm">
                        <label for="colFormLabelLg" class="form-label h4">* Genêro: </label>
                             <select name="genero" id="genero" class="form-control" required>
                                    <option value="Masculino">Masculino</option>
                                    <option value="Feminino">Feminino</option>
                                    <option value="Não quero informar">Não quero informar</option>
                             </select>
                        </div>
        </div>
                        
                        
        <div class="row">
                        <div class="col-sm">
                            <label for="colFormLabelLg" class="form-label h4">* Senha: </label>
                            <input class="form-control form-control-lg" id="senha" type="password" name="senha" required><br>
                        </div> 
            
                        <div class="col-sm">
                            <label for="colFormLabelLg" class="form-label h4">* Confirmação de senha: </label>
                            <input class="form-control form-control-lg" id="confirmSenha" type="password" name="confirmSenha" onChange="validaSenha()" required><br>
                        </div>
            
        </div>
      
                
            </fieldset>
            
           
    </div>
            
        <div class="container mt-5">
            <fieldset class="border p-3 fieldset mb-25 col py-3 px-md-5 border" id="grad">
                
                        <legend  class="w-auto legend">
                            <div class="container">
                                <h2> Endereço de entrega</h2>
                                <img src="../img/Maps-Pin-Place-icon.png" alt="person">
                            </div>
                        </legend>
                
            <div class="row">
                            <div class="col-sm">
                                            <label for="colFormLabelLg" class="form-label h4">* Digite o CEP: </label>
                                            <input class="form-control form-control-lg" name="CEP01" type="text" id="CEP01" value="" size="10" maxlength="9" onblur="pesquisacep(this.value);" required><br>
                            </div>
                            <div class="col-sm">
                                <label for="colFormLabelLg" class="form-label h4">* Logradouro: </label>
                                <input class="form-control form-control-lg" id="logradouro01" type="text" name="logradouro01" readOnly="true" required><br>
                            </div>
            </div>
            
            <div class="row">
                            <div class="col-sm">
                                <label for="colFormLabelLg" class="form-label h4">* Bairro: </label>
                                <input class="form-control form-control-lg" id="bairro01" type="text" name="bairro01" readOnly="true" required><br>
                            </div>
                
                            <div class="col-sm">
                                <label for="colFormLabelLg" class="form-label h4">* Cidade: </label>
                                <input class="form-control form-control-lg" id="cidade01" type="text" name="cidade01" readOnly="true" required><br>
                            </div>
                
                            <div class="col-sm">
                                <label for="colFormLabelLg" class="form-label h4">* Estado: </label>
                                <input class="form-control form-control-lg" id="estado01" type="text" name="estado01" readOnly="true" required><br>
                            </div>
                
                            <div class="col-sm">
                                <label for="colFormLabelLg" class="form-label h4">* Número: </label>
                                <input class="form-control form-control-lg" id="numero01" type="number" min="0" name="numero01" required><br>
                            </div>
                
                
                            <div class="col-sm">
                              <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="ValidaEndereco" name="ValidaEndereco" onClick="replicaEndereco()">
                                    <label class="form-check-label" for="flexCheckDefault" id="flexCheckDefault">
                                     Usar este endereço para cobrança.
                                    </label>
                              </div>
 
                            </div>
            
            </div>
            </fieldset>
        </div>
            
        <div class="container mt-5">
            <fieldset class="border p-3 fieldset mb-25 col py-3 px-md-5 border" id="grad">
                
                        <legend  class="w-auto legend">
                            <div class="container">
                                <h2> Endereço de cobrança</h2>
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
                          <button type="submit" class="btn btn-dark form-control form-control-lg h4">Salvar</button>
            </div>

            <div class="col-sm">
                           <a href="#"><button type="button" class="btn btn-dark form-control form-control-lg h4">Cancelar</button></a>
            </div>
                       
          </div>
                
            </fieldset>
        </div>
      
    </form>
       
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
        <script>
            
            $("#CPF").mask("000.000.000-00");

            function validaSenha() {
                

                let s1 = document.getElementById('senha').value
                let s2 = document.getElementById('confirmSenha').value

                if (s2 != s1) {
                    alert("Às senhas estão diferentes!");
                    document.getElementById("confirmSenha").value = "";
                }
            }
            
            //Validação endereço de entrega:
            
            
             function replicaEndereco() {
                 
                 let checkbox = document.getElementById('ValidaEndereco');
                 
                 if(checkbox.checked) {
                        document.getElementById('CEP02').value=(document.getElementById('CEP01').value);
                        document.getElementById('logradouro02').value=(document.getElementById('logradouro01').value);
                        document.getElementById('bairro02').value=(document.getElementById('bairro01').value);
                        document.getElementById('cidade02').value=(document.getElementById('cidade01').value);
                        document.getElementById('estado02').value=(document.getElementById('estado01').value);
                        document.getElementById('numero02').value=(document.getElementById('numero01').value);
                    } else {
                        document.getElementById('CEP02').value=("");
                        document.getElementById('logradouro02').value=("");
                        document.getElementById('bairro02').value=("");
                        document.getElementById('cidade02').value=("");
                        document.getElementById('estado02').value=("");
                        document.getElementById('numero02').value=("");
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
