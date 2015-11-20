<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="col-lg-3  col-lg-offset-1">
	<div class="boxed-transparent-black">
		<form id="login-form" action="<c:url value="/login"/>" method="POST">
			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<label for="login-name">Email</label> 
						<input type="email" class="form-control" id="login-name" name="user.email" placeholder="seuemail@exemplo.com" required="required" />
					</div>
					<div class="form-group">
						<label for="login-password"> Senha</label> 
						<input type="password" class="form-control" id="login-password" name="user.password" required="required" />
					</div>

					<div class="form-group">
						<button type="submit" class="btn btn-skin" id="btnLogin">Entrar</button>
					</div>
					<div class="form-group">
						<a href="#cadastro" style="color: white">Cadastre-se</a>
						&nbsp;&nbsp;|&nbsp;&nbsp; 
						<a href="#" style="color: white"><i class="fa fa-long-arrow-right"></i>Esqueci minha senha</a>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div class="row">
		<div class="col-md-12">
			<hr class="marginbot-5">
			<a href="<c:url value="/facebook" />" class="btn btn-facebook">entre com Facebook</a>
		</div>
	</div>
</div>
