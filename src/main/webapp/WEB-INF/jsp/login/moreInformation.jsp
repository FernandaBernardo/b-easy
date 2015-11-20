<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>Beasy</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">

<!-- Fonts -->
<!--<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">-->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link href="css/animate.css" rel="stylesheet" />
<!-- Squad theme CSS -->
<link href="css/style.css" rel="stylesheet">
<link href="color/default.css" rel="stylesheet">

</head>

<body>
	<nav id="menu" class="navbar navbar-custom navbar-fixed-top" style="background-color: #0E63AA; height: 70px;">
		<div class="navhead container beasy-blue">
			<a class="navbar-brand" href="<c:url value='/' />" style="width: 100%; left: 100%; padding: 0;"> 
				<img src="img/logo_branco_topbar.png"></img>
			</a>
		</div>
	</nav>

	<!-- Section: cadastro -->
	<section id="cadastro" class="home-section  text-center">
		<div class="heading-contact">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-lg-offset-2">
						<div class="wow bounceInDown" data-wow-delay="0.4s">
							<div class="section-heading">
								<h2>Falta pouco...</h2>
								<p>Só falta mais algumas informações e você poderá desfrutar
									de BEasy!</p>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-2 col-lg-offset-5">
					<hr class="marginbot-50">
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6 col-lg-offset-3">
					<div class="boxed-grey">
						<form id="cadastro-form" action="<c:url value="/cadastro-mais"/>" method="POST" enctype="multipart/form-data">
<%-- 							<input type="text" name="user.age" placeholder="Idade" value="${user.age}"> --%>
<%-- 							<input type="text" name="user.college" placeholder="Faculdade/Colégio" value="${user.college}"> --%>
							<input type="hidden" name="user.facebookId" value="${user.facebookId}">
							<input type="hidden" name="user.picture" value="${user.pictureUrl}">
							<input type="hidden" name="user.password" value="${user.password}">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="adicional-email">Nome</label>
										<input type="text" class="form-control" placeholder="ex: João Silva" name="user.name" value="${user.name}" required="required" > 
									</div>
									<div class="form-group">
										<label for="adicional-email">Email</label>
										<div class="input-group">
											<span class="input-group-addon">
												<span class="glyphicon glyphicon-envelope"></span> 
											</span>
											<input type="email" class="form-control" id="adicional-email" name="user.email" placeholder="joao@exemplo.com" value="${user.email}" required="required"> 
										</div>
									</div>
									<div class="row">
										<div class="col-md-9">
											<div class="form-group">
												<label for="adicional-curso">Curso</label>
												<input type="text" class="form-control" id="adicional-curso" name="user.course" placeholder="ex: Sistemas de Informação" value="${user.course}" required="required"> 
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label for="name">Semestre</label>
												<input type="text" name="user.semester" class="form-control" id="adicional-semestre" placeholder="ex: 3" value="${user.semester == 0 ? '' : user.semester}" > 
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-12">
									<input type="submit" class="btn btn-skin pull-right" id="btnCadastro" value="Completar perfil">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- /Section: cadastro -->

	<footer style="padding-top: 13px; height: 35px;">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-lg-12">
					<p>&copy;Copyright 2015 - BEasy. Todos os direitos reservados.</p>
				</div>
			</div>
		</div>
	</footer>

	<!-- Core JavaScript Files -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
