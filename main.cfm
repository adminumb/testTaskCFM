<!---Get page content for fld_pageID = 4--->

  

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HD Street Concert Band - Come play with us</title>
<link href="/cfTraining/styles/hdStreet.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="/cfTraining/script/jquery.js"></script>
<script type="text/javascript" src="/cfTraining/script/menu.js"></script>
</head>

<body>
<div id="wrapper">
  <div id="header"> <a href="#"><img src="/cfTraining/images/logo.png" alt="logo" name="logo" width="188" height="181" id="logo" /></a>
    <p id="mainTitle"><img src="/cfTraining/images/mainTitle.png" width="398" height="158" alt="HD Street Concert Band" /><span>HD Street Concert Band</span></p>
<ul>
       	<li><a href="siteMap.html">Site Map</a></li>
        <li><a href="contactUs.html">Contact us</a></li>
    </ul>
  </div>
  <div id="menu">
    <ul>
      <li><a href="index.html">Home</a></li>
      <li><a href="agenda.html">Agenda</a></li>
      <li><a href="#">The Band</a>
        <ul>
          <li><a href="director.html">The director</a></li>
          <li><a href="history.html">The band History</a></li>
        </ul>
      </li>
      <li><a href="wePlayForYou.html">We play for You</a></li>
      <li><a href="comePlayWithUs.html">Come play with us</a></li>
      <li><a href="news.html">News</a></li>
    </ul>
  </div>
  <div id="pageBody">
  	<div id="calendarContent">
    <!---Erase from here--->
    <h1>Come play with us</h1>
<p><img src="images/homeImage.jpg" alt="the band playin" width="300" height="201" class="floatLeft" />You are a musician and want to come play with us? Read on... all the information you need is on this page.</p>
<h2>What level?</h2>
<p>A band certainly is one of the bast place to learn how to play music. As such, we welcome anyone interested in playing music with us. Of course it is required to be able to read musical notation and have some practice with your instruments.</p>
<p>If you feel ready, if you're up to it, we'll be more than happy to welcome you in the band. There certainly is a spot on the stage for everyone.</p>
    <h2>What instruments?</h2>
    <p>A band like ours include brass instruments, woodwind instrumants and some percussion. We need no strings except for a bass guitar and a harp for some pieces. Here is a list of instruments we are currently looking for. If you are not sure about the instrument you play, please contact us.</p>
    <h3>Brass</h3>
    <ul>
      <li>Trumpet - Trombone - Horn - Tuba</li>
    </ul>
    <h3>Woodwind</h3>
    <ul>
      <li>Saxophone - Clarinet - Oboe - English Horn - Flute</li>
    </ul>
    <h3>Percussion</h3>
    <ul>
      <li>Drums - Timpani - Xylophone - Vibraphone</li>
    </ul>
    <h2>About the rehersals</h2>
    <p>We rehearse once a week on Wednesay nights from 8:00pm till 10:00pm at the Baton Rouge High school. Sometimes, we add extra-rehearsals and dress-rehearsals as required by the concert schedule.</p>
    <h2>Contact us</h2>
    <p>If you want to play with us, please feel free to contact us by e-mail <a href="mailto:info@hdstreetband.com">info@hdstreetband.com</a></p>
    <p>&nbsp;</p>
    <!---To here--->
	</div>
	<div id="calendarSideBar">
		<h2>Complete the form below to join our band</h2>
		<cfform id="frm_newUser">
				<fieldset>
					<legend>Join our band</legend>
					<dl>
						<dt><label>First Name</label></dt>
						<dd><cfinput type="text" name="fld_userFirstName" id="fld_userFirstName" required="true" message="Enter name" /></dd>
						<dt><label>Last Name</label></dt>
						<dd><cfinput type="text" name="fld_userLastName" id="fld_userLastName" required="true" message="Enter lastNmae"  /></dd>
						<dt><label>E-mail Address</label></dt>
						<dd><cfinput  type="text" name="fld_userEmail" id="fld_userEmail" validate="eMail" required="true" message="Enter valid email" /></dd>
						<dt><label>Type case</label></dt>
						<dd>
							<select name="fld_userInstrument" id="fld_userInstrument" >
								<option value="0">Please choose your instrument</option>
								<option value="1">Flute</option>
								<option value="1">Oboe</option>
								<option value="3">Clarinet</option>
								<option value="4">Saxophone</option>
								<option value="5">Trumpet</option>
								<option value="6">Trombone</option>
								<option value="7">Tuba</option>
								<option value="8">String bass</option>
								<option value="9">Harp</option>
								<option value="10">Percussion</option>
								<option value="11">Other</option>
							</select>
						</dd>
						<dt><label>Comment</label></dt>
						<dd><textarea name="fld_userComment" id="fld_userComment"></textarea></dd>
					</dl>
					<input type="submit" name="fld_newUserSubmit" id="fld_newUserSubmit" value="Join the band" />
				</fieldset>
			</cfform>
	</div>
	</div>
 </div>
  <div id="footer">
    <p>&copy; Copyright 2011 - HD Street Concert Band</p>
  </div>
</div>
</body>
</html>
