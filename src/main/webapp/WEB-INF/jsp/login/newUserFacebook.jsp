<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>

<tags:header/>

<section class="highlight-section">
	<h2>Registrar</h2>
</section>

<section class="half-container">
	<img class="login-image" src="img/postit1.jpg">
</section><!--  

--><section class="half-container">
	<form class="login-form" id="usuariosForm" action="<c:url value="/cadastro-facebook"/>" method="POST">
		<input type="text" name="user.name" placeholder="Nome" value="${user.name}">
		<input type="text" name="user.email" placeholder="E-mail" value="${user.email}">
		<input type="hidden" name="user.facebookId" value="${user.facebookId}">
		<input type="hidden" name="user.pictureUrl" value="${user.pictureUrl}">
		<input type="text" name="user.age" placeholder="Idade" value="${user.age}">
		<input type="text" name="user.college" placeholder="Faculdade/Colégio" value="${user.college}">
		<input type="text" name="user.course" placeholder="Curso" value="${user.course}">
		<input type="text" name="user.semester" placeholder="Semestre" value="${user.semester}">
		
		<input type="submit" value="Registrar">
	</form>
</section>

<tags:footer/>