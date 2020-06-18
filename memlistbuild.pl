#!/usr/bin/perl -w
use strict;
use lib qw(/home/wafarmfo/public_html/sites/default/files/scripts/perl);
use webdb;
my ($dbh, $sth);
$dbh = webdb::connect ();

$dbh->do (qq{Truncate table civicrm_value_member_list_3});

$dbh->do (qq{DROP TRIGGER IF EXISTS civicrm_value_member_list_3_after_delete});

$dbh->do (qq{DROP TRIGGER IF EXISTS civicrm_value_member_list_3_after_insert});

$dbh->do (qq{DROP TRIGGER IF EXISTS civicrm_value_member_list_3_after_update});

$sth = $dbh->prepare (qq{
Insert into civicrm_value_member_list_3 (entity_id, name_30, second_member_31, business_name_44, address_32, city_33, state_34, zip_35, phone_36, second_phone_37, email_38, second_email_39, local_chapter_40, member_type_41, status_42)
Select distinct part13.pri_mem_id id, Pri_member, Sec_member, Biz, Address, City, State, Zip, Primary_phone, Second_phone, Primary_email, Second_email, Local, Member_type, Status 
FROM  
	(select distinct part1.pri_mem_id, Pri_member, Sec_member, Biz, Local, Status, Member_type, Address, City, State, Zip, Primary_phone, Second_phone
		FROM
		(SELECT cc.id pri_mem_id, subsec.pri_mem Pri_member, subsec.sec_mem Sec_member, subsec.Local, subsec.Biz, cms.name Status, cmt.name Member_type
				, ca.street_address Address, ca.city City, csp.abbreviation State, s.zip Zip
		FROM civicrm_contact cc
		, civicrm_address ca
		, civicrm_state_province csp
		, (select contact_id id, concat_ws ('-',postal_code,postal_code_suffix) zip FROM civicrm_address where is_primary=1) s
		, civicrm_membership_status cms
		, civicrm_membership_type cmt
		,		(select distinct sub1.pri_mem_id, sub1.pri_mem, sub2.sec_mem, sub1.status status, sub1.mem_type mem_type, sub1.Local, sub1.Biz
						from
							(SELECT distinct cc.id pri_mem_id, cc.display_name pri_mem, cm.status_id status, cm.membership_type_id mem_type, supp.local_chapter_12 local, supp.business_name_43 Biz
							FROM civicrm_contact cc, civicrm_membership cm, civicrm_value_wffa_supplement_1 supp
							where cc.id = cm.contact_id
							and (cc.contact_type = 'Individual' or cc.contact_type = 'Organization')
							and cc.is_deleted = 0
							and cm.status_id in (1,2,3)
							and cm.membership_type_id in (1,2,3,4,5,6)
							and cm.owner_membership_id is null
							and cc.id = supp.entity_id
							) sub1
						left outer join
							(select cc.id pri_mem_id, secondMem.sec_mem sec_mem
							from civicrm_membership cm, civicrm_contact cc,
									(SELECT distinct cc.id sec_mem_id, cc.display_name sec_mem, cm.owner_membership_id owner_id
									FROM civicrm_contact cc, civicrm_membership cm
									where cc.id = cm.contact_id
									and (cc.contact_type = 'Individual' or cc.contact_type = 'Organization')
									and cc.is_deleted = 0
									and cm.owner_membership_id in
										(SELECT cm.id 
										FROM civicrm_membership cm
										where cm.status_id in (1,2,3)
										and cm.membership_type_id in (1,2,3,4,5,6)
										and cm.owner_membership_id is null)
									) secondMem 
							where cm.id = secondMem.owner_id
							and cm.contact_id = cc.id
							and cc.is_deleted = 0
							) sub2
						on sub2.pri_mem_id = sub1.pri_mem_id
					) subsec
				where cc.id = subsec.pri_mem_id
				and subsec.status = cms.id
				and subsec.mem_type = cmt.id
				and cc.is_deleted = 0
				and cc.id = ca.contact_id
				and ca.is_primary=1
				and ca.state_province_id = csp.id
				and cc.id = s.id
				) part1
			left outer join    
				(SELECT sub.id pri_mem_id, sub.pri_phone Primary_phone, sub.sec_phone Second_phone
				FROM 
					(select distinct sub4.cid id, sub4.pri_phone, sub5.sec_phone from 
						(select id, contact_id cid, phone pri_phone
						from civicrm_phone cp
						where cp.is_primary = 1) sub4
					left outer join 
						(select id, contact_id cid, phone sec_phone
						from civicrm_phone cp
						where cp.is_primary = 0
						and cp.location_type_id = 4) sub5
					on sub5.cid = sub4.cid
					) sub
				) part3
			on part3.pri_mem_id = part1.pri_mem_id
		) part13
left outer join
	(SELECT sub.id pri_mem_id, sub.pri_email Primary_email, sub.sec_email Second_email
		FROM 
		(select distinct sub4.cid id, sub4.pri_email, sub5.sec_email from 
			(select id, contact_id cid, email pri_email
			from civicrm_email cem
			where cem.is_primary = 1) sub4
		left outer join 
			(select distinct id, contact_id cid, email sec_email
			from civicrm_email cem
			where cem.is_primary = 0
			and cem.location_type_id = 4) sub5
		on sub5.cid = sub4.cid
		) sub
	) part4
on part4.pri_mem_id = part13.pri_mem_id
});
$sth->execute();
$sth->finish ();
$dbh->disconnect ();
exit (0);


