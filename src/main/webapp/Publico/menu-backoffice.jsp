

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
                
            <link rel="stylesheet" type="text/css" href="../../css/menu-bko.css">
            <title>Menu de navegação</title>
    </head>
    <body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="../Admin_Estoquista/index-backoffice.jsp"><img src="../../img/LogoLoja03.png" id="logo"/></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="../Admin_Estoquista/index-backoffice.jsp">Página inicial<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
           <img src="../../img/person-icon.png" id="logo"> 
            Meu perfil
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        
                        <a class="dropdown-item" href="../Admin_Estoquista/alterar-usuario?email=${usuario.email}"><img src="../../img/person-icon.png" id="logo"/> Editar meus dados</a>
                        <a class="dropdown-item" href="../Admin_Estoquista/LogoutBackoffice"><img src="../../img/log-out.png" id="logo"/> Fazer logout</a>
                   
          <div class="dropdown-divider"></div>
        </div>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown02" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <img src="../../img/Guitar-icon.png" id="logo"/>
            Produtos
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown02">
                        
                        <a class="dropdown-item" href="../Admin_Estoquista/CadastroProduto.jsp"><img src="../../img/Guitar-icon.png" id="logo"/> Cadastrar produtos</a>
                        <a class="dropdown-item" href="../Admin_Estoquista/consulta-produtos"><img src="../../img/search-icon.png" id="logo"/> Consultar produtos</a>
                   
          <div class="dropdown-divider"></div>
        </div>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown03" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <img src="../../img/user-icon.png" id="logo"/>
          Usuários
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown03">
                        
                        <a class="dropdown-item" href="../Admin/cadastro-usuarios.jsp"><img src="../../img/user-icon.png" id="logo"/> Cadastrar usuários</a>
                        <a class="dropdown-item" href="../Admin_Estoquista/consulta-usuarios"><img src="../../img/search-icon.png" id="logo"/> Consultar usuários</a>
                   
          <div class="dropdown-divider"></div>
        </div>
      </li>
    </ul>
  </div>
</nav>
        
 </body>
</html>