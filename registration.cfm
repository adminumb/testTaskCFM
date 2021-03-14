
<!--- Валидация на форму--->

<cfif structKeyExists(form, 'fld_newUserSubmit')>
	 <cfset aErrorMessages=Arraynew(1)/>
	 	<!--- Валидация имени--->
		
	 	
  <cfif form.title EQ '' or form.userDesc EQ '' or form.resultList EQ '0' or form.statusList EQ '0'
  or  form.criticalList EQ '0' or form.urgencyList EQ '0' >
    	<cfset arrayAppend(aErrorMessages, 'Заполните все обязательные поля!')/>
    </cfif>
  
  
   
    
     <cfif ArrayisEmpty(aErrorMessages)  >
    	<!---Если все ок тада --->	
	
    	    	<cfquery datasource='mysqBD'>

    	
    		
    		insert into general_info(status_id,result_id, descr, comment,user_id, title, critical_id,urgency_id) values(
    		'#form.statusList#','#form.resultList#','#form.userDesc#','#form.userComment#',#session.stLoggedInUser.userID#,'#form.title#',
    		'#form.criticalList#','#form.urgencyList#')
    
    		</cfquery>
    		
    		
    </cfif>
</cfif>

  <cfquery datasource="mysqBD" name="resultTable">
  	select result_id, result from
  	result_tb
  	order by result asc
  	

  	
  </cfquery>
  
   <cfquery datasource="mysqBD" name="statusTable">
  	select status_id, status from
  	status_tb
  	order by status asc
  	

  	
  </cfquery>
  
  <cfquery datasource="mysqBD" name="criticalTable">
  	select critical_id, critical from
  	critical
  	order by critical asc
  	

  	
  </cfquery>
  
   <cfquery datasource="mysqBD" name="urgencyTable">
  	select urgency_id, urgency from
  	urgency
  	order by urgency asc
  	

  	
  </cfquery>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>NewTask</title>



</head>

<style >
	

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
  background-color:f2f2f2;   
  color: white;    
  padding: 30px 40px;   
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
  padding: 20px;    
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

.errorMessage{
	color:red;
	font-weight:bold;
}    
</style>

<body>
	
	
		<cfinclude template="Components/Header.cfm" >

	
         		 <cfif structKeyExists(session,'stLoggedInUser')>


	<div class="formContainer" id="calendarSideBar">
		
		<cfif isDefined('aErrorMessages') AND NOT ArrayisEmpty(aErrorMessages)>
			<cfoutput>
				<cfloop array="#aErrorMessages#" index="message">
					<p class="errorMessage">#message#</p>
				</cfloop>
			</cfoutput>
		</cfif>
		
		
								<cfoutput> 		
									
	<cfform>

 <div class="row">    
      <div class="col-25">    
        <label for="fname" >Название*</label>    

      </div>    
      <div class="col-75">    
<cfinput name="title" id="title"  /> 
     </div>    
    </div> 
    
     
 <div class="row">    
      <div class="col-25">    
        <label for="feed_back">Описание*</label>    
      </div>    
      <div class="col-75">
      	<cftextarea name="userDesc"  id="userDesc" required="true"  style="height:200px" ></cftextarea>    
      </div>    
    </div>
    
    
      <div class="row">    
      <div class="col-25">    
        <label for="feed_back">Комментарий</label>    
      </div>    
      <div class="col-75">
      	<cftextarea name="userComment" id="userComment" ></cftextarea>
      	   </div>    
    </div> 
    
       
        <div class="row">    
      <div class="col-25">    
        <label for="feed_back">Статус*</label>    
      </div>    
      <div class="col-75">
      	<cfselect name="statusList" id="statusID" query="statusTable" value="status_id" display="status" queryposition="below" >
								<option value="0">Choose status</option>
								
							</cfselect>

      	 </div>    
    </div>  
       
       
       
    <div class="row">    
      <div class="col-25">    
        <label for="feed_back">Оценка*</label>    
      </div>    
      <div class="col-75">
      	<cfselect name="resultList" id="resultID" query="resultTable" value="result_id" display="result" queryposition="below" >
								<option value="0">Choose result</option>
								
							</cfselect>

      	 </div>    
    </div>
     
      <div class="row">    
      <div class="col-25">    
        <label for="feed_back">Критичность*</label>    
      </div>    
      <div class="col-75">
      	<cfselect name="criticalList" id="criticalID" query="criticalTable" value="critical_id" display="critical" queryposition="below" >
								<option value="0">Choose critical</option>
								
							</cfselect>

      	 </div>    
    </div> 
    
     <div class="row">    
      <div class="col-25">    
        <label for="feed_back">Срочность*</label>    
      </div>    
      <div class="col-75">
      	<cfselect name="urgencyList" id="urgencyID" query="urgencyTable" value="urgency_id" display="urgency" queryposition="below" >
								<option value="0">Choose urgency</option>
								
							</cfselect>

      	 </div>    
    </div>    
    
    
    
    
  
     <div class="row">  
					<input type="submit" name="fld_newUserSubmit" id="fld_newUserSubmit" value="ГОТОВО" />
    </div>    
    			
				<!--- test--->
			
		</cfform>								
									
									
									
									

											</cfoutput>

  <div id="footer">
    <p>&copy; </p>
  </div>
  
  
<cfelse> 
	<img src="https://avatars.mds.yandex.net/get-zen_doc/3417386/pub_5ecd3521d235bb4423efe30f_5ecd366faa9a620e538be588/scale_1200">
</cfif>

</body>
</html>



