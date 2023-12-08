<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../includes/header.jsp"%>
<style>
#modifycontainer {
	margin: 0 auto; width : 80%;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-flow: column;
	width: 80%;
}

.modifyForm {
	width: 100%;
}

.tableContainer {
	display: flex;
}

table {
	width: 50%;
}

.borderLeftNone {
	border-right: none;
}

th, td {
	padding: 10px 20px;
}

.btnBox {
	display: flex;
	justify-content: flex-end;
	margin: 30px 0;
	width: 100%;
}

.btnBgc {
	background-color: #999;
	border: 1px solid #999;
	color: #fff;
	transition: 0.4s ease-in-out;
	border-radius: 10px;
	padding: 10px;
	width: 100px;
	margin-right: 10px
}

.btnBgc:hover {
	border: 1px solid #717fe0;
	background-color: #717fe0;
	color: #fff;
}

.pl {
	width: 100%;
	border: 1px solid #C4C4C4;
	box-sizing: border-box;
	border-radius: 10px;
	padding: 12px 13px;
	font-family: 'Roboto';
	font-style: normal;
	font-weight: 400;
	font-size: 14px;
	line-height: 16px;
}

.pl:focus {
	border: 1px solid #717fe0;
	box-sizing: border-box;
	border-radius: 10px;
	outline: 3px solid #F8E4FF;
	border-radius: 10px;
}

input[type=file]::file-selector-button {
	width: 150px;
	height: 30px;
	background: #fff;
	border: 1px solid #C4C4C4;
	border-radius: 10px;
	cursor: pointer;
	transition: 0.4s ease-in-out;
}

input[type=file]:hover::file-selector-button {
	background-color: #717fe0;
	border: 1px solid #717fe0;
	color: #fff;
}
</style>

<div id="modifycontainer">
	<h3 style="margin: 50px 0">Add Product</h3>
	<form modelAttribute="pVo" method="post" enctype="multipart/form-data"class="modifyForm" action="/admin/product/productRegister">
		<div class="tableContainer">
			<table border="1" class="borderLeftNone">
				<tbody>
					<tr>
						<td><img id="preview"></td>
					</tr>
				</tbody>
			</table>
			<table border="1" summary="">
				<tbody>
					<tr>
						<th scope="row">Product Name</th>
						<td><input type="text" id="product_name" name="product_name">
						</td>
					</tr>
					<tr>
						<th scope="row">Product Price</th>
						<td><input type="text" id="price" name="price"></td>
					</tr>
					<tr>
						<th scope="row">Category</th>
						<td><select name="category_id" class="pl">
								<option value="" selected disabled>Select Category</option>
								<option value="outer">Outer</option>
								<option value="top">Top</option>
								<option value="pants">Pants</option>
						</select></td>
					</tr>
					<tr>
						<th scope="row">Color</th>
						<td><select class="color_id pl" name="color_id">
								<option value="" selected disabled>Select Color</option>
								<option value="black">Black</option>
								<option value="green">Green</option>
								<option value="red">Red</option>
								<option value="white">White</option>
						</select></td>
					</tr>
					<tr>
						<th scope="row">Size</th>
						<td><select class="size_id pl" name="size_id">
								<option value="" selected disabled>Select Size</option>
								<option value="S">S</option>
								<option value="M">M</option>
								<option value="L">L</option>
						</select></td>
					</tr>
					<tr>
						<th scope="row">Product Quantity</th>
						<td><input type="text" id="Quantity" name="quantity">
						</td>
					</tr>
					<tr>
						<th scope="row">Product Image</th>
						<td>
						<input type="file" id="img" name="file" onchange="readURL(this);">						
						<input type="hidden" name="img" id="imgUrl">					

						</td>							
					</tr>
				</tbody>
			</table>
		</div>
		<div class="btnBox">
			<input class="btnBgc"type="submit" value="Submit" > 
			<input class="btnBgc" type="button" value="List" onclick="location.href='/admin/product/productList?category_id=0'">
			<input class="btnBgc" type="reset" value="Reset">
		</div>

	</form>
</div>
<script type="text/javascript">
function readURL(input) {
    var imgName = $(input).val();
    var category_id = $("select[name=category_id]").val();
    var img = $("#imgUrl");
    var newInputValue = category_id + "/" + imgName.match(/([^\\]+)$/)[0];
    img.val(newInputValue);

    console.log(img.val());

    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            document.getElementById('preview').src = e.target.result;
        };
        reader.readAsDataURL(input.files[0]);
    } else {
        document.getElementById('preview').src = "";
    }
}




</script>
<%@include file="../../includes/footer.jsp"%>