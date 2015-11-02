<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>

<section class="half-container">
	<form class="login-form" id="usuariosForm" action="<c:url value="/cadastro-mais"/>" method="POST" enctype="multipart/form-data">
		<input type="text" name="user.name" placeholder="Nome" value="${user.name}">
		<input type="text" name="user.email" placeholder="E-mail" value="${user.email}">
		<input type="hidden" name="user.facebookId" value="${user.facebookId}">
		<input type="hidden" name="user.picture" value="${user.picture}">
		<input type="text" name="user.age" placeholder="Idade" value="${user.age}">
		<input type="text" name="user.college" placeholder="Faculdade/Colégio" value="${user.college}">
		<input type="text" name="user.course" placeholder="Curso" value="${user.course}">
		<input type="text" name="user.semester" placeholder="Semestre" value="${user.semester}">
		
		<input type="submit" value="Registrar">
	</form>
</section>
