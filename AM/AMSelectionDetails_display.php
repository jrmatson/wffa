<?php
require_once 'creds.php';

// Connect to DB and execute query
$db = mysqli_connect($db_hostname, $db_username, $db_password, $db_database) or die ('Error connecting to MySQL server.');
?>

<html>
 <head></head>
 <body>
 <h1>Annual Meeting selection details by Name, Item, Choice</h1>
<table border="0" cellspacing="2" cellpadding="2">
	<tr>	<td><h3>Name</h3></td>
    		<td><h3>Item</h3></td>
    		<td><h3>Choice</h3></td>
    		<td><h3>Qty</h3></td>
    	</tr>
<?php
$query  = "DROP TABLE IF EXISTS amdetails";
mysqli_query($db, $query) or die('Error dropping amdetails.');

$query = "CREATE TABLE amdetails SELECT cc.last_name lname, cc.display_name Name, pf.label Item, pfv.label Choice, cli.qty Qty, pf.weight itemw, pfv.weight choicew
from civicrm_contact cc, civicrm_participant cp,  civicrm_line_item cli, civicrm_price_field pf, civicrm_price_field_value pfv, civicrm_event ce
where cli.entity_table = 'civicrm_participant'
and cli.entity_id = cp.id 
and cp.status_id in (1,14)
and cp.contact_id = cc.id
and cli.price_field_id = pf.id
and cli.price_field_value_id = pfv.id
and cp.event_id = ce.id
and ce.is_active = 1
order by cc.last_name, cc.first_name, pf.weight, pfv.weight";
mysqli_query($db, $query) or die('Error building amdetails table.');

$query = "select Name, Item, Choice, Qty from amdetails order by lname, itemw, choicew";
$result = mysqli_query($db, $query) or die('Error querying database.');

while($row = mysqli_fetch_assoc($result)) {
  echo "<tr>";
  foreach($row as $cell)
  echo "<td>$cell</td>";
  echo "</tr>\n";
  }
mysqli_close($db);
?>

</body>
</html>
