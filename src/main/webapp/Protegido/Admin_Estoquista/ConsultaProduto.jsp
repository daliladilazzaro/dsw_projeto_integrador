<%-- 
    Document   : ConsultaProduto
    Created on : 12/09/2021, 09:40:39
    Author     : ygor.oliveira
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="//cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css" rel="stylesheet">
        <title>Consultar Produtos</title>
    </head>
    <body>
       <c:import url="../../Publico/menu-backoffice.jsp"/>
        <style>
            
            #grad {
                height: auto;
                background-color: rgba(95, 216, 229, 0.70); /* For browsers that do not support gradients */
                background-image: linear-gradient(to bottom right, #c0c0c0, transparent);
                border-radius: 30px;
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
                .container{
                display: flex;
                align-items: center;
                margin-top: 5%;
                }
                
                .w-auto legend{
                    display: flex;
                    align-items: center;
                    left: 50%;
                    font-style: bold;
                    font-family: "Segoe UI", "Arial";
                }
                
            
        </style>
        
         <c:if test="${param.erroInativacao}">
            <div class="alert alert-danger" role="alert">
               Entre em contato com algum administrador do sistema para inativar produtos.
            </div>
        </c:if>
        
        <center>
               <fieldset class="border p-3 fieldset mb-25 col py-3 px-md-5 border" id="grad">
                
                
                    <legend  class="w-auto legend">
                            <div class="container">
                                <h3>Adicionar novos produtos</h3>
                                <a href="CadastroProduto.jsp"><img src="../../img/Alarm-Plus-icon.png" alt="Adicionar produtos"/></a>
                             </div>
                     </legend>
            
    <table class="table table-hover" id="tabelaProd">
            <thead>
                <th>ID do produto</th>
                <th>Nome</th>
                <th>Avaliação</th>
                <th>Descrição</th>
                <th>Status</th>
                <th>Preço unitário</th>
                <th>Quantidade em estoque</th>
                <th>Alterar</th>
                <th>Mudar status</th>
                <th>Ver produto</th> 
            </thead>
            <tbody> 
                <c:forEach var="produto" items="${listaProdutos}">
                    <tr>
                        <td>${produto.idProduto}</td>
                        <td>${produto.nome}</td>
                        <td>${produto.avaliacao}</td>
                        <td>${produto.descricao}</td>
                        <td>${produto.status}</td>
                        <td>${produto.preco}</td>
                        <td>${produto.qtdEstoque}</td>
                        <td><center><a href="../Admin_Estoquista/alterar-produto?idproduto=${produto.idProduto}"><img src="../../img/note-edit-icon.png" alt="Alterar"/></a></center></td>
                       <c:choose>
                            <c:when test="${produto.status=='Ativo'}">
                            <td><center><a href="../Admin_Estoquista/inativar-produto?idproduto=${produto.idProduto}"><img src="../../img/Status-user-online-icon.png" alt="ativar/inativar"/></a></center></td>
                            </c:when>
                            <c:otherwise>
                                <td><center><a href="../Admin_Estoquista/inativar-produto?idproduto=${produto.idProduto}"><img src="../../img/Status-user-busy-icon.png" alt="ativar/inativar"/></a></center></td>
                            </c:otherwise>
                       </c:choose>
                               <td><center><a href="../Admin_Estoquista/DetalhesProdutoBackoffice?idproduto=${produto.idProduto}"><img src="../../img/view-icon.png" alt="Ver produto"/></a></center></td>
                        </tr>
                </c:forEach>
            </tbody>
        </table></fieldset></center>  
    
    <script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="//cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>

        <script>
        $(document).ready(function(){
                $('#tabelaProd').DataTable({
                          "language": {
                          "lengthMenu": "Mostrando _MENU_ registros por página",
                          "zeroRecords": "Nada encontrado",
                          "info": "Mostrando página _PAGE_ de _PAGES_",
                          "infoEmpty": "Nenhum registro disponível",
                          "infoFiltered": "(filtrado de _MAX_ registros no total)"
                      }
                  });
  });
  </script>
    </body>
</html>
