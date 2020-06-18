/* the following queries populate a table that has counts for people who joined a particular chapter as an additional to their primary chapter. */
/* This must be run before the report query that follows it below */ 
/* The join to the civicrm_value_trial_2 table only returns results for people who joined additional chapters */
/* Each total is subtracted by 4 to account for ExecDir, Exec Admin, Political, and Pres that are added to each chapter as an additionals to support their work with */
/* the chapters  */
/**/
/*  The comments in the Clark section below apply to each subsequent section as well */
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "Clark" as chapter, (count(distinct cvt.entity_id)-4) cnt 
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where cm.contact_id = cvt.entity_id
and cvt.clark_14 = 1
and (
	(cm.contact_id in 
		(SELECT cm.contact_id FROM civicrm_membership cm  
		where cm.membership_type_id in (1,2,3,5)    /* GenMem A,B,C or Assoc */
		and cm.status_id in (1,2)                   /* Status is New or Current */
		and cm.owner_membership_id is NULL          /* this field is null if the member is the primary on the account, which we want */
		)
	)
or
	(cm.contact_id in 
		(SELECT cm.contact_id FROM civicrm_membership cm 
		where cm.membership_type_id = 4             /* Life member */
		and cm.status_id = 1                        /* status = New */
		and cm.owner_membership_id is NULL          /* this field is null if the member is the primary on the account, which we want */
		)
	)
or
	(cm.contact_id in 
		(SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
		where cc.contact_id = cm.contact_id 
		and cm.membership_type_id = 4               /* Life member */
		and cm.status_id = 2                        /* status = current */
		and cm.owner_membership_id is NULL          /* this field is null if the member is the primary on the account, which we want */
		and cc.total_amount < 1700                  /* a not-new life member membership payment of less than 1700 and more than 9 would have to be  */ 
		and cc.total_amount > 9                     /*    for an additional chapter.   */
		and ((YEAR(cc.receive_date) = YEAR(cm.end_date))    /* checking that the payment is for this membership year */
		or ((YEAR(cc.receive_date) + 1 = YEAR(cm.end_date)) 
			and (MONTH(cc.receive_date) in (11,12))))
		)
	)
)) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "Clark"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "Cowlitz" as chapter, (count(distinct cvt.entity_id)-4) cnt
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where cm.contact_id = cvt.entity_id
and cvt.cowlitz_15 = 1
and (
	(cm.contact_id in 
		(SELECT cm.contact_id FROM civicrm_membership cm 
		where cm.membership_type_id in (1,2,3,5) 
		and cm.status_id in (1,2) 
		and cm.owner_membership_id is NULL
		)
	)
or
	(cm.contact_id in 
		(SELECT cm.contact_id FROM civicrm_membership cm 
		where cm.membership_type_id = 4 
		and cm.status_id = 1 
		and cm.owner_membership_id is NULL
		)
	)
or
	(cm.contact_id in 
		(SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
		where cc.contact_id = cm.contact_id 
		and cm.membership_type_id = 4 
		and cm.status_id = 2 
		and cm.owner_membership_id is NULL 
		and cc.total_amount < 1700 
		and cc.total_amount > 9
		and ((YEAR(cc.receive_date) = YEAR(cm.end_date)) 
		or ((YEAR(cc.receive_date) + 1 = YEAR(cm.end_date)) 
			and (MONTH(cc.receive_date) in (11,12))))
		)
	)
)) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "Cowlitz"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "Grays Harbor" as chapter, (count(distinct cvt.entity_id)-4) cnt 
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where cm.contact_id = cvt.entity_id
and cvt.grays_harbor_16 = 1
and (
	(cm.contact_id in 
		(SELECT cm.contact_id FROM civicrm_membership cm 
		where cm.membership_type_id in (1,2,3,5) 
		and cm.status_id in (1,2) 
		and cm.owner_membership_id is NULL
		)
	)
or
	(cm.contact_id in 
		(SELECT cm.contact_id FROM civicrm_membership cm 
		where cm.membership_type_id = 4 
		and cm.status_id = 1 
		and cm.owner_membership_id is NULL
		)
	)
or
	(cm.contact_id in 
		(SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
		where cc.contact_id = cm.contact_id 
		and cm.membership_type_id = 4 
		and cm.status_id = 2 
		and cm.owner_membership_id is NULL 
		and cc.total_amount < 1700 
		and cc.total_amount > 9
		and ((YEAR(cc.receive_date) = YEAR(cm.end_date)) 
		or ((YEAR(cc.receive_date) + 1 = YEAR(cm.end_date)) 
			and (MONTH(cc.receive_date) in (11,12))))
		)
	)
)) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "Grays Harbor"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "Kittitas" as chapter, (count(distinct cvt.entity_id)-4) cnt
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where cm.contact_id = cvt.entity_id
and cvt.kittitas_17 = 1
and (
	(cm.contact_id in 
		(SELECT cm.contact_id FROM civicrm_membership cm 
		where cm.membership_type_id in (1,2,3,5) 
		and cm.status_id in (1,2) 
		and cm.owner_membership_id is NULL
		)
	)
or
	(cm.contact_id in 
		(SELECT cm.contact_id FROM civicrm_membership cm 
		where cm.membership_type_id = 4 
		and cm.status_id = 1 
		and cm.owner_membership_id is NULL
		)
	)
or
	(cm.contact_id in 
		(SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
		where cc.contact_id = cm.contact_id 
		and cm.membership_type_id = 4 
		and cm.status_id = 2 
		and cm.owner_membership_id is NULL 
		and cc.total_amount < 1700 
		and cc.total_amount > 9
		and ((YEAR(cc.receive_date) = YEAR(cm.end_date)) 
		or ((YEAR(cc.receive_date) + 1 = YEAR(cm.end_date)) 
			and (MONTH(cc.receive_date) in (11,12))))
		)
	)
)) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "Kittitas"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "Lewis" as chapter, (count(distinct cvt.entity_id)-4) cnt
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where cm.contact_id = cvt.entity_id
and cvt.lewis_18 = 1
and (
	(cm.contact_id in 
		(SELECT cm.contact_id FROM civicrm_membership cm 
		where cm.membership_type_id in (1,2,3,5) 
		and cm.status_id in (1,2) 
		and cm.owner_membership_id is NULL
		)
	)
or
	(cm.contact_id in 
		(SELECT cm.contact_id FROM civicrm_membership cm 
		where cm.membership_type_id = 4 
		and cm.status_id = 1 
		and cm.owner_membership_id is NULL
		)
	)
or
	(cm.contact_id in 
		(SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
		where cc.contact_id = cm.contact_id 
		and cm.membership_type_id = 4 
		and cm.status_id = 2 
		and cm.owner_membership_id is NULL 
		and cc.total_amount < 1700 
		and cc.total_amount > 9
		and ((YEAR(cc.receive_date) = YEAR(cm.end_date)) 
		or ((YEAR(cc.receive_date) + 1 = YEAR(cm.end_date)) 
			and (MONTH(cc.receive_date) in (11,12))))
		)
	)
)) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "Lewis"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "Mt Adams" as chapter, (count(distinct cvt.entity_id)-4) cnt
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where cm.contact_id = cvt.entity_id
and cvt.mt_adams_19 = 1
and (
	(cm.contact_id in 
		(SELECT cm.contact_id FROM civicrm_membership cm 
		where cm.membership_type_id in (1,2,3,5) 
		and cm.status_id in (1,2) 
		and cm.owner_membership_id is NULL
		)
	)
or
	(cm.contact_id in 
		(SELECT cm.contact_id FROM civicrm_membership cm 
		where cm.membership_type_id = 4 
		and cm.status_id = 1 
		and cm.owner_membership_id is NULL
		)
	)
or
	(cm.contact_id in 
		(SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
		where cc.contact_id = cm.contact_id 
		and cm.membership_type_id = 4 
		and cm.status_id = 2 
		and cm.owner_membership_id is NULL 
		and cc.total_amount < 1700 
		and cc.total_amount > 9
		and ((YEAR(cc.receive_date) = YEAR(cm.end_date)) 
		or ((YEAR(cc.receive_date) + 1 = YEAR(cm.end_date)) 
			and (MONTH(cc.receive_date) in (11,12))))
		)
	)
)) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "Mt Adams"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "North Central" as chapter, (count(distinct cvt.entity_id)-4) cnt 
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where cm.contact_id = cvt.entity_id
and cvt.north_central_20 = 1
and (
	(cm.contact_id in 
		(SELECT cm.contact_id FROM civicrm_membership cm 
		where cm.membership_type_id in (1,2,3,5) 
		and cm.status_id in (1,2) 
		and cm.owner_membership_id is NULL
		)
	)
or
	(cm.contact_id in 
		(SELECT cm.contact_id FROM civicrm_membership cm 
		where cm.membership_type_id = 4 
		and cm.status_id = 1 
		and cm.owner_membership_id is NULL
		)
	)
or
	(cm.contact_id in 
		(SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
		where cc.contact_id = cm.contact_id 
		and cm.membership_type_id = 4 
		and cm.status_id = 2 
		and cm.owner_membership_id is NULL 
		and cc.total_amount < 1700 
		and cc.total_amount > 9
		and ((YEAR(cc.receive_date) = YEAR(cm.end_date)) 
		or ((YEAR(cc.receive_date) + 1 = YEAR(cm.end_date)) 
			and (MONTH(cc.receive_date) in (11,12))))
		)
	)
)) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "North Central"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "Northeast Washington" as chapter, (count(distinct cvt.entity_id)-4) cnt
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where cm.contact_id = cvt.entity_id
and cvt.northeast_washington_21 = 1
and (
	(cm.contact_id in 
		(SELECT cm.contact_id FROM civicrm_membership cm 
		where cm.membership_type_id in (1,2,3,5) 
		and cm.status_id in (1,2) 
		and cm.owner_membership_id is NULL
		)
	)
or
	(cm.contact_id in 
		(SELECT cm.contact_id FROM civicrm_membership cm 
		where cm.membership_type_id = 4 
		and cm.status_id = 1 
		and cm.owner_membership_id is NULL
		)
	)
or
	(cm.contact_id in 
		(SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
		where cc.contact_id = cm.contact_id 
		and cm.membership_type_id = 4 
		and cm.status_id = 2 
		and cm.owner_membership_id is NULL 
		and cc.total_amount < 1700 
		and cc.total_amount > 9
		and ((YEAR(cc.receive_date) = YEAR(cm.end_date)) 
		or ((YEAR(cc.receive_date) + 1 = YEAR(cm.end_date)) 
			and (MONTH(cc.receive_date) in (11,12))))
		)
	)
)) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "Northeast Washington"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "Olympic" as chapter, (count(distinct cvt.entity_id)-4) cnt
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where cm.contact_id = cvt.entity_id
and cvt.olympic_22 = 1
and (
	(cm.contact_id in 
		(SELECT cm.contact_id FROM civicrm_membership cm 
		where cm.membership_type_id in (1,2,3,5) 
		and cm.status_id in (1,2) 
		and cm.owner_membership_id is NULL
		)
	)
or
	(cm.contact_id in 
		(SELECT cm.contact_id FROM civicrm_membership cm 
		where cm.membership_type_id = 4 
		and cm.status_id = 1 
		and cm.owner_membership_id is NULL
		)
	)
or
	(cm.contact_id in 
		(SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
		where cc.contact_id = cm.contact_id 
		and cm.membership_type_id = 4 
		and cm.status_id = 2 
		and cm.owner_membership_id is NULL 
		and cc.total_amount < 1700 
		and cc.total_amount > 9
		and ((YEAR(cc.receive_date) = YEAR(cm.end_date)) 
		or ((YEAR(cc.receive_date) + 1 = YEAR(cm.end_date)) 
			and (MONTH(cc.receive_date) in (11,12))))
		)
	)
)) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "Olympic"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "Pacific" as chapter, (count(distinct cvt.entity_id)-4) cnt
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where  cm.contact_id = cvt.entity_id
and cvt.pacific_23 = 1
and (
	(cm.contact_id in 
		(SELECT cm.contact_id FROM civicrm_membership cm 
		where cm.membership_type_id in (1,2,3,5) 
		and cm.status_id in (1,2) 
		and cm.owner_membership_id is NULL
		)
	)
or
	(cm.contact_id in 
		(SELECT cm.contact_id FROM civicrm_membership cm 
		where cm.membership_type_id = 4 
		and cm.status_id = 1 
		and cm.owner_membership_id is NULL
		)
	)
or
	(cm.contact_id in 
		(SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
		where cc.contact_id = cm.contact_id 
		and cm.membership_type_id = 4 
		and cm.status_id = 2 
		and cm.owner_membership_id is NULL 
		and cc.total_amount < 1700 
		and cc.total_amount > 9
		and ((YEAR(cc.receive_date) = YEAR(cm.end_date)) 
		or ((YEAR(cc.receive_date) + 1 = YEAR(cm.end_date)) 
			and (MONTH(cc.receive_date) in (11,12))))
		)
	)
)) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "Pacific"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "Pierce" as chapter, (count(distinct cvt.entity_id)-4) cnt
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where cm.contact_id = cvt.entity_id
and cvt.pierce_24 = 1
and (
	(cm.contact_id in 
		(SELECT cm.contact_id FROM civicrm_membership cm 
		where cm.membership_type_id in (1,2,3,5) 
		and cm.status_id in (1,2) 
		and cm.owner_membership_id is NULL
		)
	)
or
	(cm.contact_id in 
		(SELECT cm.contact_id FROM civicrm_membership cm 
		where cm.membership_type_id = 4 
		and cm.status_id = 1 
		and cm.owner_membership_id is NULL
		)
	)
or
	(cm.contact_id in 
		(SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
		where cc.contact_id = cm.contact_id 
		and cm.membership_type_id = 4 
		and cm.status_id = 2 
		and cm.owner_membership_id is NULL 
		and cc.total_amount < 1700 
		and cc.total_amount > 9
		and ((YEAR(cc.receive_date) = YEAR(cm.end_date)) 
		or ((YEAR(cc.receive_date) + 1 = YEAR(cm.end_date)) 
			and (MONTH(cc.receive_date) in (11,12))))
		)
	)
)) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "Pierce"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "South Sound" as chapter, (count(distinct cvt.entity_id)-4) cnt 
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where cm.contact_id = cvt.entity_id
and cvt.south_sound_25 = 1
and (
	(cm.contact_id in 
		(SELECT cm.contact_id FROM civicrm_membership cm 
		where cm.membership_type_id in (1,2,3,5) 
		and cm.status_id in (1,2) 
		and cm.owner_membership_id is NULL
		)
	)
or
	(cm.contact_id in 
		(SELECT cm.contact_id FROM civicrm_membership cm 
		where cm.membership_type_id = 4 
		and cm.status_id = 1 
		and cm.owner_membership_id is NULL
		)
	)
or
	(cm.contact_id in 
		(SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
		where cc.contact_id = cm.contact_id 
		and cm.membership_type_id = 4 
		and cm.status_id = 2 
		and cm.owner_membership_id is NULL 
		and cc.total_amount < 1700 
		and cc.total_amount > 9
		and ((YEAR(cc.receive_date) = YEAR(cm.end_date)) 
		or ((YEAR(cc.receive_date) + 1 = YEAR(cm.end_date)) 
			and (MONTH(cc.receive_date) in (11,12))))
		)
	)
)) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "South Sound"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "Spokane" as chapter, (count(distinct cvt.entity_id)-4) cnt
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where cm.contact_id = cvt.entity_id
and cvt.spokane_26 = 1
and (
	(cm.contact_id in 
		(SELECT cm.contact_id FROM civicrm_membership cm 
		where cm.membership_type_id in (1,2,3,5) 
		and cm.status_id in (1,2) 
		and cm.owner_membership_id is NULL
		)
	)
or
	(cm.contact_id in 
		(SELECT cm.contact_id FROM civicrm_membership cm 
		where cm.membership_type_id = 4 
		and cm.status_id = 1 
		and cm.owner_membership_id is NULL
		)
	)
or
	(cm.contact_id in 
		(SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
		where cc.contact_id = cm.contact_id 
		and cm.membership_type_id = 4 
		and cm.status_id = 2 
		and cm.owner_membership_id is NULL 
		and cc.total_amount < 1700 
		and cc.total_amount > 9
		and ((YEAR(cc.receive_date) = YEAR(cm.end_date)) 
		or ((YEAR(cc.receive_date) + 1 = YEAR(cm.end_date)) 
			and (MONTH(cc.receive_date) in (11,12))))
		)
	)
)) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "Spokane"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "Upper Puget Sound" as chapter, (count(distinct cvt.entity_id)-4) cnt
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where cm.contact_id = cvt.entity_id
and cvt.upper_puget_sound_27 = 1
and (
	(cm.contact_id in 
		(SELECT cm.contact_id FROM civicrm_membership cm 
		where cm.membership_type_id in (1,2,3,5) 
		and cm.status_id in (1,2) 
		and cm.owner_membership_id is NULL
		)
	)
or
	(cm.contact_id in 
		(SELECT cm.contact_id FROM civicrm_membership cm 
		where cm.membership_type_id = 4 
		and cm.status_id = 1 
		and cm.owner_membership_id is NULL
		)
	)
or
	(cm.contact_id in 
		(SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
		where cc.contact_id = cm.contact_id 
		and cm.membership_type_id = 4 
		and cm.status_id = 2 
		and cm.owner_membership_id is NULL 
		and cc.total_amount < 1700 
		and cc.total_amount > 9
		and ((YEAR(cc.receive_date) = YEAR(cm.end_date)) 
		or ((YEAR(cc.receive_date) + 1 = YEAR(cm.end_date)) 
			and (MONTH(cc.receive_date) in (11,12))))
		)
	)
)) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "Upper Puget Sound"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "Whatcom" as chapter, (count(distinct cvt.entity_id)-4) cnt
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where cm.contact_id = cvt.entity_id
and cvt.whatcom_28 = 1
and (
	(cm.contact_id in 
		(SELECT cm.contact_id FROM civicrm_membership cm 
		where cm.membership_type_id in (1,2,3,5) 
		and cm.status_id in (1,2) 
		and cm.owner_membership_id is NULL
		)
	)
or
	(cm.contact_id in 
		(SELECT cm.contact_id FROM civicrm_membership cm 
		where cm.membership_type_id = 4 
		and cm.status_id = 1 
		and cm.owner_membership_id is NULL
		)
	)
or
	(cm.contact_id in 
		(SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
		where cc.contact_id = cm.contact_id 
		and cm.membership_type_id = 4 
		and cm.status_id = 2 
		and cm.owner_membership_id is NULL 
		and cc.total_amount < 1700 
		and cc.total_amount > 9
		and ((YEAR(cc.receive_date) = YEAR(cm.end_date)) 
		or ((YEAR(cc.receive_date) + 1 = YEAR(cm.end_date)) 
			and (MONTH(cc.receive_date) in (11,12))))
		)
	)
)) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "Whatcom";

**********************************************************************
/* Follow is the query that extracts the data for the report  */
**********************************************************************
SELECT * from 
(SELECT local_chapter_40 Chapter, member_type_41 Member_type, count(entity_id) Count
FROM civicrm_value_member_list_3
where status_42 in ('New','Current')
and member_type_41 in ('Associate','GenMemA','GenMemB','GenMemC')
and local_chapter_40 != 'At-Large'
group by local_chapter_40, member_type_41
Union
SELECT local_chapter_40 Chapter, member_type_41 Member_type, count(entity_id) Count
FROM civicrm_value_member_list_3
where status_42 in ('New')
and member_type_41 in ('LifeMem')
and local_chapter_40 != 'At-Large'
group by local_chapter_40, member_type_41
Union
SELECT chapter_50 Chapter, "Additional" as Member_type, memcount_51 as Count 
	from civicrm_value_additional_chapters_summary_4
) sub
order by Chapter, Member_type
