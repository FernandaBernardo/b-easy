<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>

<tags:header/>

<form id="usuariosForm" action="<c:url value="/cadastro"/>" method="POST">
	Nome: <input type="text" name="user.name">
	E-mail: <input type="text" name="user.email">
	Senha: <input type="password" name="user.password" id="senha">
	Idade: <input type="text" name="user.age">
	Faculdade/Colégio: <input type="text" name="user.college">
	Curso: <input type="text" name="user.course">
	Semestre: <input type="text" name="user.semester">
	<input type="submit" value="Login">
</form>

<tags:footer/>