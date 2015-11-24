<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="user" value="${loggedUser.user}" />

<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- roboto -->
	<link type="text/css" rel="stylesheet" href="../css/font.css">

	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
	<title>BEasy - ${subject.name}</title>

	<!-- CORE CSS-->
	<link href="../css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection">
	<link href="../css/style-dash.css" type="text/css" rel="stylesheet" media="screen,projection">

	<!-- FONT AWESOME -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

	<!-- INCLUDED PLUGIN CSS ON THIS PAGE -->
	<link href="../perfect-scrollbar.css" type="text/css" rel="stylesheet" media="screen,projection">

	<style type="text/css">
		.task-content:hover {
			cursor: pointer;
		}

		.task-actions {
			padding-right: 10px;
			font-size: 0.8em;
			color: #666;
		}

		.action-forward:hover {
			color: green;
		}

		.action-backward:hover {
			color: red;
		}

		.task-action:hover {
			cursor: pointer;
		}

		.jqstooltip {
			position: absolute;
			left: 0px;
			top: 0px;
			visibility: hidden;
			background: rgb(0, 0, 0) transparent;
			background-color: rgba(0, 0, 0, 0.6);
			filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000,
				endColorstr=#99000000);
			-ms-filter:
				"progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";
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
					<div class="row">
						<div class="col s12 m12 l12">
							<h4>
								<span class="task-cat" style="background-color: ${subject.color}; padding: 0 0; font-size: inherit; margin-right: .5em;">&nbsp;</span>${subject.name}
								<i class="fa fa-times tooltipped" data-position="top" data-delay="30" data-tooltip="excluir" style="font-size: 0.5em"></i>
							</h4>
						</div>
					</div>
					<!--work collections start-->
					<div id="work-collections">
						<div class="row">
							<div class="col s12 m12 l4">
								<ul id="task-card" class="collection todo">
									<li class="collection-item avatar" style="padding-left: 20px;">
										<div class="row">
											<div class="col m1 l1">
												<a href="#" class="beasy-green-color"> <i class="fa fa-tasks fa-3x"></i></a>
											</div>
											<div class="col m11 l11">
												<span class="collection-header">TO-DO</span>
												<p class="task-card-date" style="color: black; padding-left: 20px;">${subject.toDoTasks.size()} Tarefa(s)</p>
											</div>
										</div>
									</li>
									<c:forEach items="${subject.toDoTasks}" var="task">
										<li class="collection-item dismissable" style="height: 3.5em;">
											<div class="col m10 offset-m1 task-content modal-trigger" href="#modal-edit-tarefa">${task.title}
												<a href="#" class="secondary-content"><span class="ultra-small alert">Ontem</span></a>
											</div>
											<div class="col m1">
												<a href="<c:url value="/${subject.id}/tarefas/${task.id}/DOING"/>"><i style="line-height: inherit;" class="task-action action-forward go-doing fa fa-angle-right fa-2x"></i></a>
											</div>
										</li>
									</c:forEach>
								</ul>
							</div>
							<div class="col s12 m12 l4">
								<ul id="task-card" class="collection doing">
									<li class="collection-item avatar" style="padding-left: 20px;">
										<div class="row">
											<div class="col m1 l1">
												<a href="#" class="beasy-green-color"> <i class="fa fa-crosshairs fa-3x"></i>
												</a>
											</div>
											<div class="col m11 l11">
												<span class="collection-header" style="padding: 20px">Doing</span>
												<p class="task-card-date" style="color: black; padding-left: 20px;">${subject.doingTasks.size()} Tarefa(s)</p>
											</div>
										</div>
									</li>
									<c:forEach items="${subject.doingTasks}" var="task">
										<li class="collection-item dismissable" style="height: 3.5em;">
											<div class="col m1">
												<i style="line-height: inherit;" class="task-action action-backward go-todo  fa fa-angle-left fa-2x"></i>
											</div>
											<div class="col m10 task-content modal-trigger" href="#modal-edit-tarefa">${task.title}
												<a href="#" class="secondary-content"><span class="ultra-small alert">Ontem</span></a>
											</div>
											<div class="col m1">
												<i style="line-height: inherit;" class="task-action action-forward go-done fa fa-angle-right fa-2x"></i>
											</div>
										</li>
									</c:forEach>
								</ul>
							</div>
							<div class="col s12 m12 l4">
								<ul id="task-card" class="collection done">
									<li class="collection-item avatar" style="padding-left: 20px;">
										<div class="row">
											<div class="col m1 l1">
												<a href="#" class="beasy-green-color"> <i class="fa fa-check fa-3x"></i></a>
											</div>
											<div class="col m11 l11">
												<span class="collection-header">Done</span>
												<p class="task-card-date" style="color: black; padding-left: 20px;">${subject.doneTasks.size()} Tarefa(s)</p>
											</div>
										</div>
									</li>
									<c:forEach items="${subject.doneTasks}" var="task">
										<li class="collection-item dismissable" style="height: 3.5em;">
											<div class="col m1">
												<i style="line-height: inherit;" class="task-action action-backward go-doing  fa fa-angle-left fa-2x"></i>
											</div>
											<div class="col m10 task-content modal-trigger" href="#modal-edit-tarefa" style="text-decoration: line-through;">${task.title}
												<a href="#" class="secondary-content"><span class="ultra-small alert">Ontem</span></a>
											</div>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
					<!--work collections end-->

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
				<!-- modals com adi��o de materias e tarefas -->
				<form action="<c:url value='/nova-materia'/>" method="post" id="modal-materia" class="modal modal-fixed-footer" style="display: none; opacity: 1; top: 0px;">
					<div class="modal-content">
						<h4>Adicione uma mat&eacute;ria</h4>
						<div class="row">
							<div class="input-field col s12">
								Nome
								<input type="text" name="subject.name">
							</div>
						</div>
						<div class="row">
							<div class="input-field col s12">
								Cor
								<input type="color" name="subject.color">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<a href="#" class="waves-effect waves-red btn-flat modal-action modal-close">Cancelar</a>
						<button class="btn-flat waves-effect waves-green modal-action modal-close" type="submit" name="action">
							Adicionar Mat&eacute;ria
						</button>
					</div>
				</form>
				<form action='<c:url value='/nova-tarefa'/>' method="post" id="modal-tarefa" class="modal modal-fixed-footer" style="display: none; opacity: 1; top: 0px;">
					<div class="modal-content">
						<h4>Adicione uma tarefa</h4>
						<div class="row">
							<div class="input-field col s6">
								T&iacute;tulo
								<input type="text" name="task.title">
							</div>
							<div class="input-field col s3">
								Mat&eacute;ria
								<input list="subjects" name="task.subject.name" >
								<datalist id="subjects">
									<c:forEach items="${user.subjects}" var="subject">
										<option value="${subject.name}">${subject.name}</option>
									</c:forEach>
								</datalist>
							</div>
							<div class="input-field col s3">
								Status
								<input list="status" name="task.status" >
								<datalist id="status">
									<option value="TODO">TO-DO</option>
									<option value="DOING">DOING</option>
									<option value="DONE">DONE</option>
								</datalist>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s12">
								Descri&ccedil;&atilde;o
								<input type="text" name="task.description">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<a href="#" class="waves-effect waves-red btn-flat modal-action modal-close">Cancelar</a>
						<button class="btn-flat waves-effect waves-green modal-action modal-close" type="submit" name="action">
							Adicionar Tarefa
						</button>
						<!--<input type="submit" value="Adicionar matéria" class="waves-effect waves-green btn-flat modal-action modal-close">-->
					</div>
				</form>
				
				<!-- modal para editar uma tarefa -->
				<div id="modal-edit-tarefa" class="modal modal-fixed-footer" style="display: none; opacity: 1; top: 0px;">
					<div class="modal-content">
						<h4>Edite a tarefa</h4>
						<form class="col s12">
							<div class="row">
								<div class="input-field col s9">
									<input placeholder=" " id="task_edit_name" type="text" class="validate"> <label for="task_name" class="active">Tarefa</label>
								</div>
								<div class="input-field col s3">
									<input placeholder="02/02/2016" id="task_edit_date" type="text" class="validate"> <label for="task_date" class="active">Data</label>
								</div>
							</div>
							<div class="row">
								<div class="col s9">
									<label>Projeto</label>
									<select class="browser-default" id="task_edit_project">
										<option value="" selected="">Inteligencia Artificial</option>
									</select>
								</div>
								<div class="col s3">
									<label>Status</label>
									<select class="browser-default" id="task_edit_status">
										<option value="todo">TO-DO</option>
										<option value="doing">DOING</option>
										<option value="done">DONE</option>
									</select>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s12">
									<textarea id="task_edit_comment" class="materialize-textarea"></textarea>
									<label for="task_comment" class="">Coment�rios</label>
								</div>
							</div>

						</form>
					</div>
					<div class="modal-footer">
						<a href="#" class="waves-effect waves-red btn-flat modal-action modal-close">Cancelar</a>
						<a href="#" class="waves-effect waves-green btn-flat modal-action modal-close">Salvar altera��es</a>
					</div>
				</div>
			</section>
		<!-- END CONTENT -->
		</div>
	<!-- END MAIN -->
	</div>

	<!-- //////////////////////////////////////////////////////////////////////////// -->

	<tags:footer />

	<!-- Toast Notification -->
	<script type="text/javascript">
        //preenche o modal de edi��o com os valores da task
        $(".task-content").click(function(){
            //console.log($(this));
            $("#task_edit_name").val('TAREFA CERTA DEPOIS DE USAR O ID');

            //TO DO pega o id da task e preenche comments/status/data/name
        });

        //funcao para mudar tarefas para frente
        $(".action-forward").click(function(){
            console.log('action forward..');

            //construcao para doing
            if($(this).hasClass('go-doing')){
                //get task content
                var task = $(this).parent().parent().children()[0].innerHTML;

                //remove da lista atual
                $(this).parent().parent().remove();


                //constroi o que vai ser inserido
                var html =  '<li class="collection-item dismissable" style="height: 3.5em;">'
                                +'<div class="col m1">'
                                    +'<i style="line-height: inherit;" class="task-action action-backward go-todo  fa fa-angle-left fa-2x"></i>'
                                +'</div>'
                                +'<div class="col m10 task-content modal-trigger" href="#modal-edit-tarefa">'
                                    +task
                                +'</div>'
                                +'<div class="col m1">'
                                    +'<i style="line-height: inherit;" class="task-action action-forward go-done fa fa-angle-right fa-2x"></i>'
                                +'</div>'
                            +'</li>';

                //console.log(html);
                //adiciona a lista de doing
                $(".doing").append(html);

                Materialize.toast('<span>Tarefa marcada como DOING.</span>', 1500);
                //TO-DO atualiza��o do status

                return;
            }
            //construcao para done
            if($(this).hasClass('go-done')){
                //get task content
                var task = $(this).parent().parent().children()[1].innerHTML;

                //remove da lista atual
                $(this).parent().parent().remove();

                //constroi o que vai ser inserido
                var html =  '<li class="collection-item dismissable" style="height: 3.5em;">'
                                +'<div class="col m1">'
                                    +'<i style="line-height: inherit;" class="task-action action-backward go-doing fa fa-angle-left fa-2x"></i>'
                                +'</div>'
                                +'<div class="col m10 task-content modal-trigger" href="#modal-edit-tarefa" style="text-decoration: line-through;">'
                                    +task
                                +'</div>'
                            +'</li>';

                //adiciona a lista de doing
                $(".done").append(html);

                Materialize.toast('<span>Tarefa marcada como DONE.</span>', 1500);
                //TO-DO atualiza��o do status

                return;
            }
        });


        //funcao para mudar tarefas para frente
        $(".action-backward").click(function(){
            console.log('action backward..');

            //construcao para doing
            if($(this).hasClass('go-doing')){
                //get task content
                var task = $(this).parent().parent().children()[1].innerHTML;

                //remove da lista atual
                $(this).parent().parent().remove();

                //constroi o que vai ser inserido
                var html =  '<li class="collection-item dismissable" style="height: 3.5em;">'
                                +'<div class="col m1">'
                                    +'<i style="line-height: inherit;" class="task-action action-backward go-todo  fa fa-angle-left fa-2x"></i>'
                                +'</div>'
                                +'<div class="col m10 task-content modal-trigger" href="#modal-edit-tarefa">'
                                    +task
                                +'</div>'
                                +'<div class="col m1">'
                                    +'<i style="line-height: inherit;" class="task-action action-forward go-done fa fa-angle-right fa-2x"></i>'
                                +'</div>'
                            +'</li>';

                //console.log(html);
                //adiciona a lista de doing
                $(".doing").append(html);

                Materialize.toast('<span>Tarefa marcada como DOING.</span>', 1500);
                //TO-DO atualiza��o do status


                return;
            }
            //construcao para done
            if($(this).hasClass('go-todo')){
                //get task content
                var task = $(this).parent().parent().children()[1].innerHTML;

                //remove da lista atual
                $(this).parent().parent().remove();

                //constroi o que vai ser inserido
                var html =  '<li class="collection-item dismissable" style="height: 3.5em;">'
                                +'<div class="col m10 offset-m1 task-content modal-trigger" href="#modal-edit-tarefa">'
                                    +task
                                +'</div>'
                                +'<div class="col m1">'
                                    +'<i style="line-height: inherit;" class="task-action action-backward go-doing fa fa-angle-right fa-2x"></i>'
                                +'</div>'
                            +'</li>';


                //console.log(html);
                //adiciona a lista de doing
                $(".done").append(html);

                Materialize.toast('<span>Tarefa marcada como TO-DO.</span>', 1500);
                //TO-DO atualiza��o do status

                return;
            }
        });
    </script>
</body>
</html>
