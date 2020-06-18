/* the following queries populate a table that has counts for people who joined a particular chapter as an additional to their primary chapter */
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "Clark" as chapter, (count(distinct cvt.entity_id)-3) cnt 
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where 
((cm.contact_id in (SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
where cc.contact_id = cm.contact_id and cm.membership_type_id in (1,2,3,5) and cc.receive_date >= '2015-04-01' and cc.receive_date <= '2016-03-31'))
or
 (cm.contact_id in (SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
where cc.contact_id = cm.contact_id and cm.membership_type_id = 4 and cc.receive_date >= '2015-04-01' and cc.receive_date <= '2016-03-31' and cc.total_amount >= 1700 )))
and cm.contact_id = cvt.entity_id
and cvt.clark_14 = 1) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "Clark"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "Cowlitz" as chapter, (count(distinct cvt.entity_id)-3) cnt
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where 
((cm.contact_id in (SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
where cc.contact_id = cm.contact_id and cm.membership_type_id in (1,2,3,5) and cc.receive_date >= '2015-04-01' and cc.receive_date <= '2016-03-31'))
or
 (cm.contact_id in (SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
where cc.contact_id = cm.contact_id and cm.membership_type_id = 4 and cc.receive_date >= '2015-04-01' and cc.receive_date <= '2016-03-31' and cc.total_amount >= 1700 )))
and cm.contact_id = cvt.entity_id
and cvt.cowlitz_15 = 1) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "Cowlitz"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "Grays_Harbor" as chapter, (count(distinct cvt.entity_id)-3) cnt 
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where 
((cm.contact_id in (SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
where cc.contact_id = cm.contact_id and cm.membership_type_id in (1,2,3,5) and cc.receive_date >= '2015-04-01' and cc.receive_date <= '2016-03-31'))
or
 (cm.contact_id in (SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
where cc.contact_id = cm.contact_id and cm.membership_type_id = 4 and cc.receive_date >= '2015-04-01' and cc.receive_date <= '2016-03-31' and cc.total_amount >= 1700 )))
and cm.contact_id = cvt.entity_id
and cvt.grays_harbor_16 = 1) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "Grays_Harbor"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "Kittitas" as chapter, (count(distinct cvt.entity_id)-3) cnt
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where 
((cm.contact_id in (SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
where cc.contact_id = cm.contact_id and cm.membership_type_id in (1,2,3,5) and cc.receive_date >= '2015-04-01' and cc.receive_date <= '2016-03-31'))
or
 (cm.contact_id in (SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
where cc.contact_id = cm.contact_id and cm.membership_type_id = 4 and cc.receive_date >= '2015-04-01' and cc.receive_date <= '2016-03-31' and cc.total_amount >= 1700 )))
and cm.contact_id = cvt.entity_id
and cvt.kittitas_17 = 1) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "Kittitas"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "Lewis" as chapter, (count(distinct cvt.entity_id)-3) cnt
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where 
((cm.contact_id in (SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
where cc.contact_id = cm.contact_id and cm.membership_type_id in (1,2,3,5) and cc.receive_date >= '2015-04-01' and cc.receive_date <= '2016-03-31'))
or
 (cm.contact_id in (SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
where cc.contact_id = cm.contact_id and cm.membership_type_id = 4 and cc.receive_date >= '2015-04-01' and cc.receive_date <= '2016-03-31' and cc.total_amount >= 1700 )))
and cm.contact_id = cvt.entity_id
and cvt.lewis_18 = 1) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "Lewis"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "MtAdams" as chapter, (count(distinct cvt.entity_id)-3) cnt
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where 
((cm.contact_id in (SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
where cc.contact_id = cm.contact_id and cm.membership_type_id in (1,2,3,5) and cc.receive_date >= '2015-04-01' and cc.receive_date <= '2016-03-31'))
or
 (cm.contact_id in (SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
where cc.contact_id = cm.contact_id and cm.membership_type_id = 4 and cc.receive_date >= '2015-04-01' and cc.receive_date <= '2016-03-31' and cc.total_amount >= 1700 )))
and cm.contact_id = cvt.entity_id
and cvt.mt_adams_19 = 1) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "MtAdams"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "North_Central" as chapter, (count(distinct cvt.entity_id)-3) cnt 
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where 
((cm.contact_id in (SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
where cc.contact_id = cm.contact_id and cm.membership_type_id in (1,2,3,5) and cc.receive_date >= '2015-04-01' and cc.receive_date <= '2016-03-31'))
or
 (cm.contact_id in (SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
where cc.contact_id = cm.contact_id and cm.membership_type_id = 4 and cc.receive_date >= '2015-04-01' and cc.receive_date <= '2016-03-31' and cc.total_amount >= 1700 )))
and cm.contact_id = cvt.entity_id
and cvt.north_central_20 = 1) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "North_Central"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "NorthEast" as chapter, (count(distinct cvt.entity_id)-3) cnt
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where 
((cm.contact_id in (SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
where cc.contact_id = cm.contact_id and cm.membership_type_id in (1,2,3,5) and cc.receive_date >= '2015-04-01' and cc.receive_date <= '2016-03-31'))
or
 (cm.contact_id in (SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
where cc.contact_id = cm.contact_id and cm.membership_type_id = 4 and cc.receive_date >= '2015-04-01' and cc.receive_date <= '2016-03-31' and cc.total_amount >= 1700 )))
and cm.contact_id = cvt.entity_id
and cvt.northeast_washington_21 = 1) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "NorthEast"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "Olympic" as chapter, (count(distinct cvt.entity_id)-3) cnt
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where 
((cm.contact_id in (SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
where cc.contact_id = cm.contact_id and cm.membership_type_id in (1,2,3,5) and cc.receive_date >= '2015-04-01' and cc.receive_date <= '2016-03-31'))
or
 (cm.contact_id in (SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
where cc.contact_id = cm.contact_id and cm.membership_type_id = 4 and cc.receive_date >= '2015-04-01' and cc.receive_date <= '2016-03-31' and cc.total_amount >= 1700 )))
and cm.contact_id = cvt.entity_id
and cvt.olympic_22 = 1) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "Olympic"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "Pacific" as chapter, count(distinct cvt.entity_id)-3) cnt
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where 
((cm.contact_id in (SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
where cc.contact_id = cm.contact_id and cm.membership_type_id in (1,2,3,5) and cc.receive_date >= '2015-04-01' and cc.receive_date <= '2016-03-31'))
or
 (cm.contact_id in (SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
where cc.contact_id = cm.contact_id and cm.membership_type_id = 4 and cc.receive_date >= '2015-04-01' and cc.receive_date <= '2016-03-31' and cc.total_amount >= 1700 )))
and cm.contact_id = cvt.entity_id
and cvt.pacific_23 = 1) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "Pacific"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "Pierce" as chapter, (count(distinct cvt.entity_id)-3) cnt 
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where 
((cm.contact_id in (SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
where cc.contact_id = cm.contact_id and cm.membership_type_id in (1,2,3,5) and cc.receive_date >= '2015-04-01' and cc.receive_date <= '2016-03-31'))
or
 (cm.contact_id in (SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
where cc.contact_id = cm.contact_id and cm.membership_type_id = 4 and cc.receive_date >= '2015-04-01' and cc.receive_date <= '2016-03-31' and cc.total_amount >= 1700 )))
and cm.contact_id = cvt.entity_id
and cvt.pierce_24 = 1) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "Pierce"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "South_Sound" as chapter, (count(distinct cvt.entity_id)-3) cnt 
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where 
((cm.contact_id in (SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
where cc.contact_id = cm.contact_id and cm.membership_type_id in (1,2,3,5) and cc.receive_date >= '2015-04-01' and cc.receive_date <= '2016-03-31'))
or
 (cm.contact_id in (SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
where cc.contact_id = cm.contact_id and cm.membership_type_id = 4 and cc.receive_date >= '2015-04-01' and cc.receive_date <= '2016-03-31' and cc.total_amount >= 1700 )))
and cm.contact_id = cvt.entity_id
and cvt.south_sound_25 = 1) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "South_Sound"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "Spokane" as chapter, (count(distinct cvt.entity_id)-3) cnt
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where 
((cm.contact_id in (SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
where cc.contact_id = cm.contact_id and cm.membership_type_id in (1,2,3,5) and cc.receive_date >= '2015-04-01' and cc.receive_date <= '2016-03-31'))
or
 (cm.contact_id in (SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
where cc.contact_id = cm.contact_id and cm.membership_type_id = 4 and cc.receive_date >= '2015-04-01' and cc.receive_date <= '2016-03-31' and cc.total_amount >= 1700 )))
and cm.contact_id = cvt.entity_id
and cvt.spokane_26 = 1) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "Spokane"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "UPS" as chapter, (count(distinct cvt.entity_id)-3) cnt
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where 
((cm.contact_id in (SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
where cc.contact_id = cm.contact_id and cm.membership_type_id in (1,2,3,5) and cc.receive_date >= '2015-04-01' and cc.receive_date <= '2016-03-31'))
or
 (cm.contact_id in (SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
where cc.contact_id = cm.contact_id and cm.membership_type_id = 4 and cc.receive_date >= '2015-04-01' and cc.receive_date <= '2016-03-31' and cc.total_amount >= 1700 )))
and cm.contact_id = cvt.entity_id
and cvt.upper_puget_sound_27 = 1) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "UPS"
;
update civicrm_value_additional_chapters_summary_4 ad
left join 
(SELECT "Whatcom" as chapter, (count(distinct cvt.entity_id)-3) cnt 
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where 
((cm.contact_id in (SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
where cc.contact_id = cm.contact_id and cm.membership_type_id in (1,2,3,5) and cc.receive_date >= '2015-04-01' and cc.receive_date <= '2016-03-31'))
or
 (cm.contact_id in (SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
where cc.contact_id = cm.contact_id and cm.membership_type_id = 4 and cc.receive_date >= '2015-04-01' and cc.receive_date <= '2016-03-31' and cc.total_amount >= 1700 )))
and cm.contact_id = cvt.entity_id
and cvt.whatcom_28 = 1) s1
on ad.chapter_50 = s1.chapter 
set ad.memcount_51 = s1.cnt 
where ad.chapter_50 = "Whatcom";



