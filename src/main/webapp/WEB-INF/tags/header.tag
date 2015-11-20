<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>

<header id="header" class="page-topbar">
	<div class="navbar-fixed">
		<nav class="beasy-blue">
			<div class="nav-wrapper">
				<a href="<c:url value='/dashboard' />" class="brand-logo center"> 
					<img src="/img/logo_branco.png" alt="materialize logo">
				</a>
				<ul class="right hide-on-med-and-down">
					<li>
						<a href="javascript:void(0);" class="waves-effect waves-block waves-light toggle-fullscreen"> <i class="fa fa-expand"></i></a>
					</li>
				</ul>
			</div>
		</nav>
	</div>
</header>