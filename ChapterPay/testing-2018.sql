/* the following queries populate a table that has counts for people who joined a particular chapter as an additional to their primary chapter. */
/* This must be run before the report query that follows it below */ 
/* The join to the civicrm_value_trial_2 table only returns results for people who joined additional chapters */
/* Each total is subtracted by 4 to account for ExecDir, Exec Admin, Political, and Pres that are added to each chapter as an additionals to support their work with */
/* the chapters  */
/*  The comments in the Clark section below apply to each subsequent section as well */
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "Clark" as chapter, (count(distinct cvt.entity_id)-3) cnt 
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where cm.contact_id = cvt.entity_id
and cvt.clark_14 = 1
and cm.membership_type_id in (1,2,3,4,5) 				/* GenMem A,B,C or Assoc */
and cm.status_id in (1,2) 							/* Status is New or Current */
and cvt.entity_id != 1
and cm.owner_membership_id is NULL					/* this field is null if the member is the primary on the account, which we want */
) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "Clark"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "Cowlitz" as chapter, (count(distinct cvt.entity_id)-3) cnt
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where cm.contact_id = cvt.entity_id
and cvt.cowlitz_15 = 1
and cm.membership_type_id in (1,2,3,4,5) 
and cm.status_id in (1,2) 
and cvt.entity_id != 1
and cm.owner_membership_id is NULL
) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "Cowlitz"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "Grays Harbor" as chapter, (count(distinct cvt.entity_id)-3) cnt 
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where cm.contact_id = cvt.entity_id
and cvt.grays_harbor_16 = 1
and cm.membership_type_id in (1,2,3,4,5) 
and cm.status_id in (1,2) 
and cvt.entity_id != 1
and cm.owner_membership_id is NULL
) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "Grays Harbor"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "Kittitas" as chapter, (count(distinct cvt.entity_id)-3) cnt
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where cm.contact_id = cvt.entity_id
and cvt.kittitas_17 = 1
and cm.membership_type_id in (1,2,3,4,5) 
and cm.status_id in (1,2) 
and cvt.entity_id != 1
and cm.owner_membership_id is NULL
) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "Kittitas"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "Lewis" as chapter, (count(distinct cvt.entity_id)-3) cnt
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where cm.contact_id = cvt.entity_id
and cvt.lewis_18 = 1
and cm.membership_type_id in (1,2,3,4,5) 
and cm.status_id in (1,2) 
and cvt.entity_id != 1
and cm.owner_membership_id is NULL
) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "Lewis"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "Mt Adams" as chapter, (count(distinct cvt.entity_id)-3) cnt
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where cm.contact_id = cvt.entity_id
and cvt.mt_adams_19 = 1
and cm.membership_type_id in (1,2,3,4,5) 
and cm.status_id in (1,2) 
and cvt.entity_id != 1
and cm.owner_membership_id is NULL
) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "Mt Adams"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "North Central" as chapter, (count(distinct cvt.entity_id)-3) cnt 
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where cm.contact_id = cvt.entity_id
and cvt.north_central_20 = 1
and cm.membership_type_id in (1,2,3,4,5) 
and cm.status_id in (1,2) 
and cvt.entity_id != 1
and cm.owner_membership_id is NULL
) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "North Central"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "Northeast Washington" as chapter, (count(distinct cvt.entity_id)-3) cnt
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where cm.contact_id = cvt.entity_id
and cvt.northeast_washington_21 = 1
and cm.membership_type_id in (1,2,3,4,5) 
and cm.status_id in (1,2) 
and cvt.entity_id != 1
and cm.owner_membership_id is NULL
) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "Northeast Washington"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "Olympic" as chapter, (count(distinct cvt.entity_id)-3) cnt
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where cm.contact_id = cvt.entity_id
and cvt.olympic_22 = 1
and cm.membership_type_id in (1,2,3,4,5) 
and cm.status_id in (1,2) 
and cvt.entity_id != 1
and cm.owner_membership_id is NULL
) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "Olympic"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "Pacific" as chapter, (count(distinct cvt.entity_id)-3) cnt
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where  cm.contact_id = cvt.entity_id
and cvt.pacific_23 = 1
and cm.membership_type_id in (1,2,3,4,5) 
and cm.status_id in (1,2) 
and cvt.entity_id != 1
and cm.owner_membership_id is NULL
) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "Pacific"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "Pierce" as chapter, (count(distinct cvt.entity_id)-3) cnt
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where cm.contact_id = cvt.entity_id
and cvt.pierce_24 = 1
and cm.membership_type_id in (1,2,3,4,5) 
and cm.status_id in (1,2) 
and cvt.entity_id != 1
and cm.owner_membership_id is NULL
) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "Pierce"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "South Sound" as chapter, (count(distinct cvt.entity_id)-3) cnt 
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where cm.contact_id = cvt.entity_id
and cvt.south_sound_25 = 1
and cm.membership_type_id in (1,2,3,4,5) 
and cm.status_id in (1,2) 
and cvt.entity_id != 1
and cm.owner_membership_id is NULL
) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "South Sound"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "Spokane" as chapter, (count(distinct cvt.entity_id)-3) cnt
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where cm.contact_id = cvt.entity_id
and cvt.spokane_26 = 1
and cm.membership_type_id in (1,2,3,4,5) 
and cm.status_id in (1,2) 
and cvt.entity_id != 1
and cm.owner_membership_id is NULL
) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "Spokane"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "Upper Puget Sound" as chapter, (count(distinct cvt.entity_id)-3) cnt
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where cm.contact_id = cvt.entity_id
and cvt.upper_puget_sound_27 = 1
and cm.membership_type_id in (1,2,3,4,5) 
and cm.status_id in (1,2) 
and cvt.entity_id != 1
and cm.owner_membership_id is NULL
) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "Upper Puget Sound"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "Whatcom" as chapter, (count(distinct cvt.entity_id)-3) cnt
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where cm.contact_id = cvt.entity_id
and cvt.entity_id != 1
and cvt.whatcom_28 = 1
and cm.membership_type_id in (1,2,3,4,5) 
and cm.status_id in (1,2)
and cm.owner_membership_id is NULL
) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "Whatcom";

