<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>B-easy</title>
	
	<!-- Bootstrap Core CSS -->
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
	
	<!-- Fonts -->
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<link href="css/animate.css" rel="stylesheet" />
	<!-- Squad theme CSS -->
	<link href="css/style.css" rel="stylesheet">
	<link href="color/default.css" rel="stylesheet">

</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-custom">
	<!-- Preloader -->
	<div id="preloader">
		<div id="load"></div>
	</div>

	<nav id="menu" class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
					<i class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand" href="#intro"> 
					<img src="img/logo_branco_topbar.png"></img>
				</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse navbar-right navbar-main-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#intro">Home</a></li>
					<li><a href="#service">Sobre</a></li>
					<li><a href="#app">App</a></li>
					<li><a href="#cadastro">Cadastre-se</a></li>
					<li><a href="#about">Equipe</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<!-- Section: intro -->
	<section id="intro" class="intro">
		<div class="slogan">
			<div class="row">
				<div class="col-lg-6  col-lg-offset-1">
					<img src="img/logo_branco.png" class="img-responsive"></img>
					<h4>Organize seus estudos sem estresse, sem pânico.</h4>
				</div>

				<tags:login />
			</div>
		</div>
		<div class="page-scroll">
			<a href="#service" class="btn btn-circle"><i class="fa fa-angle-double-down animated"></i></a>
		</div>
	</section>
	<!-- /Section: intro -->

	<!-- Section: services -->
	<section id="service" class="home-section text-center bg-gray">
		<div class="heading-about">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-lg-offset-2">
						<div class="wow bounceInDown" data-wow-delay="0.4s">
							<div class="section-heading">
								<h2>Features</h2>
								<i class="fa fa-2x fa-angle-down"></i>
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
				<div class="col-sm-3 col-md-3">
					<div class="wow fadeInLeft" data-wow-delay="0.2s">
						<div class="service-box">
							<div class="service-icon">
								<span><i class="fa fa-3x fa-tasks"></i></span>
							</div>
							<div class="service-desc">
								<h5>Tarefas</h5>
								<p>Organize suas tarefas com BEasy. Organize-as por matérias e também por andamento, não perca mais seus prazos!</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-3 col-md-3">
					<div class="wow fadeInUp" data-wow-delay="0.2s">
						<div class="service-box">
							<div class="service-icon">
								<span><i class="fa fa-3x fa-bullseye"></i></span>
							</div>
							<div class="service-desc">
								<h5>Metas</h5>
								<p>Traçar metas para grandes projetos fica mais fácil com BEasy! Deixe a organização com a gente para manter-se focado.</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-3 col-md-3">
					<div class="wow fadeInUp" data-wow-delay="0.2s">
						<div class="service-box">
							<div class="service-icon">
								<span><i class="fa fa-3x fa-area-chart"></i></span>
							</div>
							<div class="service-desc">
								<h5>Acompanhe seu progresso</h5>
								<p>Acompanhe seu progresso: BEasy também reune algumas informações úteis sobre seu desempenho, assim você poderá perceber em que precisa se concentrar mais!</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-3 col-md-3">
					<div class="wow fadeInRight" data-wow-delay="0.2s">
						<div class="service-box">
							<div class="service-icon">
								<span><i class="fa fa-3x fa-cloud"></i></span>
							</div>
							<div class="service-desc">
								<h5>Cloud System</h5>
								<p>Todos os benefícios de BEasy ficam guardados na nuvem! Dessa forma você desfruta de tudo isso de onde você estiver, seja num computador ou em seu celular!</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- /Section: services -->


	<!-- Section: app -->
	<section id="app" class="home-section text-center bg-gray">
		<div class="heading-about">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-lg-offset-2">
						<div class="wow bounceInDown" data-wow-delay="0.4s">
							<div class="section-heading">
								<h2>Tenha BEasy no seu bolso</h2>
								<i class="fa fa-2x fa-angle-down"></i>
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
				<div class="col-sm-8 col-md-8 col-lg-offset-2">
					<div class="wow fadeInLeft" data-wow-delay="0.2s">
						<div class="service-box">
							<div class="service-icon">
								<span><i class="fa fa-5x fa-mobile"></i></span>
							</div>
							<div class="service-desc">
								<h5>Android</h5>
								<p>Com o aplicativo BEasy para Android você carrega tudo que o BEasy te oferece na palma de sua mão! Não se preocupe mais em levar papel e caneta para uma reunião, basta puxar seu celular do bolso e anotar suas novas tarefas. Ao chegar em casa, tudo já estará no seu computador!</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- /Section: app -->

	<!-- Section: cadastro -->
	<section id="cadastro" class="home-section text-center">
		<div class="heading-contact">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-lg-offset-2">
						<div class="wow bounceInDown" data-wow-delay="0.4s">
							<div class="section-heading">
								<h2>Cadastre-se!</h2>
								<i class="fa fa-2x fa-angle-down"></i>
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
						<form id="cadastro-form" action="<c:url value="/cadastro"/>" method="POST">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="name">Nome</label> 
										<input type="text" class="form-control" id="cadastro-name" name="user.name" placeholder="ex: João Silva" required="required" />
									</div>
									<div class="form-group">
										<label for="email">Email</label>
										<div class="input-group">
											<span class="input-group-addon">
												<span class="glyphicon glyphicon-envelope"></span> 
											</span> 
											<input type="email" class="form-control" id="cadastro-email" name="user.email" placeholder="joao@exemplo.com" required="required" />
										</div>
									</div>
									<div class="form-group">
										<label for="name"> Senha</label> 
										<input type="password" class="form-control" id="cadastro-password" name="user.password" required="required" />
									</div>
								</div>
								<div class="col-md-12">
									<button type="submit" class="btn btn-skin pull-right" id="btnCadastro">Cadastrar!</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- /Section: cadastro -->

	<!-- Section: team -->
	<section id="about" class="home-section text-center">
		<div class="heading-about">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-lg-offset-2">
						<div class="wow bounceInDown" data-wow-delay="0.2s">
							<div class="section-heading">
								<h2>Nossa equipe</h2>
								<i class="fa fa-2x fa-angle-down"></i>
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
				<div class="col-xs-6 col-sm-4 col-md-4">
					<div class="wow bounceInUp" data-wow-delay="0.2s">
						<div class="team boxed-grey">
							<div class="inner">
								<h5>Fernanda Bernardo</h5>
								<p class="subtitle">Developer Ninja</p>
								<div class="avatar">
									<img src="img/team/fernanda.jpg" alt="" class="img-responsive img-circle" />
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-6 col-sm-4 col-md-4">
					<div class="wow bounceInUp" data-wow-delay="0.4s">
						<div class="team boxed-grey">
							<div class="inner">
								<h5>Tiago Miss&atilde;o</h5>
								<p class="subtitle">Mobile Archmage</p>
								<div class="avatar">
									<img src="img/team/tiago.jpg" alt="" class="img-responsive img-circle" />
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-6 col-sm-4 col-md-4">
					<div class="wow bounceInUp" data-wow-delay="0.6s">
						<div class="team boxed-grey">
							<div class="inner">
								<h5>Alexandre Rossi</h5>
								<p class="subtitle">Pixel Crafter</p>
								<div class="avatar">
									<img src="img/team/alexandre.jpg" alt="" class="img-responsive img-circle" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- /Section: team -->

	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-lg-12">
					<div class="wow shake" data-wow-delay="0.4s">
						<div class="page-scroll marginbot-30">
							<a href="#intro" id="totop" class="btn btn-circle"><i class="fa fa-angle-double-up animated"></i></a>
						</div>
					</div>
					<p>&copy;Copyright 2015 - BEasy. Todos os direitos reservados.</p>
				</div>
			</div>
		</div>
	</footer>

	<!-- Core JavaScript Files -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.min.js"></script>
	<script src="js/jquery.scrollTo.js"></script>
	<script src="js/wow.min.js"></script>
	<!-- Custom Theme JavaScript -->
	<script src="js/custom.js"></script>

</body>
</html>
