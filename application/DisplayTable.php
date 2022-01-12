<?php
// If the all the variables are set when the Submit button is clicked...
if (isset($_POST['field_submit'])) {
    // Refer to conn.php file and open a connection.
    require_once("conn.php");
    // Will get the value typed in the form text field and save into variable
    $var_first = $_POST['field_first_name'];
    $var_last = $_POST['field_last_name'];
    // Save the query into variable called $query. Note that :ph_director is a place holder
    $query = "SELECT * FROM people_info 
                    LEFT JOIN relationships_info ON people_info.object_id = relationships_info.person_object_id
                    WHERE LOWER(first_name) = LOWER(:ph_first) 
                      AND LOWER(last_name) = LOWER(:ph_last) 
                    LIMIT 100";

try
    {
      // Create a prepared statement. Prepared statements are a way to eliminate SQL INJECTION.
      $prepared_stmt = $dbo->prepare($query);
      // bind the value saved in the variable $var_director to the place holder :ph_director  
      // Use PDO::PARAM_STR to sanitize user string.
      $prepared_stmt->bindValue(':ph_first', $var_first, PDO::PARAM_STR);
      $prepared_stmt->bindValue(':ph_last', $var_last, PDO::PARAM_STR);
      $prepared_stmt->execute();
      // Fetch all the values based on query and save that to variable $result
      $result = $prepared_stmt->fetchAll();

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
    
    <h1> Display The Person Table</h1>
    <!-- This is the start of the form. This form has one text field and one button.
      See the project.css file to note how form is stylized.-->
    <div class = "container">
      <form method="post">

        <div class = "row">
          <div class="col-25">
            <label for="id_first">First Name:</label>
            </div>
          <!-- The input type is a text field. Note the name and id. The name attribute
          is referred above on line 7. $var_title = $_POST['field_title']; -->
          <div class="col-75">
          <input type="text" name="field_first_name" id = "id_first">
          </div>
        </div>

        <div class = "row">
          <div class="col-25">
          <label for="id_last">Last Name:</label>
            </div>
          <!-- The input type is a text field. Note the name and id. The name attribute
          is referred above on line 7. $var_title = $_POST['field_title']; -->
          <div class="col-75">
          <input type="text" name="field_last_name" id = "id_last">
          </div>
        </div>
        <br>
        <!-- The input type is a submit button. Note the name and value. The value attribute decides what will be dispalyed on Button. In this case the button shows Submit.
        The name attribute is referred  on line 3 and line 61. -->
        <input type="submit" name="field_submit" value="Submit">

      </form>
    </div>
    <?php
      if (isset($_POST['field_submit'])) {
        // If the query executed (result is true) and the row count returned from the query is greater than 0 then...
        if ($result && $prepared_stmt->rowCount() > 0) { ?>
              <!-- first show the header RESULT -->
              <h2>Results for people named <?php echo $_POST['field_first_name']; ?> <?php echo $_POST['field_last_name']; ?></h2>
              <!-- Then create a table like structure. See the project.css how table is stylized. -->

              <div class="table-wrapper">

                <table>
                  <!-- Create the first row of table as table head (thead). -->
                  <thead>
                    <!-- The top row is table head with four columns named -- ID, Title ... -->
                    <tr>
                      <th>First Name</th>
                      <th>Last Name</th>
                      <th>Birhtplace</th>
                      <th>Affiliation Name</th>
                      <th>Job Title</th>
                    </tr>
                  </thead>
                  <!-- Create rest of the the body of the table -->
                  <tbody>
                    <!-- For each row saved in the $result variable ... -->
                    <?php foreach ($result as $row) { ?>
                  
                      <tr>
                        <!-- Print (echo) the value of mID in first column of table -->
                        <td><?php echo $row["first_name"]; ?></td>
                        <!-- Print (echo) the value of title in second column of table -->
                        <td><?php echo $row["last_name"]; ?></td>
                        <!-- Print (echo) the value of movieYear in third column of table and so on... -->
                        <td><?php echo $row["birthplace"]; ?></td>
                        <td><?php echo $row["affiliation_name"]; ?></td>
                        <td><?php echo $row["title"]; ?></td>
                      <!-- End first row. Note this will repeat for each row in the $result variable-->
                      </tr>
                    <?php } ?>
                    <!-- End table body -->
                  </tbody>
                  <!-- End table -->
                </table>
              </div>
  
        <?php } else { ?>
          <!-- IF query execution resulted in error display the following message-->
          <h3>Sorry, no results found for <?php echo $_POST['field_first_name']; ?> <?php echo $_POST['field_last_name']; ?>. </h3>
        <?php }
    } ?>


    
  </body>
</html>






