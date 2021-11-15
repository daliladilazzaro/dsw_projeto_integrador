<%-- 
    Document   : Login
    Author     : Ygor Oliveira | Yasmim Candelária | Juan Dias | Filipe Vital
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="../css/login.css">
        <title>Login</title>
    </head>
    
    <style>
        body{
                background: url(../img/FundoWallpaper04.jpg);
                position: relative;
                height: 90vh;
                width: 100vw;
                /* adicionando imagem de fundo */
                background-size: cover;
} 
  
    </style>
    <body>
        <c:if test="${param.erroLogin}">
            <div class="alert alert-danger" role="alert">
               Dados de usuário incorretos!
            </div>
        </c:if>
        
        <c:if test="${param.usuarioInativo}">
            <div class="alert alert-danger" role="alert">
               Usuário inativo e sem acesso ao sistema.
            </div>
        </c:if>
        
        <%
                String userAgent = request.getHeader("user-agent");
        %>
        
    <center><form action="login?user_agent=<%= userAgent %>" method="POST" class="formulario" autocomplete="off">
        <div class="container mt-5">
            <fieldset class="border p-3 fieldset mb-25 col py-3 px-md-5 border" id="grad">
                        
                
                <img src="../img/giphyLogin03.gif" id="imgGif"/>
                <div class="row">

                                   <legend>Login: </legend>
                                   <input type="text" class="form-control" id="login" name="login" required><br>

                </div>

                <div class="row">

                               <legend>Senha: </legend>
                               <input type="password" class="form-control" id="senha" name="senha" required>

                </div>
                
                <br>
                <div class="row">
                <button type="submit" class="btn btn-dark form-control form-control-lg h4">Entrar</button>
                </div>
                <a href="cadastro-cliente.jsp">Caso não possua acesso, crie uma conta clicando aqui!</a>
                <br>
            </fieldset>
    </div>
</form>
    </center>
    
    <script>
        
        $(document).ready(function(){

            $("#imgGif").click(function(){
              if($(this).attr("src") === "../img/giphyLogin03.gif")
                $(this).attr("src","../img/giphy.gif");
       
            
              else
                $(this).attr("src","../img/giphyLogin03.gif");

  });
});  
    </script>
    </body>
</html>
