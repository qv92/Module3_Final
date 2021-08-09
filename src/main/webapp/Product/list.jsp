
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <title>Title</title>
</head>
<body>
<div class="container" align="center">
<form method="post">
    <a class="btn btn-primary" href="/products?action=create" style="float: left">Add new product</a>&nbsp;
    <div style="float: right">
        <input type="hidden" name="action" value="search">
        <input type="text" name="name">
        <button class="btn btn-info">Search</button></div>

    <br>
    <hr>
    <table class="table">
        <tr>
            <td colspan="7">Product list</td>
        </tr>

        <tr>
            <td>#</td>
            <td>Product Name</td>
            <td>Price</td>
            <td>Quantity</td>
            <td>Color</td>
            <td>Category</td>
            <td>Action</td>
        </tr>
        <c:forEach items="${products}" var="product">
            <tr>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.price}</td>
                <td>${product.quantity}</td>
                <td>${product.color}</td>
                <td><c:forEach items="${categories}" var="category">
                    <c:if test="${product.categoryId == category.id}">
                        ${category.name}
                    </c:if>
                </c:forEach> </td>
                <td><a class="btn btn-info" href="/products?action=edit&id=${product.id}">Edit</a>|<a class="btn btn-danger" href="/products?action=delete&id=${product.id}">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</form>
    <a href="/products" class="btn btn-primary">Back</a>
</div>


</body>
</html>