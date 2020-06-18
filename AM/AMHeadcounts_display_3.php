<?php
require_once 'creds.php';

// Connect to DB and execute query
//$db = mysqli_connect($db_hostname, $db_username, $db_password, $db_database) or die ('Error connecting to MySQL server.');
?>

<html>
 <head></head>
 <body>
 <h1>Annual Meeting Headcount Totals</h1>
<table border="0" cellspacing="2" cellpadding="2">
	<tr>	<td><h3>Item</h3></td>
    		<td><h3>Choice</h3></td>
    		<td><h3>Headcount</h3></td>
	</tr>
<?php
$db = mysqli_connect($db_hostname, $db_username, $db_password, $db_database) or die ('Error connecting to MySQL server.');
$query  = "DROP TABLE IF EXISTS amtotals";
mysqli_query($db, $query) or die('Error dropping amtotals.');

$query = "CREATE TABLE amtotals select pf.label Item, pf.weight itemw, cli.label Choice, pfv.weight choicew, sum(ROUND(cli.qty)) Headcount
FROM civicrm_participant cp, civicrm_line_item cli, civicrm_price_field pf, civicrm_event ce, civicrm_price_field_value pfv
where cli.entity_table = 'civicrm_participant'
and cli.entity_id = cp.id
and cli.price_field_id = pf.id
and cli.price_field_value_id = pfv.id
and cp.status_id in (1,14)
and cp.event_id = ce.id
and ce.is_active = 1
group by pf.label, cli.label
order by pf.weight, pfv.weight";
mysqli_query($db, $query) or die('Error building amtotals table.');
//mysqli_multi_query($db, $query) or die('Error building amtotals table.');
//mysqli_close($db);   Open a new connection and retreive data for display


$query = "SELECT Item, Choice, Headcount FROM amtotals order by itemw, choicew";
$result = mysqli_query($db, $query) or die('Error querying database.');
$row = mysqli_fetch_array($result);


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
