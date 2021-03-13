
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
	.error{
		
		font-size:x-large;
	}
</style>
<body>
	
	
	
	
	
	


	
	
	
	
	
	<cfinclude template="Components/Header.cfm" >
	
	
	
	
		
	<cfif structKeyExists(form, 'loginSubmit')>
		 	<!--- Create an instance autServ--->
                <cfset autService = createObject("component", 'cfTraining/Components.autService') />
		 	<!--- Server side data validation--->
		 		 	<!--- Надо сделать ренэйм, тк проверка по логину--->

             <cfset aErrorMessages= autService.validateUser(form.username,form.password) />
             
             <cfif ArrayIsEmpty(aErrorMessages) >
             <!--- Если все ок продолжаем--->
				<cfset isUserLogged= autService.doLogin(form.username,form.password) />
             </cfif>
             
             
             

    
    </cfif>


	<div id="wrapper">
		
	<cfform id="slick-login">
		<cfif  structKeyExists(variables,'aErrorMessages') and not ArrayisEmpty(aErrorMessages)>
			     <cfoutput >
			     	<cfloop array="#aErrorMessages#" item="message">
			     		<p class="errorMessage">
			     			#message#
			     		</p>
			     	</cfloop>
			     </cfoutput>
		</cfif>
		
		<cfif structKeyExists(variables,'isUserLogged') and isUserLogged EQ false >
			<p class="errorMessage">
				Введите верные логин или пароль или <a href="aut.cfm">
					зарегестрируйтесь
				</a>
			</p>
		</cfif>
	
		
		 <cfif structKeyExists(session,'stLoggedInUser')>

		 	<p>
		 		<cfoutput >
		 			Welcome #session.stLoggedInUser.login#
		 			<a href="index.cfm?logout">
		 				Logout
		 			</a>
		 			<!---<p>
		 				#session.stLoggedInUser.userID#
		 			</p>--->
		 		</cfoutput>	
		 	</p>
		<cfelse> 	
		<label for="username">Логин:</label>
		<cfinput type="text" name="username" id="username" class="placeholder" placeholder="login" required="true" message="Please enter your login">
		<label for="password">Пароль:</label><input type="password" name="password" id="password" class="placeholder" placeholder="password" required="true" message="Please enter your password">
		<input type="submit" value="ВОЙТИ" name="loginSubmit" id="loginSubmit">
			
					 </cfif>

	</cfform>
	</div>
	
	
</body>
</html>