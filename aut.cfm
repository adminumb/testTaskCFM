








<cfif structKeyExists(form, 'autSubmit')>
	 <cfset aErrorMessages=Arraynew(1)/>
	 	<!--- Валидация имени--->
	<cfif form.username EQ ''>
    	<cfset arrayAppend(aErrorMessages, 'Пожалуйста задайте логин')/>
    </cfif> 	
	 	
  
    
    <cfif NOT isValid('email', form.email)>
			<cfset arrayAppend(aErrorMessages,'Введите корректный email') />
		</cfif>
    
    
    <cfif form.password EQ ''>
    	<cfset arrayAppend(aErrorMessages, 'Задайте пароль')/>
    </cfif>
   
  
   <cfquery datasource="mysqBD" name="getmail">
   	select email from user;
   </cfquery>
    
     <cfif form.email EQ '#getmail.email#'>
    	<cfset arrayAppend(aErrorMessages, 'Пользователь с таким email уже существует.Если забыли пароль, обратитесь к администратору сайта')/>
    </cfif>
     <cfif ArrayisEmpty(aErrorMessages)  >
    	<!---Если все ок тада --->    
    	
    	
    	
    	    	<cfquery datasource='mysqBD'>

    	
    		
    		insert into user(name,email,password) values(
    		'#form.username#','#form.email#','#form.password#')
    
    		</cfquery>
    		
    		<cflocation url="log.cfm" >
    </cfif>
</cfif>




















<!DOCTYPE html>
<head>
	<meta charset="utf-8">
	<title>Login Form</title>
	<link rel="icon" href="http://vladmaxi.net/favicon.ico" type="image/x-icon">
	<link rel="shortcut icon" href="http://vladmaxi.net/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" type="text/css" href="/cfTraining/styles/loginStyle.css" />
	<link href="/cfTraining/styles/style.css" rel="stylesheet" type="text/css" media="screen" />
	<link href="/cfTraining/styles/hdStreet.css" rel="stylesheet" type="text/css" media="screen" />
	
</head>
<body>
	
	<cfinclude template="Components/Header.cfm" >
	
	


	<div id="wrapper">

	<cfform id="slick-login">
		
		
		<cfif isDefined('aErrorMessages') AND NOT ArrayisEmpty(aErrorMessages)>
			<cfoutput>
				<cfloop array="#aErrorMessages#" index="message">
					<p class="errorMessage">#message#</p>
				</cfloop>
			</cfoutput>
		</cfif>
		
		<label for="username">Логин:</label>
		<cfinput type="text" name="username" id="username" class="placeholder" placeholder="login" required="true" message="Please enter your login">
		<label for="username">Email:</label>
		<cfinput type="text" name="email" id="email" class="placeholder" placeholder="email" required="true" message="Please enter your email">
		<label for="password">Пароль:</label><input type="password" name="password" id="password" class="placeholder" placeholder="password" required="true" message="Please enter your password">
		<input type="submit" value="РЕГИСТРАЦИЯ" name="autSubmit" id="autSubmit">
	</cfform>
	</div>
	
	
</body>
</html>