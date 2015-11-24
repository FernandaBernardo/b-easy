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

	<tags:header />

	<!-- START MAIN -->
	<div id="main">
		<!-- START WRAPPER -->
		<div class="wrapper">
			<tags:sidebarNav user="${user}"/>

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
												<a href="#" class="beasy-green-color"> <i class="fa fa-folder-open fa-3x"></i></a>
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
												<span class="collection-header">Pr�ximas Tarefas</span>
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
										<p class="card-stats-compare white-text" style="text-align: center; padding: 0px; margin: 0px">4 mat�rias diferentes</p>
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
										<p class="card-stats-compare white-text" style="text-align: center; padding: 0px; margin: 0px">2 mat�rias diferentes</p>
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
										<p class="card-stats-compare white-text" style="text-align: center; padding: 0px; margin: 0px">72% na �ltima semana</p>
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
										<p class="card-stats-compare white-text" style="text-align: center; padding: 0px; margin: 0px">50% h� um m�s</p>
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

				<!-- modals com adi��o de materias e tarefas -->
				<form action="<c:url value='/nova-materia'/>" method="post" id="modal-materia" class="modal modal-fixed-footer" style="display: none; opacity: 1; top: 0px;">
					<div class="modal-content">
						<h4>Adicione uma mat�ria</h4>
							Nome
							<input type="text" name="subject.name">
							Cor
							<input type="color" name="subject.color">
					</div>
					<div class="modal-footer">
						<a href="#" class="waves-effect waves-red btn-flat modal-action modal-close">Cancelar</a>
						<input type="submit" value="Adicionar mat�ria" class="waves-effect waves-green btn-flat modal-action modal-close">
					</div>
				</form>
				<form action='<c:url value='/nova-tarefa'/>' method="post" id="modal-tarefa" class="modal modal-fixed-footer" style="display: none; opacity: 1; top: 0px;">
					<div class="modal-content">
						<h4>Adicione uma tarefa</h4>
						T�tulo
						<input type="text" name="task.title">
						Descri��o
						<input type="text" name="task.description">
						<input list="subjects" name="task.subject.name" >
						Matéria
						<datalist id="subjects">
							<c:forEach items="${user.subjects}" var="subject">
								<option value="${subject.name}">${subject.name}</option>
							</c:forEach>
						</datalist>
					</div>
					<div class="modal-footer">
						<a href="#" class="waves-effect waves-red btn-flat modal-action modal-close">Cancelar</a>
						<input type="submit" value="Adicionar mat�ria" class="waves-effect waves-green btn-flat modal-action modal-close">
					</div>
				</form>
			</section>
			<!-- END CONTENT -->
		</div>
		<!-- END WRAPPER -->
	</div>
	<!-- END MAIN -->

	<tags:footer />
</body>
</html>
