<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="css/login.css">
<link rel="stylesheet" href="css/form.css">
<link rel="stylesheet" href="css/section.css">
<link href="//fonts.googleapis.com/css?family=Lato:100,300,100italic,300italic,700italic,700" rel="stylesheet" type="text/css">
<title>B-easy</title>
</head>
<body>

<header>
	<h1 class="logo" ><a href="<c:url value="/" />" /><img src="img/logo.png" width="80px" height="70px"></a></h1><!--  
	
	--><nav class="menu">
		<ul>
			<c:if test="${not empty loggedUser.user}">
				<li>${loggedUser.getName()}</li>
			</c:if>
			<li><a href="<c:url value="/" />">Sobre</a></li>
			<li><a href="<c:url value="/" />">Contato</a></li>
			<c:choose>
				<c:when test="${empty loggedUser.user}">
					<li><a href="<c:url value="/login" />">Entrar</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="<c:url value="/logout" />">Sair</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</nav>
</header>
