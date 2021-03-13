



<!DOCTYPE html>
<head>
	<meta charset="utf-8">
	<title></title>

	
</head>

<style >
	*{
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
}
body{
    font-family: Helvetica;
    -webkit-font-smoothing: antialiased;
    background: rgba( 71, 147, 227, 1);
}
h2{
    text-align: center;
    font-size: 18px;
    text-transform: uppercase;
    letter-spacing: 1px;
    color: white;
    padding: 30px 0;
}

/* Table Styles */

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

<!---Forms--->

*{    
  box-sizing: border-box;    
}    
    
input[type=text], select, textarea {    
  width: 80%;    
  padding: 12px;    
  border: 1px solid rgb(70, 68, 68);    
  border-radius: 4px;    
  resize: vertical;    
}    
input[type=email], select, textarea {    
  width: 80%;    
  padding: 12px;    
  border: 1px solid rgb(70, 68, 68);    
  border-radius: 4px;    
  resize: vertical;    
}    
    
label {    
  padding: 12px 12px 12px 0;    
  display: inline-block;    
}    
    
input[type=submit] {    
  background-color: f2f2f2;  
  color: white;    
  padding: 30px 30px;
  margin-right:100px;    
  border: none;    
  border-radius: 4px;    
  cursor: pointer;    
  float: right;    
}    
    
input[type=submit]:hover {    
  background-color: #45a049;    
}    
    
.container {    
  border-radius: 5px;    
  background-color: #f2f2f2;    
  padding: 50px;    
}    
    
.col-25 {    
  float: left;    
  width: 25%;    
  margin-top: 6px;    
}    
    
.col-75 {    
  float: left;    
  width: 75%;    
  margin-top: 6px;    
}    
    
/* Clear floats after the columns */    
.row:after {    
  content: "";    
  display: table;    
  clear: both;    
}    


</style>
<body>
	

	<cfinclude template="Components/Header.cfm" >




  <cfquery datasource="mysqBD" name="state">
    		select state from
    		status_login;
    	</cfquery>
    	
          		 <cfif structKeyExists(session,'stLoggedInUser')>
   	
 
 
 <!---Table1--->
 <cfif isDefined('url.task_id')>
		
		<cfquery datasource="mysqBD" name="singleNews">
			select descr, title, time, result, name, task_id,user_id,comment
			from general_info
			inner join result_tb using(result_id)
			inner join user using(user_id)
			where task_id =#url.task_id#
		</cfquery>
		    <cfoutput query="singleNews" >

		
		<div class="table-wrapper">
    <table class="fl-table">
        <thead>
        <tr>
            <th>Номер тикета</th>
            <th>Сотрудник</th>
            <th>Название</th>
            <th>Описание</th>
             <th>Комментарий</th>
             <th>Оценка</th>
            <th>Дата</th>

        </tr>
        </thead>
        <tbody>

        <tr>
            <td>#task_id#</td>
            <td>#name#</td>
            <td> #title#</td>
            <td>#descr#</td>
  			<td>#comment#</td>
  			 <td>#result#</td>
  			 <td>#time#</td>

            
        </tr>
      	
        <tbody>
    </table>
    	        	<cfset redirect="tables2.cfm?change=#singleNews.task_id#"/>

        	<br/>
        	<br/>

			<a href=#redirect#> РЕДАКТИРОВАТЬ </a>

</div>
		    </cfoutput>
<!---Переход на форму с редактированием--->
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
      	<cflocation url="tables2.cfm" >

	</cfif>
                
                   
                   <cfoutput >
                 
<cfform>
 <div class="row">    
      <div class="col-25">    
        <label for="fname">Название</label>    
      </div>    
      <div class="col-75">    
<cfinput name="title_change" id="title_change" value="#qq.title#" required="true" message="Пожалуйста введите название" /> 
     </div>    
    </div> 
    
     
 <div class="row">    
      <div class="col-25">    
        <label for="feed_back">Описание</label>    
      </div>    
      <div class="col-75">
      	<cftextarea name="changeDesc" value="#qq.descr#" id="changeDesc" required="true" message="Пожалуйста введите описание" style="height:200px" ></cftextarea>    
      </div>    
    </div>
       
    <div class="row">    
      <div class="col-25">    
        <label for="feed_back">Оценка</label>    
      </div>    
      <div class="col-75">
      	<cfselect name="changeResult" id="changeResult" query="result" value="result_id" display="result" queryposition="below" required="true" message="Пожалуйста задайте результат" >
			<option value='#result.result_id#'>#result.result#</option>
										</cfselect>

      	 </div>    
    </div>    
    
    
    
    
    <div class="row">    
      <div class="col-25">    
        <label for="feed_back">Комментарий</label>    
      </div>    
      <div class="col-75">
      	<cftextarea name="changeComment" id="changeComment" ></cftextarea>
      	   </div>    
    </div> 
     <div class="row">  
     	<input type="submit" name="changeForm" id="changeForm" value="Update" />  
    </div>    
    			
				<!--- test--->
			
		</cfform>
                   </cfoutput>
	
 
   	<cfelse>
   	
	<cfquery datasource="mysqBD" name="rsAllNews">
		select title, time, descr,task_id, name
		from general_info inner join user using(user_id)
			
		</cfquery>
		
   	
   	


<h2>Список задач</h2>
<div class="table-wrapper">
    <table class="fl-table" id='myTable2'>
        <thead>
        <tr>
            <th >Номер тикета</th>
            <th>Сотрудник</th>
            <th >Название</th>
            <th >Дата</th>
            <th ></th>

        </tr>
        </thead>
        <tbody>
<cfoutput query="rsAllNews" >

        <tr>
            <td>#task_id#</td>
            <td>#name#</td>

            <td> #title#</td>


            <td>#time#</td>
  <td> <a href="tables2.cfm?task_id=#task_id#"> Узнать больше </a>
 </td>
            
        </tr>
      </cfoutput >
      	
        <tbody>
    </table>
</div>



</cfif>	

<!---Конец тега если залогинен--->
<cfelse>
          <img src='https://disgustingmen.com/wp-content/uploads/2019/04/onepunchman-1.png' width="500" height="500"/>
</cfif> 
  
  
  <script>
  
  document.addEventListener('DOMContentLoaded', () => {

    const getSort = ({ target }) => {
        const order = (target.dataset.order = -(target.dataset.order || -1));
        const index = [...target.parentNode.cells].indexOf(target);
        const collator = new Intl.Collator(['en', 'ru'], { numeric: true });
        const comparator = (index, order) => (a, b) => order * collator.compare(
            a.children[index].innerHTML,
            b.children[index].innerHTML
        );
        
        for(const tBody of target.closest('table').tBodies)
            tBody.append(...[...tBody.rows].sort(comparator(index, order)));

        for(const cell of target.parentNode.cells)
            cell.classList.toggle('sorted', cell === target);
    };
    
    document.querySelectorAll('.fl-table thead').forEach(tableTH => tableTH.addEventListener('click', () => getSort(event)));
    
});
  
</script>
  
  
 </body>
 </html>