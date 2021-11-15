
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="../../css/CadastroProduto.css">
      
        <title>Cadastrar Produtos</title>
        
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

                #preview > img{

                    border-radius: 10px;
                    margin-left: 5%;
                    margin-top: 5%;
                    max-width: 200px;
                    max-height:150px;
                }
                
                

        </style><!-- comment -->
       <c:import url="../../Publico/menu-backoffice.jsp"/>
        
        <form  action="ProdutoServlet" method="POST" class="formulario" autocomplete="off" enctype="multipart/form-data">
        <div class="container mt-5">
            <fieldset class="border p-3 fieldset mb-25 col py-3 px-md-5 border" id="grad">
                
                        <legend  class="w-auto legend">
                            <div class="container">
                                <h2> Cadastro de Produtos</h2>
                                <img src="../../img/amplificador_icon.png" alt="Amplificador">
                            </div>
                        </legend>
            
        <div class="row">
                <!--tamanho do input-->
                        <div class="col-sm">
                            <label for="colFormLabelLg" class="form-label h4">* Nome do produto: </label>
                            <input class="form-control form-control-lg" id="nome" type="text" name="nome" required><br>
                        </div>
                
                        <div class="col-sm">
                            <label for="colFormLabelLg" class="form-label h4">* Avaliação: </label>
                            <input class="form-control form-control-lg" type="number" id="avaliacao" name="avaliacao" min="0.5" max="5" step="0.5" required><br>

                        </div>
        </div>
                        
        <div class="row">
                        <label for="colFormLabelLg" class="form-label h4">* Descrição: </label>
                        <div class="col-sm">
                            <textarea class="form-control form-control-lg" id="descricao" cols="35" rows="5" name="descricao" required></textarea><br>
                        </div>
        </div>
                        
                        
        <div class="row">
                        <div class="col-sm">
                            <label for="colFormLabelLg" class="form-label h4">* Preço unitário: </label>
                            <input class="form-control form-control-lg" type="text" id="preco" min="1" name="preco" placeholder="0.00" required><br>
                        </div>


                        <div class="col-sm">
                            <label ffor="colFormLabelLg" class="form-label h4">* Quantidade para estoque: </label>
                            <input class="form-control form-control-lg" type="number" id="qtdEstoque"  min="0" name="qtdEstoque" required><br>
                        </div> 
        </div>
                
            </fieldset>
    </div>
            
        <div class="container mt-5">
                <fieldset class="border p-3 fieldset mb-25 col py-3 px-md-5 border" id="grad2">
                
                <legend  class="w-auto legend">
                            <div class="container">
                                <h2> Seleção de imagens</h2>
                                <img src="../../img/amplificador_icon.png" alt="Amplificador">
                            </div>
                        </legend>
                    <div class="row">
                        
                         <input type="file" name="file" multiple="multiple" id="file" accept="image/*" onclick="clearBox('preview')" required><br><br>
                         <p>Marque a imagem principal: </p>
                         <div id="preview">
                            
            
                         </div>
                    </div>
                         
		 <div class="row">
                       
                 <div class="col-sm">
                     <br>
                            <button type="submit" class="btn btn-dark form-control form-control-lg h4">Incluir</button>
                 </div>
                
                 <div class="col-sm">
                     <br>
                            <a href="../Admin_Estoquista/consulta-produtos"><button type="button" class="btn btn-dark form-control form-control-lg h4">Cancelar</button></a>
                 </div>
                </div>
            </fieldset>
            
        </div>
    </form>
       
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
        <script>
            $(document).ready(function () {
                $('input[name=avaliacao]').mask('0.0');
            });
            
            
             function clearBox(elementID){
                document.getElementById(elementID).innerHTML = "";
            }
        
        let lista = [];
        function previewImages() {

            var preview = document.querySelector('#preview');
  
            if (this.files) {
              [].forEach.call(this.files, readAndPreview);
            }

            function readAndPreview(file) {
                
                

              // Make sure `file.name` matches our extensions criteria
              if (!/\.(jpe?g|png|gif)$/i.test(file.name)) {
                return alert(file.name + " is not an image");
              } // else...

              var reader = new FileReader();
              ;

              reader.addEventListener("load", function() {
                var image = new Image();
                image.height = 100;
                image.title  = file.name;
                image.src    = this.result;
                preview.appendChild(image);
                lista.push(file.name);
                var input = document.createElement("input");
                input.type = "radio";
                input.name = "imagens";
                input.className = "form-check-input"; // set the CSS class
                input.id = file.name;
                input.value = file.name;
                input.required = true;
                preview.appendChild(input);
              });

              reader.readAsDataURL(file);

            }

          }
          
          console.log(lista);

          document.querySelector('#file').addEventListener("change", previewImages);
            
        </script>
    </body>
</html>
