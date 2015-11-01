<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<tags:header/>
${loggedUser.name}

<a href="<c:url value="/nova-materia"/>">Nova Matéria</a>
<a href="<c:url value="/lista-materias"/>">Listar Matérias</a>

<ul>
	<c:forEach items="${subjects}" var="subject">
		<li>${subject.name}</li>
	</c:forEach>
</ul>
<tags:footer/>