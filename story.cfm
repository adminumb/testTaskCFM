<!DOCTYPE html>
<head>
	<meta charset="utf-8">
	<title>Login Form</title>
	<link rel="icon" href="http://vladmaxi.net/favicon.ico" type="image/x-icon">
	<link rel="shortcut icon" href="http://vladmaxi.net/favicon.ico" type="image/x-icon">
	
	
</head>
<style >
.table-wrapper{
    margin: 10px 70px 70px;
    box-shadow: 0px 35px 50px rgba( 0, 0, 0, 0.2 );
}

.fl-table {
    border-radius: 5px;
    font-size: 12px;
    font-weight: normal;
    border: none;
    border-collapse: collapse;
    width: 100%;
    max-width: 100%;
    white-space: nowrap;
    background-color: white;
}

.fl-table td, .fl-table th {
    text-align: center;
    padding: 8px;
}

.fl-table td {
    border-right: 1px solid #f8f8f8;
    font-size: 12px;
}

.fl-table thead th {
    color: #ffffff;
    background: #4FC3A1;
}


.fl-table thead th:nth-child(odd) {
    color: #ffffff;
    background: #324960;
}

.fl-table tr:nth-child(even) {
    background: #F8F8F8;
}
</style>
<body>
	
	<cfinclude template="Components/Header.cfm" >
          		 <cfif structKeyExists(session,'stLoggedInUser')>

<cfquery datasource="mysqBD" name="story" >
	select task_id,title,result,time
	from general_info inner join result_tb using(result_id)
	where user_id='#session.stLoggedInUser.userID#'
</cfquery>
<cfoutput query='story' >
			<div class="table-wrapper">
    <table class="fl-table">
        <thead>
        <tr>
            <th>Номер тикета</th>
            <th>Название</th>
             <th>Оценка</th>
            <th>Дата</th>

        </tr>
        </thead>
        <tbody>

        <tr>
            <td>#task_id#</td>
            <td> #title#</td>
  			 <td>#result#</td>
  			 <td>#time#</td>

            
        </tr>
      	
        <tbody>
    </table>
    </div>
</cfoutput>

          		 </cfif>



	
</body>
</html>