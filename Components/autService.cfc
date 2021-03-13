<cfcomponent output="false">
<!---Валидация юзера--->
	<cffunction name="validateUser" access="public" output="false" returntype="array">
		<cfargument name="userLogin" type="string" required="true" />
		<cfargument name="userPassword" type="string" required="true" />

<cfset var err=ArrayNew(1)/>
<!---ControllLogo--->
<cfif arguments.userLogin EQ '' >
	<cfset arrayAppend(err,'Введите логин')>
</cfif>
<!---ControllPassw--->

<cfif arguments.userPassword EQ '' >
	<cfset arrayAppend(err,'Введите пароль')>
</cfif>


<cfreturn err />

	</cffunction>
<!---LoginMethod--->

	<cffunction name="doLogin" access="public" output="false" returntype="boolean">
		<cfargument name="userLogin" type="string" required="true" />
		<cfargument name="userPassword" type="string" required="true" />
<!---Когда юзер еще не залогинен--->
<cfset var isUserLoggedIn =false />
<!---GetDataFromDB--->
<cfquery name="loginUser" datasource="mysqBD" >
	select name, password, role, user_id from user
where name='#form.username#' and password='#form.password#';
</cfquery >

<cfif loginUser.recordCount EQ 1  >
	  <cflogin >
	  		<cfloginuser name="#loginUser.name#" password="#loginUser.password#" roles="#loginUser.role#" >
	  </cflogin>
	<cfset session.stLoggedInUser ={'login'= loginUser.name, 'userID'= loginUser.user_id} />  
	<!---ChangeState--->
	<cfset var isUserLoggedIn =true />

</cfif>

<cfreturn isUserLoggedIn />
	</cffunction>
<!---LogoutMethod--->

	<cffunction name="doLogout" access="public" output="false" returntype="void">
		
		<!---DeleteData--->

			<cfset structDelete(session,'stLoggedInUser')>
	<cflogout  />
	</cffunction>

</cfcomponent>