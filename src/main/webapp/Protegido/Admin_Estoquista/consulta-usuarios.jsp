<%-- 
    Document   : ConsultaProduto
    Created on : 12/09/2021, 09:40:39
    Author     : ygor.oliveira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">       
        <title>Consultar Usuários</title>
        <link href="//cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css" rel="stylesheet">
        
    </head>
    <body>
       <c:import url="../../Publico/menu-backoffice.jsp"/>
       
       <c:if test="${param.erroInativacao}">
            <div class="alert alert-danger" role="alert">
               Por questões de segurança você não pode inativar seu próprio acesso.
            </div>
        </c:if>
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
        
        <center>
               <fieldset class="border p-3 fieldset mb-25 col py-3 px-md-5 border" id="grad">
                    <legend  class="w-auto legend">
                            <div class="container">
                                <h3>Cadastrar novos usuários</h3>
                                <a href="../Admin/cadastro-usuarios.jsp"><img src="../../img/Alarm-Plus-icon.png" alt="Cadastrar usuários"/></a>
                                </div>
                     </legend>
                
                
 <table class="table table-hover" id="tabelaProd">
            <thead>
                <th>Nome</th>
                <th>E-mail (login)</th>
                <th>Status</th>
                <th>Grupo</th>
                <th>Alterar</th>
                <th>Mudar status</th>
            </thead>
            <tbody> 
                <c:forEach var="usuario" items="${listaUsuarios}">
                    <tr>
                        <td>${usuario.nome}</td>
                        <td>${usuario.email}</td>
                        <td>${usuario.status}</td>
                        <td>${usuario.grupo}</td>
                        <td><center><a href="../Admin_Estoquista/alterar-usuario?email=${usuario.email}"><img src="../../img/note-edit-icon.png" alt="Alterar"/></a></center></td>
                       <c:choose>
                            <c:when test="${usuario.status=='Ativo'}">
                            <td><center><a href="../Admin_Estoquista/inativar-usuario?emailLogado=${sessionScope.usuario.email}&email=${usuario.email}"><img src="../../img/Status-user-online-icon.png" alt="ativar/inativar"/></a></center></td>
                            </c:when>
                            <c:otherwise>
                                <td><center><a href="../Admin_Estoquista/inativar-usuario?emailLogado=${sessionScope.usuario.email}&email=${usuario.email}"><img src="../../img/Status-user-busy-icon.png" alt="ativar/inativar"/></a></center></td>
                            </c:otherwise>
                       </c:choose>
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
