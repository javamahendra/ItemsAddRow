<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"  crossorigin="anonymous"></script>
    <title>Hello, world!</title>
  </head>
  <body><br/><br/><br/><br/>
	<form:form action="/save" method="post" modelAtteribute="motherbean" align="center">

	<table align="center">
		<tr>
			<th>ID</th> <td><input type="text" name="id" value="${mother.id}" /></td> <th>Mother</th><td><input type="text" name="name" value="${mother.name}" /></td>
		</tr>
	</table>
	<table align="center" id="children_table" border="0" class="row-border dataTable payment_table" style="    margin-bottom: 9%;">
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
			</tr>
		</thead>
		<tbody id="children_table_body">
			<tr>
					<td id="slno" class="sl_no">1</td>
					<td><input type="text" name="children[0].id"  id="childrenid1" class="children_id1"/></td>
					<td><input type="text" name="children[0].name"  id="childrenname1" class="children_name1" /></td>
					<td><a href="#" onclick="deleteRow(1)" id="delete1" class="children_delete">delete</a></td>
				</tr>
		</tbody>
		<tfoot>
		<tr>
		
			<th><a href="#" onclick="addRow()">Add</a></th><th></th><th><a href="#" onclick="addRow()">Add</a></th>
				</tr>
			
		</tfoot>
	</table>
	<input type="submit" value="save data"/>
	</form:form>   

<script type="text/javascript">
	function replaceAt(a,index,replacement){
		return a.substr(0, index) + replacement+ a.substr(index + replacement.length);
	}
	function addRow(){
		var rowCount = $('#children_table_body tr').length;
		var tablen = rowCount;
		rowCount = rowCount+1;
		var table=document.getElementById("children_table");
		$('#children_table_body').append('<tr><td id="slno"  class="sl_no">'+rowCount+'</td><td><input type="text" id="childrenid'+rowCount+'" name="children['+(rowCount-1)+'].id" class="children_id'+rowCount+'"/></td><td><input type="text" name="children['+(rowCount-1)+'].name" id="childrenname'+rowCount+'" class="children_name'+rowCount+'"/></td><td><a href="#" onclick="deleteRow('+rowCount+')" id="delete'+rowCount+'" class="children_delete">delete</a></td>');
	}
	function deleteRow(no){
		var table=document.getElementById("children_table");
		var rowCount = $('#children_table_body tr').length;
		if(no >= rowCount){
			no=no-1;
		}
		table.deleteRow(no+1);
		
		$("#children_table_body tr").each(function(index) {
			 //$(this).attr('id',index+1);
			 $(this).find("#slno").html(index+1);
			 var rowno = (index+1).toString();
			 var rownoo = (index).toString();
			 $(this).find('input , select').each (function() {
					var inputname1 = $(this).attr('class');
					var inputid1 = $(this).attr('id');
					var inputname = $(this).attr('name');
					//var abcd = $(this).attr('onkeyup');
					//var change = $(this).attr('onchange');
					/* if(change != undefined){
						change = replaceAt(change,20,rowno);
				   	    $(this).attr('onchange',change);
					}
					if(abcd != undefined){
						abcd = replaceAt(abcd,13,rowno);
				   	    $(this).attr('onkeyup',abcd);
					} */
					if(inputname1 != undefined){
						if(rowno<10){
							inputname1 = inputname1.slice(0, -1);
			   	    		}else{
			   	    			inputname1 = inputname1.slice(0, -2);
			   	    		}
						inputname1 = inputname1+rowno;
						$(this).attr('class',inputname1);
					}
					if(inputid1 != undefined){
						if(rowno<10){
							inputid1 = inputid1.slice(0, -1);
			   	    		}else{
			   	    			inputid1 = inputid1.slice(0, -2);
			   	    		}
						inputid1 = inputid1+rowno;
						$(this).attr('id',inputid1);
					}
					if(inputname != undefined){
						if(inputname.indexOf("children[") >= 0) {
							if(rownoo == '9'){
								inputname = inputname.replace('10',' ');
							}
							//input fields name="abcd(" ex=6 inputname = replaceAt(inputname,6,rownoo);
							inputname = replaceAt(inputname,9,rownoo);
							$(this).attr('name',inputname);
							
						}
					}
				});
			 $(this).find('a').each (function() {
					var aname = $(this).attr('id');
					if(aname != undefined){
						if(rowno<10){
							aname = aname.slice(0, -1);
			   	    		}else{
			   	    			aname = aname.slice(0, -2);
			   	    		}
					aname = aname+rowno;
					$(this).attr('id',aname);
					}
					var det = $(this).attr('class');
					if(det != 'children_delete'){
					}else{
						var abcd = $(this).attr('onclick');
				   	    abcd = replaceAt(abcd,10,rowno);
				   	    $(this).attr('onclick',abcd);
					}
				});
		});
		
		
		
		
		
	}
	
</script>





    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" crossorigin="anonymous"></script>
  </body>
</html>