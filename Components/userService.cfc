<cfcomponent output="false" >
<!---getUserByID() method--->
	<cffunction name="getUserByID" access="public" output="false" returntype="query">
		<cfargument name="userID" type="numeric" required="true" />
		<cfset var rsSingleUser = '' />
		<cfquery  name="rsSingleUser">
		
			select user_id from user
			where user_id =<cfqueryparam value="#arguments.userID#"  />
			
		</cfquery>
		<cfreturn rsSingleUser />
	</cffunction>
</cfcomponent>