package webdb;

use strict;
use DBI;
# Mysql variables
my $host_name = "localhost";
my $db_database = "wafarmfo_civicrm";
my $dsn = "DBI:mysql:host=$host_name;database=$db_database";
# Connect to database using hard coded userid and pwd
sub connect
{
	return (DBI->connect ($dsn, "wafarmfo_civicrm", "treefarm", 
						  {PrintError => 0, RaiseError => 1}));
}

# Connect to Mysql using userid and pwd from current users ~/public_html/drupal/sites/default/files/.my.cnf option file. The
# The mysql_read_default_file option, when added to the DSN, specifies which option file to read.

sub connect_with_option_file
{
	$dsn .= ";mysql_read_default_file=~/public_html/sites/default/files/.my.cnf";
	return (DBI->connect ($dsn, undef, undef, {PrintError => 0, RaiseError => 1}));
}

1;	# return true
