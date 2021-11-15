
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="../../css/cadastro-usuarios.css">
      
        <title>Cadastrar Usuários</title>
        
    </head>
    <body>
        
        <style>
            
            body{
                background-position:center;
                background-image: url(../../img/FundoWallpaper04.jpg);
                position: relative;
                height: 100vh;
                width: 100vw;
                /* adicionando imagem de fundo */
                background-size: cover;
}
        </style><!-- comment -->
       <c:import url="../../Publico/menu-backoffice.jsp"/>
       
        <c:if test="${param.CadastroExistente}">
            <div class="alert alert-danger" role="alert">
               O e-mail informado já está em uso!
            </div>
        </c:if>
        <form  action="cadastrar-usuario" method="POST" class="formulario" autocomplete="off">
        <div class="container mt-5">
            <fieldset class="border p-3 fieldset mb-25 col py-3 px-md-5 border" id="grad">
                
                        <legend  class="w-auto legend">
                            <div class="container">
                                <h2> Cadastrar novos usuários</h2>
                                <img src="../../img/person-icon.png" alt="person">
                            </div>
                        </legend>
            
        <div class="row">
                <!--tamanho do input-->
                        <div class="col-sm">
                            <label for="colFormLabelLg" class="form-label h4">* Nome Completo: </label>
                            <input class="form-control form-control-lg" id="nome" type="text" name="nome" required><br>
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
                            <label for="colFormLabelLg" class="form-label h4">* Senha: </label>
                            <input class="form-control form-control-lg" id="senha" type="password" name="senha" required><br>
                        </div> 
            
                        <div class="col-sm">
                            <label for="colFormLabelLg" class="form-label h4">* Confirmação de senha: </label>
                            <input class="form-control form-control-lg" id="confirmSenha" type="password" name="confirmSenha" onChange="validaSenha()" required><br>
                        </div>
            
        </div>
                
        <div class="row">
            
                        <label for="colFormLabelLg" class="form-label h4">* Selecione o tipo de usuário: </label>
                             <select name="grupo" id="grupo" class="form-control" required>
                                    <option value="Estoquista">Estoquista</option>
                                    <option value="Admin">Admin</option>
                             </select>
                       
        </div>
                 <br>
       <div class="row">
           <div class="col-sm">
                         <button type="submit" class="btn btn-dark form-control form-control-lg h4">Salvar</button>
           </div>
           
           <div class="col-sm">
                            <a href="../Admin_Estoquista/consulta-usuarios"><button type="button" class="btn btn-dark form-control form-control-lg h4">Cancelar</button></a>
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
                    alert("Confirmação de senha inválida!");
                    document.getElementById("confirmSenha").value = "";
                }
            }
            
        </script>
    </body>
</html>
