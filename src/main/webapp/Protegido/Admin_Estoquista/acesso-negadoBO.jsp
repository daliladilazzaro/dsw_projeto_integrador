<%-- 
    Document   : acesso-negado
    Created on : 11/10/2021, 13:34:22
    Author     : ygor.oliveira
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <title>Erro</title>
    </head>
    <body>
        
        <style>
            
            #imgGif{
                
             width: 20%;
             height: 20%;   
                
            }
            
            
        </style>
        
    <center>
        <div class="col-sm">
        <img src="../../img/giphy.gif" id="imgGif"/>
        
        <h1>Você não tem permissão para acessar essa página!</h1>
        <i><a href="../Admin_Estoquista/LogoutBackoffice">Fazer logout...</a></i>
         </div>
    </center>
    </body>
</html>