**********************************************************************
/* Follow is the query that extracts the data for the report  */
**********************************************************************
SELECT * from 
/* count new and current non-life primary members (not the admin, not comps, not in At-large) by chapter */
(SELECT local_chapter_40 Chapter, member_type_41 Member_type, count(entity_id) Count
FROM civicrm_value_member_list_3, civicrm_membership cm
where status_42 in ('New','Current')
and member_type_41 in ('Associate','GenMemA','GenMemB','GenMemC')
and local_chapter_40 != 'At-Large'
and entity_id != 1
and entity_id = cm.contact_id
and cm.owner_membership_id is NULL
group by local_chapter_40, member_type_41
Union
/* count system status new or current life primary members (not the admin, not in At-large) by chapter who we consider new (first time) life members */
/* for the sake of chapter pay. the window for new (first time) life memberships is June 1 of the previous membership year to May 31 of the current membership year */
SELECT local_chapter_40 Chapter, member_type_41 Member_type, count(entity_id) Count
FROM civicrm_value_member_list_3, civicrm_membership cm, civicrm_contribution cc
where status_42 in ('New','Current')
and member_type_41 in ('LifeMem')
and local_chapter_40 != 'At-Large'
and entity_id != 1
and entity_id = cm.contact_id
and cm.owner_membership_id is NULL 
and entity_id = cc.contact_id
and cc.financial_type_id = 2
and cc.total_amount > 1699
and    ((YEAR(cc.receive_date) = YEAR(current_date)) 
	or  ((YEAR(cc.receive_date) = YEAR(current_date) -1) 
			and (MONTH(cc.receive_date) in (6,7,8,9,10,11,12))))
group by local_chapter_40, member_type_41
Union
/* count new and current additional chapter primary members from that table by chapter */
SELECT chapter_50 Chapter, "Additional" as Member_type, memcount_51 as Count 
	from civicrm_value_additional_chapters_summary_4
) sub
order by Chapter, Member_type
