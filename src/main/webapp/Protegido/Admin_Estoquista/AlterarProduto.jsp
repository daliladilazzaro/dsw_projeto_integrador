<%-- 
    Document   : CadastroProduto
    Created on : 12/09/2021, 09:39:50
    Author     : ygor.oliveira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="../../css/AlterarProduto.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
        <title>Alterar Produtos</title>
       
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
        
        <c:if test="${not empty produto}">
            
        <form  action="alterar-produto" method="POST" class="formulario" enctype="multipart/form-data" autocomplete="off">
        <div class="container mt-5">
            <fieldset class="border p-3 fieldset mb-25 col py-3 px-md-5 border" id="grad">
                
                        <legend class="w-auto legend">
                            <div class="container">
                                <h2>Alteração de Produtos</h2>
                                <img src="../../img/amplificador_icon.png" alt="Amplificador">
                            </div>
                        </legend>
            
        <div class="row">
                        <div class="col-sm">
                                 <label for="colFormLabelLg" class="form-label h4">* Nome do produto: </label>
                                 <input class="form-control form-control-lg" id="nome" type="text" value="${produto.nome}" name="nome" required><br>
                        </div>   
        </div>
                        
        <div class="row">
                <!--tamanho do input-->
                
                        <div class="col-sm">
                            <label for="colFormLabelLg" class="form-label h4">* ID do Produto: </label>
                            <input class="form-control form-control-lg" type="number" value="${produto.idProduto}" id="idProduto" name="idProduto" min="1" max="5" step="1" readOnly="true" required><br>

                        </div>
                           
                        <div class="col-sm">
                            <label for="colFormLabelLg" class="form-label h4">* Avaliação: </label>
                            <input class="form-control form-control-lg" type="number" value="${produto.avaliacao}" id="avaliacao" name="avaliacao" min="1" max="5" step="0.5" required><br>

                        </div>
                            
                            
                        <c:choose>
                
                <c:when test="${usuario.grupo=='Admin'}">
                  <div class="col-sm">
                        <label for="colFormLabelLg" class="form-label h4">* Status do produto: </label>
                             <select name="status" id="status" class="form-control" required>
                                    <option value="${produto.status}">${produto.status}</option>
                                    <option value="Inativo">Inativo</option>
                            </select>
                        </div>   
                </c:when>
                
                <c:otherwise>
                <div class="col-sm">
                        <label for="colFormLabelLg" class="form-label h4">* Status do produto: </label>
                             <select name="status" id="status" class="form-control" required>
                                    <option value="${produto.status}">${produto.status}</option>
                            </select>
                        </div>      
                </c:otherwise>
            </c:choose>          
                        
        </div>
                    
        <div class="row">
                        <label for="colFormLabelLg" class="form-label h4">* Descrição: </label>
                        <div class="col-sm">
                            <textarea class="form-control form-control-lg" id="descricao" cols="35" rows="5" name="descricao" required>${produto.descricao}</textarea><br>
                        </div>
        </div>
                        
                        
        <div class="row">
                        <div class="col-sm">
                            <label for="colFormLabelLg" class="form-label h4">* Preço unitário: </label>
                            <input class="form-control form-control-lg" type="text" value="${produto.preco}" id="preco" min="1" name="preco" placeholder="0.00" required><br>
                        </div>


                        <div class="col-sm">
                            <label ffor="colFormLabelLg" class="form-label h4">* Quantidade para estoque: </label>
                            <input class="form-control form-control-lg" type="number" value="${produto.qtdEstoque}" id="qtdEstoque"  min="0" name="qtdEstoque" required><br>
                        </div> 
        </div>
                
                    
            </fieldset>
    </div>
                        
        <div class="container mt-5">
        <fieldset class="border p-3 fieldset mb-25 col py-3 px-md-5 border" id="grad2">
                
                <legend  class="w-auto legend">
                            <div class="container">
                                <h2> Alterar imagens</h2>
                                <img src="../../img/amplificador_icon.png" alt="Amplificador">
                            </div>
                        </legend>
            
            <div class="containerIMG">
                
                    <div class="container">
                    
                   
                    <c:forEach var="imagem" items="${listaImagens}">
                      
                       <div class="col-md-3">
                       <img src="../../img/${imagem.nome}" alt="fotos produto" id="imagem" class="imagens">
                   
                       <br><br>
                    
                        <c:choose>
                            <c:when test="${imagem.padrao=='Complementar'}">
                             <a href="../Admin_Estoquista/AlterarPadrao?idImagem=${imagem.idImagem}" onClick="AtualizaPagina()"><img src="../../img/Status-user-busy-icon.png" alt="principal/complementar" class="bin"/></a>
                            </c:when>
                            <c:otherwise>
                              <a href="../Admin_Estoquista/AlterarPadrao?idImagem=${imagem.idImagem}" onClick="AtualizaPagina()"><img src="../../img/Status-user-online-icon.png" alt="principal/complementar" class="bin"/></a>
                            </c:otherwise>
                        </c:choose>
                             <img src="../../img/garbageIcon.png" alt="fotos produto" id="lixeira" onclick="confirmarExclusao(${imagem.idImagem})" class="bin">
                     </div>
                    </c:forEach>
                 </div>
                
                </div>
            
            <script>
                
                function confirmarExclusao(IdImagem) {
                console.log("Sucesso!" , IdImagem);
                $("#idImagem").html(IdImagem);
                $("#modal1").show();
            }
            
            function fecharModal(){
                $(".modal").hide();
            }
            
            function deletarImagem() {
                var idImagem = $("#idImagem").html();
                $("#modal1").hide();
                //Chamada AJAX para o servlet
                $.ajax({
                    method: "GET",
                    url: "excluir-imagem?idImagem="+idImagem
                })
                .done(function( msg ) {
                   location.reload();
                });
            }
                
                
             </script>
             
            <div class="modal" tabindex="-1" id="modal1">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title">Confirmar Exclusão</h5>
                  <button type="button" class="btn-close"
                          data-bs-dismiss="modal" aria-label="Close" onclick="fecharModal()"></button>
                </div>
                <div class="modal-body">
                    <p>Confirmar a exclusão da imagem <label id="idImagem"></label>?</p>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="fecharModal()">Cancelar</button>
                  <button type="button" class="btn btn-danger" onclick="deletarImagem()">Confirmar</button>
                </div>
              </div>
            </div>
          </div>
             <br>
             
             <legend  class="w-auto legend">
                            <div class="container">
                                <h2> Cadastrar novas imagens para o produto</h2>
                                <img src="../../img/violao_acustico_folk.png" alt="Amplificador">
                            </div>
                        </legend>
             
                <div class="row">
                        
                         <input type="file" name="file" multiple="multiple" id="file" accept="image/*"><br><br>
       
                </div>
                
                <div class="row">
                        <div class="col-sm">
                            <button type="submit" class="btn btn-dark form-control form-control-lg h4">Alterar</button>
                        </div>
            
                        <div class="col-sm">
                            <a href="../Admin_Estoquista/consulta-produtos"><button type="button" class="btn btn-dark form-control form-control-lg h4">Cancelar</button></a>
                        </div>
                </div>
            </fieldset>
        </div>
 </form>
                        
                        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
                        <script>
                            $(document).ready(function () {
                                $('input[name=avaliacao]').mask('0.0');
                            });
                            
                            function AtualizaPagina(){
                                
                                window.location.reload();
                                
                            }
                            
                        </script>

        </c:if>
    </body>
   
</html>
