<%-- 
    Document   : testeImagens
    Created on : 02/11/2021, 12:50:06
    Author     : ygor.oliveira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        
        <input id="file-input" type="file" multiple="multiple" onclick="clearBox('preview')">
        <div id="preview">
            <p>Marque a imagem principal: </p>
            
        </div>
    <script>
        
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
                preview.appendChild(input);
              });

              reader.readAsDataURL(file);

            }

          }
          
          console.log(lista);

          document.querySelector('#file-input').addEventListener("change", previewImages);
        
        
    </script>
    </body>
</html>
