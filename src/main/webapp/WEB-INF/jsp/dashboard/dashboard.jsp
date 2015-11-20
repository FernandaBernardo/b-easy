<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="user" value="${loggedUser.user}" />

<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- roboto -->
	<link type="text/css" rel="stylesheet" href="css/font.css">

	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
	<title>BEasy - Dashboard</title>

	<!-- CORE CSS-->	
	<link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection">
	<link href="css/style-dash.css" type="text/css" rel="stylesheet" media="screen,projection">

	<!-- FONT AWESOME -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

	<!-- INCLUDED PLUGIN CSS ON THIS PAGE -->
	<link href="css/perfect-scrollbar.css" type="text/css" rel="stylesheet" media="screen,projection">

	<style type="text/css">
		.jqstooltip {
			position: absolute;
			left: 0px;
			top: 0px;
			visibility: hidden;
			background: rgb(0, 0, 0) transparent;
			background-color: rgba(0, 0, 0, 0.6);
			filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);
			-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";
			color: white;
			font: 10px arial, san serif;
			text-align: left;
			white-space: nowrap;
			padding: 5px;
			border: 1px solid white;
			z-index: 10000;
		}
		
		.jqsfield {
			color: white;
			font: 10px arial, san serif;
			text-align: left;
		}
	</style>
</head>

