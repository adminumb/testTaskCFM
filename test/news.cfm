<!---Get news years--->
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>TASKS</title>

</head>

<style >
	textarea{
		width:500px;
		height:300px;
	}
table {
font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
font-size: 14px;
text-align: left;
border-collapse: collapse;
border-radius: 20px;
box-shadow: 0 0 0 10px #F2906B;
color: #452F21;

}
th {
padding: 10px 8px;
background: white;
}
table th:first-child {
border-top-left-radius: 20px;
}
table th:last-child {
border-top-right-radius: 20px;
}
td {
border-top: 10px solid #F2906B;
padding: 8px;
background: white;

}

table td:first-child {
border-bottom-left-radius: 20px;
}
table td:last-child {
border-bottom-right-radius: 20px;
}
</style>

<body>
	<cfinclude template="Components/Header.cfm" >

  <cfquery datasource="mysqBD" name="state">
    		select state from
    		status_login;
    	</cfquery>
  
  
  <div id="wrapper">

  <div id="pageBody">
    <div id="calendarContent">
<!---Chapter 4 - Erase from here--->

         		 <cfif structKeyExists(session,'stLoggedInUser')>


	<cfif isDefined('url.newsID')>
		
		<cfquery datasource="mysqBD" name="singleNews">
			select descr, title, time, result, name, task_id,user_id
			from general_info
			inner join result_tb using(result_id)
			inner join user using(user_id)
			where task_id =#url.newsID#
		</cfquery>
		
		
		<cfoutput >
		         <h2>
		         	YOUR TICKET
		         </h2>
			<table  >
				<tr>
					<th >НАЗВАНИЕ</th>
					<th >#singleNews.title#</th>

				</tr>
				<tr>
					<th >ID</th>
					<th >crm#singleNews.task_id#</th>

				</tr>
					<tr>
					<th >СОТРУДНИК</th>
					<th >#singleNews.name#</th>

				</tr>
						<tr>
					<th >ДАТА ТИКЕТА</th>
					<th >#dateFormat(singleNews.time, 'mmm, dd,yyy')#</th>

				</tr>
				<tr>
					<th >ОПИСАНИЕ</th>
					<th >РЕЗУЛЬТАТ</th>

				</tr>
				
				<tr>
					<td >#singleNews.descr#</td>
					<td>#singleNews.result#</td>
				</tr>
			</table>
			<br>
			
			
					 <cfif structKeyExists(session,'stLoggedInUser')>

			
    	<cfset redirect="news.cfm?change=#singleNews.task_id#"/>
    </cfif>
    
   
			
			
			<a href=#redirect#> РЕДАКТИРОВАТЬ </a>

		</cfoutput>
		
		
		
		
				<cfelseif isDefined('url.change') >
				
					<cfquery datasource="mysqBD" name="qq">
			select descr, title, time, result, name, task_id,result_id
			from general_info
			inner join result_tb using(result_id)
			inner join user using(user_id)
			where task_id =#url.change#
		</cfquery>
		<cfquery datasource="mysqBD" name="result">
			select result, result_id from result_tb
		</cfquery>
                   
                   <!--- Валидация на форму--->

<cfif structKeyExists(form, 'changeForm')>
	 <cfset changeErr=Arraynew(1)/>
	 	<!--- Валидация имени--->
	<cfif form.title_change EQ ''>
    	<cfset arrayAppend(changeErr, 'Пожалуйста задайте название')/>
    </cfif> 	
	 	
    
    <cfif form.changeDesc EQ ''>
    	<cfset arrayAppend(changeErr, 'Задайте последовательность теста')/>
    </cfif>
    
    <cfif form.changeResult EQ '0'>
    	<cfset arrayAppend(changeErr, 'Установите результат теста ')/>
    </cfif>
    
      <cfif isDefined('changeErr') AND NOT ArrayisEmpty(changeErr)>
			<cfoutput>
				<cfloop array="#changeErr#" index="message">
					<p class="errorMessage">#message#</p>
				</cfloop>
			</cfoutput>
		</cfif> 
   
   
   	<cfquery datasource='mysqBD'>
    		
    		update general_info
    		set comment='#form.changeComment#', title='#form.title_change#', descr='#form.changeDesc#',
    		 result_id='#form.changeResult#' where task_id=    <cfqueryparam value='#qq.task_id#' cfsqltype='cf_sql_integer' > ;
    		</cfquery>
      	<cflocation url="news.cfm" >

	</cfif>
                
                   
                   <cfoutput >
                 
