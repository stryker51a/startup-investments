<?php
// If the all the variables are set when the Submit button is clicked...
if (isset($_POST['field_submit'])) {
    // Refer to conn.php file and open a connection.
    require_once("conn.php");
    // Will get the value typed in the form text field and save into variable
    $var_company = $_POST['field_company'];
    // Save the query into variable called $query. Note that :ph_director is a place holder
    $query = "CALL getDegreesFromCompany(:company)";
    $query2 = "CALL getDegreesFromCompany(':company')";
    

try
    {
      // Create a prepared statement. Prepared statements are a way to eliminate SQL INJECTION.
      $prepared_stmt = $dbo->prepare($query);
      // bind the value saved in the variable $var_director to the place holder :ph_director  
      // Use PDO::PARAM_STR to sanitize user string.
      $prepared_stmt->bindValue(':company', $var_company, PDO::PARAM_STR);
      $prepared_stmt->execute();
      // Fetch all the values based on query and save that to variable $result
      $result = $prepared_stmt->fetchAll();

      $new_string = str_replace(":company", $var_company, $query2);

    }
    catch (PDOException $ex)
    { // Error in database processing.
      echo $sql . "<br>" . $error->getMessage(); // HTTP 500 - Internal Server Error
    }
}
?>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
google.charts.load('current', {'packages':['corechart']});
  // Draw the pie chart when Charts is loaded.
  google.charts.setOnLoadCallback(draw_my_chart);
  // Callback that draws the pie chart
  function draw_my_chart() {
     // Create the data table .
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'degree');
    data.addColumn('number', 'Nos');
    for(i = 0; i < my_2d.length; i++)
      data.addRow([my_2d[i][0], parseInt(my_2d[i][1])]);
    // above row adds the JavaScript two dimensional array data into required chart format
    var options = {width:1000,
                  height:600,
                  };
    var options2 = {
    title: 'Distriution of degrees in the company',
    width: 1000,
    height: 600,
    backgroundColor: '#348ceb'
  };

    // Instantiate and draw the chart
    var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
    chart.draw(data, options2);
  }
</script>

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
    
    <h1> Display The Number of Each Type of Degree in a Company</h1>
    <!-- This is the start of the form. This form has one text field and one button.
      See the project.css file to note how form is stylized.-->
    <form method="post">

      <label for="id_company">Company</label>
      <!-- The input type is a text field. Note the name and id. The name attribute
        is referred above on line 7. $var_director = $_POST['field_director']; id attribute is referred in label tag above on line 52-->
      <input type="text" name="field_company" id = "id_company">
      <!-- The input type is a submit button. Note the name and value. The value attribute decides what will be dispalyed on Button. In this case the button shows Submit.
      The name attribute is referred  on line 3 and line 61. -->
      <input type="submit" name="field_submit" value="Submit">
    </form>
    
    <?php
      if (isset($_POST['field_submit'])) {
        // If the query executed (result is true) and the row count returned from the query is greater than 0 then...
        if ($result && $prepared_stmt->rowCount() > 0) { ?>
              <!-- first show the header RESULT -->
              <h2>Results for the number of each degree in <?php echo $_POST['field_company']; ?></h2>
              <!-- Then create a table like structure. See the project.css how table is stylized. -->

              <?Php
                require "conn.php";// Database connection

                if($stmt = $connection->query($new_string)){
                  $php_data_array = Array(); // create PHP array
                  while ($row = $stmt->fetch_row()) {
                    $php_data_array[] = $row; // Adding to array
                  }

                }else{
                  echo $connection->error;
                }
                //print_r( $php_data_array);
                // You can display the json_encode output here. 

                // Transfor PHP array to JavaScript two dimensional array 
                echo "<script>
                        var my_2d = ".json_encode($php_data_array)."
                </script>";
              ?>

              <div id="chart_div"></div>
              <br><br>

                <table>
                <!-- Create the first row of table as table head (thead). -->
                <thead>
                   <!-- The top row is table head with four columns named -- ID, Title ... -->
                  <tr>
                    <th>Degree Count</th>
                    <th>Degree Type</th>
                  </tr>
                </thead>
                 <!-- Create rest of the the body of the table -->
                <tbody>
                   <!-- For each row saved in the $result variable ... -->
                  <?php foreach ($result as $row) { ?>
                
                    <tr>
                       <!-- Print (echo) the value of mID in first column of table -->
                      <td><?php echo $row["degree_type"]; ?></td>
                      <!-- Print (echo) the value of title in second column of table -->
                      <td><?php echo $row["degree_count"]; ?></td>
                      <!-- Print (echo) the value of movieYear in third column of table and so on... -->
                    <!-- End first row. Note this will repeat for each row in the $result variable-->
                    </tr>
                  <?php } ?>
                  <!-- End table body -->
                </tbody>
                <!-- End table -->
            </table>
  
        <?php } else { ?>
          <!-- IF query execution resulted in error display the following message-->
          <h3>Sorry, no results found for the company <?php echo $_POST['field_company']; ?>. </h3>
        <?php }
    } ?>


    
  </body>
</html>






