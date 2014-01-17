<html>
  <head>
    <title>Raise Case</title>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <link rel='stylesheet' type='text/css' href='/themes/Sugar5/css/style.css'>
  </head>
  <body>
    <form method="GET" action="processRaiseCase.php">
	  <input name="job" type="hidden" value="<?php echo $_GET['job']?>" />
	  <p><b>Subject:</b></p>
	  <input name="subject" type="text" size="80" /><br />
	  <p><b>Description:</b></p>
	  <textarea cols="80" rows="10" name="description"></textarea>
	  <br /><br />
	  <input name="Submit1" type="submit" value="Submit" />&nbsp;&nbsp;<input name="Reset1" type="reset" value="Reset" />
	  <br />
	</form>
  </body>
</html>
