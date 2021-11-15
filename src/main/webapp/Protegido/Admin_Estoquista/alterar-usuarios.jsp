
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="../../css/cadastro-usuarios.css">
      
        <title>Alterar dados de usuário</title>
        
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
        <form  action="alterar-usuario" method="POST" class="formulario" autocomplete="off">
        <div class="container mt-5">
            <fieldset class="border p-3 fieldset mb-25 col py-3 px-md-5 border" id="grad">
                
                        <legend  class="w-auto legend">
                            <div class="container">
                                <h2>Alterar dados</h2>
                                <img src="../../img/person-icon.png" alt="person">
                            </div>
                        </legend>
                
                
        <c:if test="${not empty usuario}"> 
        <div class="row">
                <!--tamanho do input-->
                        <div class="col-sm">
                            <label for="colFormLabelLg" class="form-label h4">* Nome Completo: </label>
                            <input class="form-control form-control-lg" id="nome" type="text" name="nome" value="${usuario.nome}" required><br>
                        </div>
                
                        <div class="col-sm">
                            <label for="colFormLabelLg" class="form-label h4">* CPF: </label>
                            <input class="form-control form-control-lg" id="CPF" type="text" name="CPF" value="${usuario.CPF}" pattern="\d{3}\.\d{3}\.\d{3}-\d{2}" required><br>

                        </div>
        </div>
                        
        <div class="row">
                        <div class="col-sm">
                            <label for="colFormLabelLg" class="form-label h4">* E-mail: </label>
                            <input class="form-control form-control-lg" id="email" type="email" name="email" value="${usuario.email}" readOnly="true" required><br>
                        </div>
        </div>             
                        
        <div class="row">
                        <div class="col-sm">
                            <label for="colFormLabelLg" class="form-label h4">Nova Senha (opcional): </label>
                            <input class="form-control form-control-lg" id="senha" type="password" name="senha"><br>
                        </div>
            
                        
            
                        <div class="col-sm">
                            <label for="colFormLabelLg" class="form-label h4">Confirmação de senha: </label>
                            <input class="form-control form-control-lg" id="confirmSenha" type="password" name="confirmSenha" onChange="validaSenha()"><br>
                        </div>
            
        </div>
                
        <div class="row">
            
            <c:choose>
                
                <c:when test="${usuario.email == sessionScope.usuario.email}">
                  <div class="col-sm">            
                <label for="colFormLabelLg" class="form-label h4">* Selecione o tipo de usuário: </label>
                             <select name="grupo" id="grupo" class="form-control" required>
                                    <option value="${usuario.grupo}">${usuario.grupo}</option>
                             </select>
                  </div> 
                             
                <div class="col-sm"> 
                <label for="colFormLabelLg" class="form-label h4">* Selecione o status: </label>
                             <select name="status" id="status" class="form-control" required>
                                    <option value="${usuario.status}">${usuario.status}</option>
                             </select>
                </div>    
                </c:when>
                
                <c:otherwise>
                <div class="col-sm">    
                <label for="colFormLabelLg" class="form-label h4">* Selecione o tipo de usuário: </label>
                             <select name="grupo" id="grupo" class="form-control" required>
                                    <option value="${usuario.grupo}">${usuario.grupo}</option>
                                    <option value="Estoquista">Estoquista</option>
                                    <option value="Admin">Admin</option>
                             </select>  
                </div>
                                    
                <div class="col-sm">     
                    <label for="colFormLabelLg" class="form-label h4">* Selecione o status: </label>
                             <select name="status" id="status" class="form-control" readOnly="true" required>
                                    <option value="${usuario.status}">${usuario.status}</option>
                                    <option value="Ativo">Ativo</option>
                                    <option value="Inativo">Inativo</option>
                             </select>        
                 </div>                   
                                    
                </c:otherwise>
            </c:choose>    
        </div>
             
       <p><br></p>
       <div class="row">
           <div class="col-sm">
                         <button  onclick="validaSenha()" type="submit" class="btn btn-dark form-control form-control-lg h4">Alterar</button>
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
                    event.preventDefault();
                    alert("Confirmação de senha inválida!");
                    document.getElementById("confirmSenha").value = "";
                }
            }
            
        </script>
        
        </c:if>
    </body>
</html>
