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
<link href="//fonts.googleapis.com/css?family=Lato:100,300,100italic,300italic,700italic,700" rel="stylesheet" type="text/css">
<title>B-easy</title>
</head>
<body>

<header>
	<h1 class="logo" ><a href="<c:url value="/" />" /><img src="img/logo.png" width="80px" height="70px"></a></h1><!--  
	
	--><nav class="menu">
		<ul>
			<li><a href="<c:url value="/" />">Sobre</a></li>		
			<li><a href="<c:url value="/login" />">Login</a></li>
			<li><a href="<c:url value="/" />">Contato</a></li>
		</ul>
	</nav>
</header>