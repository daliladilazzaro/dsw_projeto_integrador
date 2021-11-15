

<%@page import="Model.Usuario"%>
<%@page import="Model.Carrinho"%>
<%@page import="DAO.CarrinhoDAO"%>
<%@page import="java.util.List"%>
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
                
            <link rel="stylesheet" type="text/css" href="../css/menu-cliente.css">
            <title>Menu de navegação</title>
    </head>
    <body>
        
        <style>
            
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
                min-width: 300px;
                box-shadow: 0 0 0.25em rgb(1, 43, 43); 
                display: flex;
                flex-direction: column;
                
}
            
.card-footer{
                
               background-color: #ff4d94;
                color: #fff;
}

.midle-card{
    
    position: absolute;
    top: 70%; bottom: 0;
    left: 0; right: 0;
    margin: auto;  
    
}

#qtdCarrinho{
    
    margin-top: 7px;
    
    
}
        
        </style>
            

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="../Publico/landing-page"><img src="../img/LogoLoja03.png" id="logo"/></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="../Publico/landing-page">Página inicial<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <img src="../img/person-icon.png" id="logo"> 
            Meu perfil
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            
            <c:choose>
                    <c:when test="${sessionScope.usuario.grupo!=null}">
                        
                        <a class="dropdown-item" href="../Protegido/Cliente/alterar-cliente?id_usuario=${sessionScope.usuario.idUsuario}"><img src="../img/user-icon.png" id="logo"/> Editar meus dados</a>
                        <a class="dropdown-item" href="../Protegido/Cliente/acompanhar-pedido?id_usuario=${sessionScope.usuario.idUsuario}"><img src="../img/box-icon.png" id="logo"/>Meus pedidos</a>
                        <a class="dropdown-item" href="../Publico/LogoutCliente"><img src="../img/log-out.png" id="logo"/> Fazer logout</a>
                     </c:when>
                    <c:otherwise>
                        
                        <a class="dropdown-item" href="../Publico/login"><img src="../img/log-in.png" id="logo"/> Fazer Login</a>
                        <a class="dropdown-item" href="../Publico/cadastro-cliente.jsp"><img src="../img/person-icon.png" id="logo"/> Realizar meu cadastro</a>
                    
                    </c:otherwise>
            </c:choose>     
                        
          <div class="dropdown-divider"></div>
        </div>
      </li>
      
      <%
          int countCarrinho = 0;
      %>
      
      <c:choose>
                    <c:when test="${sessionScope.usuario.grupo!=null}">
                      <li class="nav-item">
                            <a class="nav-link" href="add-produto?id_usuario=${sessionScope.usuario.idUsuario}"><img src="../img/shopping-cart-icon.png" id="logo"/>Carrinho de compras</a>
                      </li>
                      
                      <%
                           HttpServletRequest httpServletRequest = (HttpServletRequest) request;
                           HttpServletResponse httpServletResponse = (HttpServletResponse) response;
                           Usuario usuario = (Usuario) httpServletRequest.getSession().getAttribute("usuario");
                           List<Carrinho> listaCarrinho = CarrinhoDAO.listaCarrinhoLogado(usuario.getIdUsuario());
                            
                            for(Carrinho c:listaCarrinho){
                                
                                    countCarrinho+=c.getQtdDesejada();
                            }

                       %>
                     </c:when>
                    <c:otherwise>
                        <%
                        String userAgent = request.getHeader("user-agent");
                        List<Carrinho> listaCarrinho02 = CarrinhoDAO.listaCarrinhoDeslogado(userAgent);
                            
                            for(Carrinho c:listaCarrinho02){
                                    countCarrinho+=c.getQtdDesejada();
                            }
                        %>
                      <li class="nav-item">
                            <a class="nav-link" href="add-produto-deslogado?nome_cliente=<%= userAgent %>"><img src="../img/shopping-cart-icon.png" id="logo"/>Carrinho de compras</a>
                      </li>
                    </c:otherwise>
            </c:choose>
       
      <li class="nav-item" id="qtdCarrinho">
          <h3 style='color: white;'><%= countCarrinho %></h3>
      </li>
      
    </ul>
    <form class="form-inline my-2 my-lg-0" action="../Publico/pesquisa-produtos" method="GET">
      <input class="form-control mr-sm-2" type="search" placeholder="Pesquisar produtos..." aria-label="Search" id="nome_produto" name="nome_produto">
      <button class="btn btn-outline-info my-2 my-sm-0" type="submit">Pesquisar</button>
    </form>
  </div>
</nav>
        
 </body>
</html>