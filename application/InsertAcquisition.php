<?php
// If the all the variables are set when the Submit button is clicked...
if (isset($_POST['field_submit'])) {
    // It will refer to conn.php file and will open a connection.
    require_once("conn.php");
    // Will get the value typed in the form text field and save into variable
    $var_buyer = $_POST['field_buyer'];
    $var_acquired = $_POST['field_acquired'];
    $var_amount = $_POST['field_amount'];
    // Save the query into variable called $query. NOte that :title is a place holder
    $query = "CALL add_aquisition(:buyer, :acquired, :amount)";
    
    try
    {
      $prepared_stmt = $dbo->prepare($query);
      //bind the value saved in the variable $var_title to the place holder :title after 
      //verifying (using PDO::PARAM_STR) that the user has typed a valid string.
      $prepared_stmt->bindValue(':buyer', $var_buyer, PDO::PARAM_STR);
      $prepared_stmt->bindValue(':acquired', $var_acquired, PDO::PARAM_STR);
      $prepared_stmt->bindValue(':amount', $var_amount, PDO::PARAM_STR);
      //Execute the query and save the result in variable named $result
      $result = $prepared_stmt->execute();

      $result2 = $prepared_stmt->fetchAll();
      
    }
    catch (PDOException $ex)
    { // Error in database processing.
      echo $sql . "<br>" . $error->getMessage(); // HTTP 500 - Internal Server Error
    }
}

?>

<html>
  <!-- Any thing inside the HEAD tags are not visible on page.-->
  <head>
    <!-- THe following is the stylesheet file. The CSS file decides look and feel -->
    <link rel="stylesheet" type="text/css" href="project.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  </head> 

  <!-- Everything inside the BODY tags are visible on page.-->
  <body>
     <!-- See the project.css file to see how is navbar stylized.-->
     <div id="navbar">
			<ul>
				<li><a href="index.html">Home</a></li>

				<li><div class = "dropdown">
					<button class="dropbtn"> Display
					  <i class="fa fa-caret-down"></i>
					</button>
					<div class="dropdown-content">
					  <a href="DisplayTable.php">Person Data</a>
					  <a href="DisplayDegreeView.php">Company Degrees</a>
					  <a href="DisplayFundingByCategory.php">Category Funding</a>
					</div>
				<li><div class = "dropdown">
				  <button class="dropbtn"> Create
					<i class="fa fa-caret-down"></i>
				  </button>
				  <div class="dropdown-content">
					<a href="InsertAcquisition.php">Acquisition</a>
					<a href="InsertPerson.php">Person</a>
				  </div>
				<li><div class = "dropdown">
					<button class="dropbtn"> Delete
					  <i class="fa fa-caret-down"></i>
					</button>
					<div class="dropdown-content">
					  <a href="DeletePerson.php">Person</a>
					</div>
				  </li>
				</li>
			  </ul>
		  </div>
    <!-- See the project.css file to note h1 (Heading 1) is stylized.-->
    <h1> Which company has acquired another one? </h1>
    <!-- This is the start of the form. This form has one text field and one button.
      See the project.css file to note how form is stylized.-->
    <div class = "container">
      <form method="post">

        <div class = "row">
          <div class="col-25">
            <label for="id_buyer">Acquiring Company:</label>
            </div>
          <!-- The input type is a text field. Note the name and id. The name attribute
          is referred above on line 7. $var_title = $_POST['field_title']; -->
          <div class="col-75">
            <input type="text" name="field_buyer" id="id_buyer">
          </div>
        </div>


        <div class = "row">
          <div class="col-25">
            <label for="id_acquired">Company being acquired</label>
          </div>
          <!-- The input type is a text field. Note the name and id. The name attribute
          is referred above on line 7. $var_title = $_POST['field_title']; -->
          <div class="col-75">
            <input type="text" name="field_acquired" id= "id_acquired">
          </div>
        </div>

        <div class = "row">
          <div class="col-25">
            <label for="id_amount">Amount in USD of Acquisition</label>
          </div>
          <!-- The input type is a text field. Note the name and id. The name attribute
          is referred above on line 7. $var_title = $_POST['field_title']; -->
          <div class="col-75">
            <input type="text" name="field_amount" id= "id_amount">
          </div>
        </div>

        <!-- The input type is a submit button. Note the name and value. The value attribute decides what will be dispalyed on Button. In this case the button shows Delete Movie.
        The name attribute is referred above on line 3 and line 63. -->
        <input type="submit" name="field_submit" value="Update">
      </form>
    </div>

    <?php
      if (isset($_POST['field_submit'])) {
        if ($result && $result2[0][0] != 0) { 
    ?>
          Acquisition was updated successfully.
    <?php 
        } else { 
    ?>
          <h3> Sorry, there was an error. Acquisition data was not updated. </h3>
    <?php 
        }
      } 
    ?>

    
  </body>
</html>


