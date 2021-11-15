<%-- 
    Document   : validaImgPrincipal
    Created on : 25/09/2021, 13:14:22
    Author     : ygor.oliveira
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/DetalhesProduto.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <title>Validar imagem principal</title>
    </head>
    <body>
        
<br>
    <center></center>
    
    <body>
        
        <style>
            #grad {
                height: auto;
                background-color: rgba(95, 216, 229, 0.89); /* For browsers that do not support gradients */
                background-image: linear-gradient(to bottom right, #c0c0c0, transparent);
                border-radius: 30px;
            }
                
            #grad2 {
                height: auto;
                background-color: rgba(95, 216, 229, 0.89); /* For browsers that do not support gradients */
                border-radius: 30px;
            }
            
            .w-auto legend{
                display: flex;
                align-items: center;
                left: 50%;
                font-style: bold;
                font-family: "Segoe UI", "Arial";
                
            }
                #iconProd{
                    height: 80px;
                    padding-left: 1%;
            }
            
            .container{
                display: flex;
                align-items: center;
                }
                
             #imagem:hover{
                    transform: scale(2.5) rotate(-5deg);
                    background-color: rgba(255,255,255,0.8);
                    box-shadow: 0 0 5px #333;
                    transition: all 1.2s;
                    border-radius:30%;
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
        </style><!-- comment -->
                
        </style>
    <c:import url="../../Publico/menu-backoffice.jsp"/>

    <c:if test="${not empty produto}">
        
        <div class="container mt-5">
            <fieldset class="border p-3 fieldset mb-25 col py-3 px-md-5 border" id="grad">
                
                
               <legend  class="w-auto legend">
                            <div class="container">
                                <h2>${produto.nome}</h2>
                                <img src="../../img/adesivo_instrumento_cordas.png" alt="iconProd" name="iconProd" id="iconProd"/>
                            </div>
               </legend>
      
        
            </fieldset>
        
        </div>
                                
        <div class="container mt-5">
            <fieldset class="border p-3 fieldset mb-25 col py-3 px-md-5 border" id="grad2">
                
                <div class="row">
                    
                <legend  class="w-auto legend">
                            <div class="container">
                                <h2>Clique em uma das imagens para defini-la como principal</h2>
                            </div>
                </legend>
                </div>
                            
            <div class="row">
                    <div class="col-sm">
                     <legend  class="w-auto legend">
                    <a href="ProdutoServlet?idproduto=${produto.idProduto}">Ver imagens</a>
                     </legend>
                    </div>
           </div>
         </fieldset>
        </div>
    </c:if>
    </body>
</html>
