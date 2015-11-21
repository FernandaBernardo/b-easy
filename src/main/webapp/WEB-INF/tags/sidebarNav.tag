<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ attribute name="user" required="true" type="br.com.beasy.model.User" %>

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
						<li><a href="<c:url value="/logout"/>"><i class="fa fa-sign-out"></i> Logout</a></li>
					</ul>
				</div>
			</div>
		</li>
		<li class="bold active"><a href='<c:url value="/dashboard" />' class="waves-effect waves-cyan"><i class="fa fa-home"></i> Dashboard</a></li>
		<li class="no-padding">
			<ul class="collapsible collapsible-accordion">
				<li class="bold"><a class="collapsible-header waves-effect waves-cyan"><i class="fa fa-folder"></i> Matérias</a>
					<div class="collapsible-body">
						<ul>
							<c:forEach items="${user.subjects}" var="subject">
								<li><a href="<c:url value="/${subject.id}/tarefas"/>">${subject.name}</a></li>
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