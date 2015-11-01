<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<tags:header/>
${loggedUser.name}

<a href="<c:url value="/nova-materia"/>">Nova Mat�ria</a>
<a href="<c:url value="/lista-materias"/>">Listar Mat�rias</a>

<form action="<c:url value='/nova-materia'/>" method="post">
	Nome:
	<input type="text" name="subject.name">
	Cor:
	<input type="color" name="subject.color">
	
	<input type="submit" value="Adicionar mat�ria">
</form>

<tags:footer/>