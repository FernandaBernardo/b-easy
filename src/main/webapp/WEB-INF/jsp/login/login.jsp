<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>

<tags:header/>
<span>${validate}</span>
<form action="" method="POST">
	E-mail:<input type="text" name="user.email">
	Password:<input type="password" name="user.password">
	<input type="submit" value="Login">
</form>

<tags:footer></tags:footer>