<?php
require_once 'creds.php';
require '/home/wafarmfo/public_html/sites/all/libraries/PHPMailer/PHPMailerAutoload.php';

// Connect to DB and execute query
$db = mysqli_connect($db_hostname, $db_username, $db_password, $db_database) or die ('Error connecting to MySQL server.');

$query  = "DROP TABLE IF EXISTS amtotals";
mysqli_query($db, $query) or die('Error dropping amtotals.');

$query = "CREATE TABLE amtotals select pf.label Item, cli.label Choice, sum(ROUND(cli.qty)) Headcount
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
mysqli_close($db);

// Remove the existing file
$filename = 'amtotals.csv';
if (file_exists($filename)) {
    unlink($filename);
}

// Export the new file into desired format
exec ("mysql --defaults-file=creds2.cfg -B -e 'SELECT Item, Choice, Headcount FROM amtotals order by Item, Choice' > amtotals.csv");

// send mail with result attached
$mail = new PHPMailer;
//
//$mail->isSMTP();                                         // Set mailer to use SMTP
$mail->Host = 'mail.wafarmforestry.com;smtp.gmail.com';  // Specify main and backup SMTP servers
$mail->SMTPAuth = true;                                  // Enable SMTP authentication
$mail->Username = 'webmaster@wafarmforestry.com';             // SMTP username
$mail->Password = 'dougFir2015';                         // SMTP password
//$mail->SMTPSecure = 'tls';                            // Enable encryption, 'ssl' also accepted

$mail->From = 'info@wafarmforestry.com';
$mail->FromName = 'CiviCRM';
//$mail->addAddress('loucksd@localaccess.com');     // Add a recipient
$mail->addAddress('info@wafarmforestry.com');     // Add a recipient
//$mail->addAddress('jrmatson@wafarmforestry.com');     // Add a recipient
//$mail->addCC('cc@example.com');
//$mail->addBCC('bcc@example.com');

$mail->WordWrap = 50;                                 // Set word wrap to 50 characters
$mail->addAttachment('amtotals.csv');         // Add attachments
//$mail->isHTML(true);                                  // Set email format to HTML

$mail->Subject = 'The latest AM sign up totals';
$mail->Body    = 'Attached please find the current totals.';
//$mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

if(!$mail->send()) {
    echo 'Message could not be sent.';
    echo 'Mailer Error: ' . $mail->ErrorInfo;
} else {
    echo '******************************************************************************'
    echo 'The message has been sent. Please hit the BACK arrow to return to the web site';
    echo '******************************************************************************'
}

?>
