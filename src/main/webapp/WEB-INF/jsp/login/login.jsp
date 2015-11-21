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
	<span>${validate}</span>
	
	<section class="intro" style="padding-top: 10%;">
		<div class="slogan">
			<div class="row">
				<div class="col-lg-6  col-lg-offset-1">
					<img src="img/logo_branco.png" class="img-responsive"></img>
					<h4>Organize seus estudos sem estresse, sem pânico.</h4>
				</div>

				<tags:login />
			</div>
		</div>
	</section>
	
</body>
</html>