<cfform id="frm_editUser">
			<fieldset>
				<legend>Your ticket</legend>
			
				
				<dl>
					<dt><label >НАЗВАНИЕ</label></dt>
					<dd><cfinput name="title_change" id="title_change" value="#qq.title#" required="true" message="Пожалуйста введите название" /></dd>
					<dt><label for="fld_userLastName">ОПИСАНИЕ</label></dt>
					<dd><cftextarea name="changeDesc" value="#qq.descr#" id="changeDesc" required="true" message="Пожалуйста введите описание" ></cftextarea></dd>

					<dt><label >РЕЗУЛЬТАТ</label></dt>
					<dd>
							<cfselect name="changeResult" id="changeResult" query="result" value="result_id" display="result" queryposition="below" required="true" message="Пожалуйста задайте результат" >
								<option value='#result.result_id#'>#result.result#</option>
								
							</cfselect>
						</dd>
					<dd>
						
					</dd>
					<!---Comment Textarea--->
					<dt><label for="fld_userComment">Comment</label></dt>
					<dd><cftextarea name="changeComment" id="changeComment" ></cftextarea></dd>
				</dl>
				<!---Submit button--->
				<input type="submit" name="changeForm" id="changeForm" value="Update" />
			</fieldset>
		</cfform>
                   </cfoutput>
		
		<cfelseif isDefined('url.task_id_current_user') >
		
	
		   	<cfquery datasource="mysqBD" name="yearPage">
			select descr, title, time
			from general_info
			inner join result_tb using(result_id)
				where task_id=#url.task_id_current_user#

		</cfquery>
		
		
		   <h1>
		   	Список задач за
		   	  выбранную дату
		   </h1>
		

		   <table >
	
<cfoutput query="yearPage" >

	 <tr>
	 	<td >
	 		#dateFormat(time, 'mmm dd yyyy')# 
	 	</td>
	 	<td >
	 		#title# 
	 	</td>
	 	<td >
	 		#descr#
	 	</td>
	 </tr>
</cfoutput>


</table>
		<cfelse>

	<cfquery datasource="mysqBD" name="rsAllNews">
		select title, time, descr,task_id
		from general_info
			
		</cfquery>
		
      <table id='myTable2'>
      	<tr>
				<th onclick="sortTable(0)">
					Дата создания
				</th>
				<th onclick="sortTable(1)">
					Заголовок
				</th>
			</tr>
		<cfoutput query="rsAllNews" >
			
			<tr>
				<td >
					#time#
				</td>
				<td >
					#title#
				</td>
				<td >
					<a href="news.cfm?newsID=#task_id#"> Узнать больше </a>
						
					</a>
				</td>
			</tr>
			
		</cfoutput>
		

	
		<h1>Список задач</h1>
		<br/>
      </table>	
    </cfif>
      <!---Отображение списка--->
</div>




    <div id="calendarSideBar">
<h1> Ваша история задач</h1>

<cfquery datasource="mysqBD" name="news">
         select time, task_id,title,result 
         from general_info
         inner join result_tb using(result_id)
         where user_id=	'#session.stLoggedInUser.userID#'

</cfquery>
<table >
	
<cfoutput query="news" >
	<cfset task_id_current_user=#task_id#>

	    <tr>
	    	<td >
	    		<a href="news.cfm?task_id_current_user=#task_id_current_user#">
	    			#dateFormat(time, 'mmm dd yyyy')#
	    		</a>
	    	</td>
	    		<td >
	    		"#news.title#"
	    	</td>
	    	<td >
	    		"#news.result#"
	    	</td>
	    </tr>
</cfoutput>
</table>
    
      <p class="alignRight">&nbsp;</p>
</div>
  </div>
  <div id="footer">
    <p>&copy; My todo list</p>
  </div>
</div>

<cfelse>
          <img src='https://disgustingmen.com/wp-content/uploads/2019/04/onepunchman-1.png' width="500" height="500"/>
</cfif>

<script>
function sortTable(n) {
  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
  table = document.getElementById("myTable2");
  switching = true;
  dir = "asc";
  
  while (switching) {
    // Start by saying: no switching is done:
    switching = false;
    rows = table.getElementsByTagName("TR");
   
    for (i = 1; i < (rows.length - 1); i++) {
      // Start by saying there should be no switching:
      shouldSwitch = false;
      /* Get the two elements you want to compare,
      one from current row and one from the next: */
      x = rows[i].getElementsByTagName("TD")[n];
      y = rows[i + 1].getElementsByTagName("TD")[n];
      /* Check if the two rows should switch place,
      based on the direction, asc or desc: */
      if (dir == "asc") {
        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
          // If so, mark as a switch and break the loop:
          shouldSwitch = true;
          break;
        }
      } else if (dir == "desc") {
        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
          // If so, mark as a switch and break the loop:
          shouldSwitch = true;
          break;
        }
      }
    }
    if (shouldSwitch) {
      /* If a switch has been marked, make the switch
      and mark that a switch has been done: */
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
      // Each time a switch is done, increase this count by 1:
      switchcount ++;
    } else {
      /* If no switching has been done AND the direction is "asc",
      set the direction to "desc" and run the while loop again. */
      if (switchcount == 0 && dir == "asc") {
        dir = "desc";
        switching = true;
      }
    }
  }
}
</script>

</body>
</html>