**************************************
Select * from
(SELECT "Clark", count(*)+(select memcount_51 from civicrm_value_additional_chapters_summary_4 where chapter_50 = 'Clark')  FROM `civicrm_value_trial_2` where clark_14 = 1) 
, (SELECT "Cowlitz", count(*)+(select memcount_51 from civicrm_value_additional_chapters_summary_4 where chapter_50 = 'Cowlitz')  FROM `civicrm_value_trial_2` where cowlitz_15 = 1)
, (SELECT "Grays_Harbor", count(*)+(select memcount_51 from civicrm_value_additional_chapters_summary_4 where chapter_50 = 'Grays Harbor')  FROM `civicrm_value_trial_2` where grays_harbor_16 = 1)

, (SELECT "Kittitas", count(*) FROM `civicrm_value_trial_2` where kittitas_17 = 1) kittitas
, (SELECT "Lewis", count(*) FROM `civicrm_value_trial_2` where lewis_18 = 1) lewis
, (SELECT "MtAdams", count(*) FROM `civicrm_value_trial_2` where mt_adams_19 = 1)mtadams
, (SELECT "North_Central", count(*) FROM `civicrm_value_trial_2` where north_central_20 = 1) ncentral
, (SELECT "NorthEast", count(*) FROM `civicrm_value_trial_2` where northeast_washington_21 = 1) neast
, (SELECT "Olympic", count(*) FROM `civicrm_value_trial_2` where olympic_22 = 1) olympic
, (SELECT "Pacific", count(*) FROM `civicrm_value_trial_2` where pacific_23 = 1) pacific
, (SELECT "Pierce", count(*) FROM `civicrm_value_trial_2` where pierce_24 = 1) pierce
, (SELECT "South_Sound", count(*) FROM `civicrm_value_trial_2` where south_sound_25 = 1) ssound
, (SELECT "Spokane", count(*) FROM `civicrm_value_trial_2` where spokane_26 = 1) spokane
, (SELECT "UPS", count(*) FROM `civicrm_value_trial_2` where upper_puget_sound_27 = 1) ups
, (SELECT "Whatcom", count(*)+(select memcount_51 from civicrm_value_additional_chapters_summary_4 where chapter_50 = 'Whatcom') FROM `civicrm_value_trial_2` where whatcom_28 = 1) whatcom
