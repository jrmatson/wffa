#!/usr/bin/perl -w
use strict;
use lib qw(/home/wafarmfo/public_html/sites/default/files/scripts/perl);
use webdb;

my ($dbh, $sth);
$dbh = webdb::connect ();
$sth = $dbh->prepare(
"update civicrm_contact
set addressee_id = null
where id in
(SELECT contact_id  
FROM civicrm_address 
where master_id is null)
and addressee_id is not null"
);
$sth->execute() or die "SQL Error: $DBI::errstr\n";
$sth->finish ();
$dbh->disconnect ();
exit (0);
