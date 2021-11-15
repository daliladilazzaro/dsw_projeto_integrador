<%-- 
    Document   : DetalhesProduto
    Created on : 12/09/2021, 09:40:20
    Author     : ygor.oliveira
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="../css/DetalhesProduto.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <title>Visualizar Produtos</title>
    </head>
    <body onload="home()">

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
                background-image: linear-gradient(to bottom right, #c0c0c0, transparent);
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
            
            /*CSS Carousel*/
            .container{
                display: flex;
                align-items: center;
            }
            
            #items-wrapper{
                width: auto;
                height: auto;
                margin-right: 30px;
                background-color: white;
                border-radius: 30px;
            }

            #items{
                display: flex;
                overflow-x: auto;
                scroll-snap-type: x mandatory;
                scroll-behavior: smooth;
                margin-left: 20%;
                
            }

            .item{
                margin-top: 15%;
                flex: none;
                width: 100%;
                height: 200px;
                scroll-snap-align: start;
                pointer-events: none;
            }
            
                #items-wrapper:hover{
                transform: scale(2.0);
                background-color: rgba(255,255,255,1);
                box-shadow: 0 0 5px #333;
                transition: all 1.2s;
                border-radius:30%;
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
</style>
    <c:import url="menu-cliente.jsp"/>
        <c:if test="${not empty produto}">

            <div class="container mt-5">
                <fieldset class="border p-3 fieldset mb-25 col py-3 px-md-5 border" id="grad">

                    <legend  class="w-auto legend">
                        <div class="container">
                            <h2>${produto.nome}</h2>
                            <img src="../img/adesivo_instrumento_cordas.png" alt="iconProd" name="iconProd" id="iconProd"/>
                        </div>
                    </legend>

                </fieldset>

            </div>
                            
            <c:choose>
                    <c:when test="${sessionScope.usuario.grupo!=null}">
                        
                        <form  action="add-produto?id_produto=${produto.idProduto}&nome_cliente=${usuario.nome}&id_usuario=${usuario.idUsuario}" method="POST" class="formulario" autocomplete="off">
    
                        <div class="container mt-5">

                            <fieldset class="border p-3 fieldset mb-25 col py-3 px-md-5 border" id="grad2">

                                <div class="row">
                                <div class="col-sm">
                                <div id="items-wrapper">
                                <div id="items">


                                    <c:forEach var="imagem" items="${listaImagens}">
                                        <div class="item"><img src="../img/${imagem.nome}" alt="fotos produto" id="imagem" class="imagens"></div>
                                    </c:forEach>

                                </div>
                            </div>
                        </div>

                                <div class="col-sm">
                                <h3>Descrição do Produto</h3>
                                <p>${produto.descricao}</p>
                                <div id="avaliacao">
                                            <img id="star1" src="../utilitarios/estrelaVazia.png">
                                            <img id="star2" src="../utilitarios/estrelaVazia.png">
                                            <img id="star3" src="../utilitarios/estrelaVazia.png">
                                            <img id="star4" src="../utilitarios/estrelaVazia.png">
                                            <img id="star5" src="../utilitarios/estrelaVazia.png">
                                </div>
                                <br>
                                    <center><h3>R$${produto.preco}</h3></center>
                                    <button type="submit" class="btn btn-dark form-control form-control-lg h4">Adicionar ao carrinho</button>

                                </div>
                                </div>
                                <br>
                            </fieldset>

                        </div>
                        </form>
                     </c:when>
                    <c:otherwise>
                        <%
                        String userAgent = request.getHeader("user-agent");
                        %>
                        <form  action="add-produto-deslogado?id_produto=${produto.idProduto}&nome_cliente=<%= userAgent %>" method="POST" class="formulario" autocomplete="off">
                        <div class="container mt-5">

                            <fieldset class="border p-3 fieldset mb-25 col py-3 px-md-5 border" id="grad2">

                                <div class="row">
                                <div class="col-sm">
                                <div id="items-wrapper">
                                <div id="items">


                                    <c:forEach var="imagem" items="${listaImagens}">
                                        <div class="item"><img src="../img/${imagem.nome}" alt="fotos produto" id="imagem" class="imagens"></div>
                                    </c:forEach>

                                </div>
                            </div>
                        </div>

                                <div class="col-sm">
                                <h3>Descrição do Produto</h3>
                                <p>${produto.descricao}</p>
                                <div id="avaliacao">
                                            <img id="star1" src="../utilitarios/estrelaVazia.png">
                                            <img id="star2" src="../utilitarios/estrelaVazia.png">
                                            <img id="star3" src="../utilitarios/estrelaVazia.png">
                                            <img id="star4" src="../utilitarios/estrelaVazia.png">
                                            <img id="star5" src="../utilitarios/estrelaVazia.png">
                                </div>
                                <br>
                                    <center><h3>R$${produto.preco}</h3></center>
                                    <button type="submit" class="btn btn-dark form-control form-control-lg h4">Adicionar ao carrinho</button>

                                </div>
                                </div>
                                <br>
                            </fieldset>

                        </div>  
                        </form>
                    </c:otherwise>
            </c:choose>
                            
        </c:if>
        <script>
            <!-- Função que é executada quando a página é carregada, que chama a função responsável pela exibição das estrelas de avaliação -->
            function home() {
                avaliacao(${produto.avaliacao});
            }
            
            function avaliacao(nota) {

                let opcao = Math.trunc(nota)

                switch(opcao) {

                    case 1:

                        if (nota > 1 && nota < 2) {
                            document.getElementById('star1').src = "../utilitarios/estrela.png"
                            document.getElementById('star2').src = "../utilitarios/meiaEstrela.png"
                        } else {
                            document.getElementById('star1').src = "../utilitarios/estrela.png"
                        }
                        
                    break;

                    case 2:

                        if (nota > 2 && nota < 3) {
                            document.getElementById('star1').src = "../utilitarios/estrela.png"
                            document.getElementById('star2').src = "../utilitarios/estrela.png"
                            document.getElementById('star3').src = "../utilitarios/meiaEstrela.png"
                        } else {
                            document.getElementById('star1').src = "../utilitarios/estrela.png"
                            document.getElementById('star2').src = "../utilitarios/estrela.png"
                        }
                        
                    break;

                    case 3:

                        if (nota > 3 && nota < 4) {
                            document.getElementById('star1').src = "../utilitarios/estrela.png"
                            document.getElementById('star2').src = "../utilitarios/estrela.png"
                            document.getElementById('star3').src = "../utilitarios/estrela.png"
                            document.getElementById('star4').src = "../utilitarios/meiaEstrela.png"
                        } else {
                            document.getElementById('star1').src = "../utilitarios/estrela.png"
                            document.getElementById('star2').src = "../utilitarios/estrela.png"
                            document.getElementById('star3').src = "../utilitarios/estrela.png"
                        }
                        
                    break;

                    case 4:

                        if (nota > 4 && nota < 5) {
                            document.getElementById('star1').src = "../utilitarios/estrela.png"
                            document.getElementById('star2').src = "../utilitarios/estrela.png"
                            document.getElementById('star3').src = "../utilitarios/estrela.png"
                            document.getElementById('star4').src = "../utilitarios/estrela.png"
                            document.getElementById('star5').src = "../utilitarios/meiaEstrela.png"
                        } else {
                            document.getElementById('star1').src = "../utilitarios/estrela.png"
                            document.getElementById('star2').src = "../utilitarios/estrela.png"
                            document.getElementById('star3').src = "../utilitarios/estrela.png"
                            document.getElementById('star4').src = "../utilitarios/estrela.png"

                        }
                        
                    break;

                    case 5:
                        document.getElementById('star1').src = "../utilitarios/estrela.png"
                        document.getElementById('star2').src = "../utilitarios/estrela.png"
                        document.getElementById('star3').src = "../utilitarios/estrela.png"
                        document.getElementById('star4').src = "../utilitarios/estrela.png"
                        document.getElementById('star5').src = "../utilitarios/estrela.png"
                    break;

                    default:
                        console.log('Avaliação inválida.')

                }

            }
            
            <!-- Função para alterar a imagem com o scroll do mouse-->
            document.querySelector("#items").addEventListener("wheel", event => {
              if(event.deltaY > 0) {
                  event.target.scrollBy(300, 0)
              } else {
                  event.target.scrollBy(-300, 0)
              }
            })

        </script>
    </body>
</html>
