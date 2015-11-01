<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<tags:header/>
${loggedUser.name}

<a href="<c:url value="/nova-materia"/>">Nova Mat�ria</a>
<a href="<c:url value="/lista-materias"/>">Listar Mat�rias</a>

<ul>
	<c:forEach items="${subjects}" var="subject">
		<li>${subject.name}</li>
	</c:forEach>
</ul>
<tags:footer/>