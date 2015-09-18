<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<tags:header/>

<section class="highlight-section">
	<h2>Login</h2>
</section>

<span>${validate}</span>

<section class="half-container">
	<form class="login-form" action="<c:url value="/login"/>" method="POST">
		<input type="text" name="user.email" placeholder="E-mail">
		<input type="password" name="user.password" placeholder="Senha">
		<input type="submit" value="Login">
	</form>
</section>

<tags:footer></tags:footer>