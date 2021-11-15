
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="../css/index.css">
        <title>Home</title>
    </head>
      
    <body>
        
<style>
         
        /*
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
*/
/* 
    Created on : 09/10/2021, 14:03:11
    Author     : ygor.oliveira
*/
 #grad2 {
                height: auto;
                background-color: rgba(95, 216, 229, 0.89); /* For browsers that do not support gradients */
                background-image: linear-gradient(to bottom right, #c0c0c0, transparent);
                border-radius: 30px;
}
            
.card-deck{
                
                padding-top: 20px;
                box-shadow: 3px 12px 2px 1px rgba(0, 0, 0, .2);
                min-width: 250px;
                
}
            
.card-deck:hover{
                transform: scale(1.2);
                box-shadow: 0 0 15px #333;
                transition: all 0.6s;
                box-shadow: 3px 12px 2px 1px rgba(0, 0, 0, .8);
}
            
h5, h3{
                
                color: black;
                text-decoration: none;
                max-width: 100ch;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
}
            
.card-title{
                
                font-style: bold;
                font-family: sans-serif;
                color: black;
                
}
            
.card-img-top{
                 padding-top: 10%;
                 max-width: 300px;
                 max-height: 250px;
                 width: 100%;
                 height: 100%;
                 border-radius: 30px;
                 object-fit: cover;
                 
}
            
.card{
                min-height: 450px;
                min-width: 250px;
                box-shadow: 0 0 0.25em rgb(1, 43, 43); 
                display: flex;
                flex-direction: column;
                
}
            
.card-footer{
                
                background-color: #ff4d94;
                color: #fff;
}
            
            
body{
                background-position:center;
                background: url(../img/FundoWallpaper04.jpg);
                position: relative;
                height: 100vh;
                width: 100vw;
                /* adicionando imagem de fundo */
                background-size: cover;
}

.midle-card{
    
    position: absolute;
    top: 70%; bottom: 0;
    left: 0; right: 0;
    margin: auto;
    
}
       
</style>
        
        <c:import url="menu-cliente.jsp"/>
        
        <div class="container">
        <br>
            
         <div class="container mt-4">
                <div class="card-group">
        <div class="row">

            <c:forEach var="card" items="${listaCards}">
            <div class="col-md-4">
                <div class="card-deck">
                    <div class="card">
                        <center><div class="card-footer">
                            OFERTAS IMPERDÍVEIS!
                            </div></center>
                            <a class="link" href="../Publico/detalhes-produto?idproduto=${card.idProduto}">
                            <center><img class="card-img-top" src="../img/${card.nomeImagem}"></center>
                            <div class="midle-card">
                                <center><h5 class="card-title">${card.nomeProd}</h5>
                                <br>
                               
                                    <h5>Avaliação: ${card.avaliacao}</h5>
                                    
                                    <h3>R$${card.preco}</h3></center>
                            </div>
                        </a>
                    </div>
                </div>
            </div>                    
            </c:forEach>
        </div>
        </div>
    </div>
  </div>           
    </body>
</html>
