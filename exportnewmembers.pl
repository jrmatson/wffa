#!/usr/bin/perl -w
use strict;
use lib qw(~/public_html/sites/default/files/civi_custom/perl);
use webdb;
my ($dbh, $sth);
$dbh = webdb::connect ();
$sth = $dbh->prepare(
"SELECT cc.first_name, cc.last_name, cc.id, ce.email
FROM civicrm_contact cc, civicrm_membership cm, 
civicrm_value_wffa_supplement_1 supp, civicrm_email ce
where cm.status_id = 1
and ((supp.drupalized_45 is null) or (supp.drupalized_45 = 0))
and cm.contact_id = cc.id
and supp.entity_id = cc.id
and ce.contact_id = cc.id
and ce.is_primary = 1
into outfile 'civiexport.csv'
lines terminated by '\n'"
);
$sth->execute() or die "SQL Error: $DBI::errstr\n";
$sth = $dbh->prepare(
"update civicrm_value_wffa_supplement_1
set drupalized_45 = 1
where entity_id in
(SELECT cm.contact_id
FROM civicrm_membership cm
, civicrm_value_wffa_supplement_1 supp
where cm.status_id = 1
and ((supp.drupalized_45 is null) or (supp.drupalized_45 = 0))
and cm.contact_id = supp.entity_id)"
);
$sth->execute() or die "SQL Error: $DBI::errstr\n";
$sth->finish ();
$dbh->disconnect ();
exit (0);
