
<cfif structkeyExists(URL,'logout') >
	<cfset createObject("component",'cfTraining.Components.autService').doLogout()/>
</cfif>


<!DOCTYPE html>
<head>
	<meta charset="utf-8">
	<title>Login Form</title>
	<link rel="icon" href="http://vladmaxi.net/favicon.ico" type="image/x-icon">
	<link rel="shortcut icon" href="http://vladmaxi.net/favicon.ico" type="image/x-icon">
	
	
</head>
<style >
	
	.t p{
		font-size:20px;
			 line-height: 4;

	}

	
</style>
<body>
	
	
	
	
	
	


	
	
	
	
	
	<cfinclude template="Components/Header.cfm" >
	
	
	<cfquery datasource="mysqBD" name="getUsers">
			select *from user
	where user_id = #session.stLoggedInUser.userID#
	</cfquery>

		
	<cfoutput query="getUsers">
		


		<div class="t">
			<p>
	Информация о пользователе
</p>
			<p>
				ID: #session.stLoggedInUser.userID#
			</p>
			<p> Имя: #name# </p>
			<p> Почта: #email# </p>
			<p> Пароль: #password# </p>
		</div>
		 <a href="index.cfm?logout">
		 	Выйти
		 </a>
	</cfoutput>

	
	
</body>
</html>