<body class="loaded">
	<!-- Start Page Loading -->
	<div id="loader-wrapper">
		<div id="loader"></div>
		<div class="loader-section section-left"></div>
		<div class="loader-section section-right"></div>
	</div>
	<!-- End Page Loading -->

	<!-- START HEADER -->
	<header id="header" class="page-topbar">
		<!-- start header nav-->
		<div class="navbar-fixed">
			<nav class="beasy-blue">
				<div class="nav-wrapper">
					<a href='<c:url value='/dashboard' />' class="brand-logo center"> 
						<img src="img/logo_branco.png" alt="materialize logo">
					</a>
					<ul class="right hide-on-med-and-down">
						<li><a href="javascript:void(0);" class="waves-effect waves-block waves-light toggle-fullscreen"><i class="fa fa-expand"></i></a></li>
					</ul>
				</div>
			</nav>
		</div>
		<!-- end header nav-->
	</header>
	<!-- END HEADER -->

	<!-- START MAIN -->
	<div id="main">
		<!-- START WRAPPER -->
		<div class="wrapper">

			<!-- START LEFT SIDEBAR NAV-->
			<aside id="left-sidebar-nav">
				<!-- COMECO NAV FAKE-->
				<ul class="side-nav changeSide show-on-large-only fixed leftside-navigation ps-container ps-active-y" style="width: 60px;">
					<li class="user-details beasy-blue darken-2" style="padding: 23px 0 0; height: 86px;">
						<div class="row">
							<div class="col col s12 m12 l12">
								<img src="${user.pictureUrl}" alt="" class="circle responsive-img valign profile-image">
							</div>
						</div>
					</li>
					<li class="no-padding active">
						<ul class="collapsible collapsible-accordion">
							<li class="bold"><a class="collapsible-header waves-effect waves-cyan"><i class="fa fa-home"></i></a></li>
						</ul>
					</li>
					<li class="no-padding">
						<ul class="collapsible collapsible-accordion">
							<li class="bold"><a class="collapsible-header waves-effect waves-cyan"><i class="fa fa-folder"></i></a></li>
						</ul>
					</li>
					<li class="no-padding">
						<ul class="collapsible collapsible-accordion">
							<li class="bold"><a class="collapsible-header waves-effect waves-cyan"><i class="fa fa-hourglass-half"></i></a></li>
						</ul>
					</li>
					<li class="li-hover"><div class="divider"></div></li>
					<li class="no-padding">
						<ul class="collapsible collapsible-accordion">
							<li class="bold"><a class="collapsible-header waves-effect waves-cyan"><i class="fa fa-history"></i></a></li>
						</ul>
					</li>

					<!-- Gambs pro menu lateral ficar sempre a mostra -->
					<div class="ps-scrollbar-x-rail">
						<div class="ps-scrollbar-x"></div>
					</div>
					<div class="ps-scrollbar-y-rail">
						<div class="ps-scrollbar-y"></div>
					</div>
				</ul>
				<!-- FIM NAV FAKE-->

				<ul id="slide-out" class="side-nav originalSide leftside-navigation ps-container ps-active-y">
					<li class="user-details beasy-blue darken-2">
						<div class="row">
							<div class="col col s4 m4 l4">
								<img src="${user.pictureUrl}" alt="" class="circle responsive-img valign profile-image">
							</div>
							<div class="col col s8 m8 l8">

								<a class="btn-flat dropdown-button waves-effect waves-light white-text profile-btn" href="#" data-activates="profile-dropdown"> ${user.name} <i class="fa fa-caret-down"></i></a>
								<ul id="profile-dropdown" class="dropdown-content">
									<li><a href="#"><i class="fa fa-cog"></i> Config</a></li>
									<li><a href="#"><i class="fa fa-question"></i> Ajuda</a></li>
									<li class="divider"></li>
									<li><a href="#"><i class="fa fa-sign-out"></i> Logout</a></li>
								</ul>
							</div>
						</div>
					</li>
					<li class="bold active"><a href="#" class="waves-effect waves-cyan"><i class="fa fa-home"></i> Dashboard</a></li>
					<li class="no-padding">
						<ul class="collapsible collapsible-accordion">
							<li class="bold"><a class="collapsible-header waves-effect waves-cyan"><i class="fa fa-folder"></i> Matérias</a>
								<div class="collapsible-body">
									<ul>
										<c:forEach items="${user.subjects}" var="subject">
											<li><a href="#">${subject.name}</a></li>
										</c:forEach>
									</ul>
								</div>
							</li>
							<li class="bold"><a href="#" class="waves-effect waves-cyan"><i class="fa fa-hourglass-half"></i> Pomodoro <span class="new badge"></span></a></li>
						</ul>
					</li>

					<li class="li-hover"><div class="divider"></div></li>
					<li class="li-hover"><p class="ultra-small margin more-text">MAIS</p></li>
					<li><a href="#"><i class="fa fa-history"></i> Histórico</a></li>

					<!-- Gambs pro menu lateral ficar sempre a mostra -->
					<div class="ps-scrollbar-x-rail">
						<div class="ps-scrollbar-x"></div>
					</div>
					<div class="ps-scrollbar-y-rail">
						<div class="ps-scrollbar-y"></div>
					</div>
				</ul>
				<!-- menu icon pra quando a tela for menor -->
				<a href="#" data-activates="slide-out" class="sidebar-collapse btn-floating btn-medium waves-effect waves-light hide-on-large-only cyan"><i class="fa fa-bars"></i></a>
			</aside>
			<!-- END LEFT SIDEBAR NAV-->

			<!-- START CONTENT -->
			<section id="content">
				<!--start container-->
				<div class="container">
					<!--work collections start-->
					<div id="work-collections">
						<div class="row">
							<div class="col s12 m12 l7">
								<ul id="projects-collection" class="collection">
									<li class="collection-item avatar" style="padding-left: 20px;">
										<div class="row">
											<div class="col m1 l1">
												<a href="#" class="beasy-green-color"> <iclass="fa fa-folder-open fa-3x"></i></a>
											</div>
											<div class="col m11 l11">
												<span class="collection-header">Materias</span>
												<p>Resumo de suas atividades</p>
											</div>
										</div>
									</li>
									<c:forEach items="${user.subjects}" var="subject">
										<li class="collection-item">
											<div class="row">
												<div class="col s1">
													<span class="task-cat" style="background-color: ${subject.color}">
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													</span>
												</div>
												<div class="col s7">
													<a href='<c:url value="/${subject.id}/tarefas"/>' class="collections-title">${subject.name}</a>
												</div>
												<div class="col s4 tooltipped" data-position="top" data-delay="50" data-tooltip="${subject.progress}%">
													<div class="progress">
														<div class="determinate" style="width: ${subject.progress}%"></div>
													</div>
												</div>
											</div>
										</li>
									</c:forEach>
								</ul>
							</div>
							<div class="col s12 m12 l5">
								<!-- tarefas mais proximas de deadline -->
								<ul id="task-card" class="collection">
									<li class="collection-item avatar" style="padding-left: 20px;">
										<div class="row">
											<div class="col m1 l1">
												<a href="#" class="beasy-green-color"><i class="fa fa-check fa-3x"></i></a>
											</div>
											<div class="col m11 l11">
												<span class="collection-header">Próximas Tarefas</span>
												<p class="task-card-date" style="color: black; padding-left: 20px;">23 outubro, 2015</p>
											</div>
										</div>
									</li>
									<c:forEach items="${nextTasks}" var="task" varStatus="index">
										<li class="collection-item dismissable" style="touch-action: pan-y; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
											<input type="checkbox" id="task${index.count}"> 
											<label for="task${index.count}" style="text-decoration: none;">${task.title}<a href="#" class="secondary-content">
												<span class="ultra-small alert">${task.finalDate}</span></a>
											</label> 
											<span class="task-catl" style="background-color: ${task.subject.color}">${task.subject.name}</span>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
					<!--work collections end-->

					<!--card stats start-->
					<div id="card-stats">
						<div class="row">
							<div class="col s12 m6 l2">
								<div class="card">
									<div class="card-content purple white-text">
										<p class="card-stats-title">
											<i class="fa fa-pencil-square-o"></i> TO-DO
										</p>
										<h4 class="card-stats-number">14</h4>
									</div>
									<div class="card-action purple darken-2">
										<p class="card-stats-compare white-text" style="text-align: center; padding: 0px; margin: 0px">4 matérias diferentes</p>
									</div>
								</div>
							</div>
							<div class="col s12 m6 l2">
								<div class="card">
									<div class="card-content blue-grey white-text">
										<p class="card-stats-title">
											<i class="fa fa-crosshairs"></i> DOING
										</p>

										<h4 class="card-stats-number">3</h4>
									</div>
									<div class="card-action blue-grey darken-2">
										<p class="card-stats-compare white-text" style="text-align: center; padding: 0px; margin: 0px">2 matérias diferentes</p>
									</div>
								</div>
							</div>
							<div class="col s12 m6 l2">
								<div class="card">
									<div class="card-content green white-text">
										<p class="card-stats-title">
											<i class="fa fa-check"></i> DONE
										</p>
										<h4 class="card-stats-number">32</h4>
									</div>
									<div class="card-action green darken-2">
										<p class="card-stats-compare white-text" style="text-align: center; padding: 0px; margin: 0px">72% na última semana</p>
									</div>
								</div>
							</div>
							<div class="col s12 m6 l2">
								<div class="card">
									<div class="card-content pink lighten-2 white-text">
										<p class="card-stats-title">
											<i class="fa fa-exclamation-triangle"></i> ATRASADAS
										</p>
										<h4 class="card-stats-number">2</h4>

									</div>
									<div class="card-action  pink darken-2">
										<p class="card-stats-compare white-text" style="text-align: center; padding: 0px; margin: 0px">50% há um mês</p>
									</div>
								</div>
							</div>
							<div class="col s12 m6 l2">
								<div class="card">
									<div class="card-content cyan lighten-2 white-text">
										<p class="card-stats-title">
											<i class="fa fa-hourglass-half"></i> POMODORO
										</p>
										<h4 class="card-stats-number">147</h4>
									</div>
									<div class="card-action cyan darken-2">
										<p class="card-stats-compare white-text" style="text-align: center; padding: 0px; margin: 0px">minutos em 16 seções</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--card stats end-->

					<!-- Floating Action Button -->
					<div class="fixed-action-btn" style="bottom: 45px; right: 24px;">
						<a class="btn-floating btn-large beasy-green"> <i class="fa fa-plus"></i></a>
						<ul>
							<li><a href="#modal-tarefa" class="btn-floating red modal-trigger"> <i class="fa fa-check"></i></a></li>
							<li><a href="#modal-materia" class="btn-floating blue modal-trigger"> <i class="fa fa-folder"></i></a></li>
						</ul>
					</div>
					<!-- Floating Action Button -->
				</div>
				<!--end container-->

				<!-- modals com adição de materias e tarefas -->
				<form action="<c:url value='/nova-materia'/>" method="post" id="modal-materia" class="modal modal-fixed-footer" style="display: none; opacity: 1; top: 0px;">
					<div class="modal-content">
						<h4>Adicione uma matéria</h4>
							Nome:
							<input type="text" name="subject.name">
							Cor:
							<input type="color" name="subject.color">
					</div>
					<div class="modal-footer">
						<a href="#" class="waves-effect waves-red btn-flat modal-action modal-close">Cancelar</a>
						<input type="submit" value="Adicionar matéria" class="waves-effect waves-green btn-flat modal-action modal-close">
					</div>
				</form>
				<form action='<c:url value='/nova-tarefa'/>' method="post" id="modal-tarefa" class="modal modal-fixed-footer" style="display: none; opacity: 1; top: 0px;">
					<div class="modal-content">
						<h4>Adicione uma tarefa</h4>
						Título
						<input type="text" name="task.title">
						Descrição
						<input type="text" name="task.description">
						<input list="subjects" name="task.subject.name" >
						<datalist id="subjects">
							<c:forEach items="${user.subjects}" var="subject">
								<option value="${subject.name}">${subject.name}</option>
							</c:forEach>
						</datalist>
					</div>
					<div class="modal-footer">
						<a href="#" class="waves-effect waves-red btn-flat modal-action modal-close">Cancelar</a>
						<input type="submit" value="Adicionar matéria" class="waves-effect waves-green btn-flat modal-action modal-close">
					</div>
				</form>
			</section>
			<!-- END CONTENT -->
		</div>
		<!-- END WRAPPER -->
	</div>
	<!-- END MAIN -->

	<!-- //////////////////////////////////////////////////////////////////////////// -->

	<!-- START FOOTER -->
	<footer id="footer" class="page-footer beasy-blue">
		<div class="footer-copyright">
			<div class="container">
				Copyright © 2015 <a class="grey-text text-lighten-4" href="#" target="_blank">BEasy</a> All rights reserved.
			</div>
		</div>
	</footer>
	<!-- END FOOTER -->

	<!-- ================================================
    Scripts
    ================================================ -->

	<!-- jQuery Library -->
	<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
	<!--materialize js-->
	<script type="text/javascript" src="js/materialize.js"></script>
	<!--scrollbar-->
	<script type="text/javascript" src="js/perfect-scrollbar.min.js"></script>
	<!--scrollbar-->
	<script type="text/javascript" src="js/footer_binder.js"></script>

	<!--plugins.js - Some Specific JS codes for Plugin Settings-->
	<script type="text/javascript" src="js/plugins-dash.js"></script>

	<div class="hiddendiv common"></div>
	<div class="drag-target" style="left: 0px; touch-action: pan-y; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); right: 0px;"></div>
	<div class="drag-target" style="right: 0px; touch-action: pan-y; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></div>
	<div id="toast-container"></div>
</body>
</html>