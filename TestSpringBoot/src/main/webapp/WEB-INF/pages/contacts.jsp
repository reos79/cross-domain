
<html>
<head>
	<link href="http://getbootstrap.com/2.3.2/assets/css/bootstrap.css" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
	<script>
		$(document).ready(function() {
			loadContacts();
		});
		
		function showContacts(response){
			$("#tableid tbody tr").remove();
        	$.each(response, function(i, contact) {
        		$("#tableid tbody").append(
    					$('<tr>').append($('<td>').text(contact.name),
    									$('<td>').text(contact.phoneNumber),
    									$('<td>').text(contact.address)
    									));
    		});
		}
	
		function loadContacts(){
			$.ajax({
		        type: "GET",
		        url: "http://localhost:8080/contact",
		        success: function( response ){
		        	showContacts(response);
		        }
			});	
		}
		
		function addContact(){
			$.ajax({
		        type: "POST",
		        url: "/reos-web/reos/services/contacts",
		        data: {name: $('#name').val(), phone: $('#phone').val(), address: $('#address').val()}, 
		        success: function( response ){
		        	showContacts(response)
		        },
		        error: function( response ){
		        	alert(response);
		        }
			});
		}
	</script>

</head>

<body>

<form class="form-signin">
  <h2 class="form-signin-heading">Nuevo Contacto</h2>
  <input type="text" class="input-block-level" placeholder="Nombre" id="name">
  <input type="text" class="input-block-level" placeholder="Tel�fono" id="phone">
  <input type="text" class="input-block-level" placeholder="Direcci�n" id="address">
  <input type="button" class="btn btn-large btn-primary" onclick="addContact()" value="Crear">
</form>

<table id="tableid">
	<thead>
		<tr>
			<th>Nombre</th>
			<th>Tel�fono</th>
			<th>Direcci�n</th>
		</tr>
	</thead>
	<tbody>
		
	</tbody>
</table>
</body>
</html>        