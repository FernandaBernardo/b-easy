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
	<form class="login-form" id="usuariosForm" action="<c:url value="/cadastro"/>" method="POST">
		<input type="text" name="user.name" placeholder="Nome">
		<input type="text" name="user.email" placeholder="E-mail">
		<input type="password" name="user.password" placeholder="Senha">
		<input type="text" name="user.age" placeholder="Idade">
		<input type="text" name="user.college" placeholder="Faculdade/Colégio">
		<input type="text" name="user.course" placeholder="Curso">
		<input type="text" name="user.semester" placeholder="Semestre">
		
		<input type="submit" value="Registrar">
	</form>
</section>

<tags:footer/>