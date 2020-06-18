SELECT cvt.entity_id  
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where cm.contact_id in 
   (SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
where cc.contact_id = cm.contact_id and cm.membership_type_id in (1,2,3,4,5) and cc.receive_date >= '2015-01-01' and cc.receive_date <= '2016-05-31')
and cm.contact_id = cvt.entity_id


Select *
from 
civicrm_value_additional_chapters_summary_4 ad
left join 
(

SELECT "Whatcom" as Chapter, count(distinct cvt.entity_id) Add_chapter_cnt 
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where 
((cm.contact_id in (SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
where cc.contact_id = cm.contact_id and cm.membership_type_id in (1,2,3,5) and cc.receive_date >= '2015-04-01' and cc.receive_date <= '2016-03-31'))
or
 (cm.contact_id in (SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
where cc.contact_id = cm.contact_id and cm.membership_type_id = 4 and cc.receive_date >= '2015-04-01' and cc.receive_date <= '2016-03-31' and cc.total_amount >= 1700 )))
and cm.contact_id = cvt.entity_id
and cvt.whatcom_28 = 1

Good:
Select Member_type, Chapter, sum(Qty) from (
SELECT cmt.name as Member_type, "Whatcom" as Chapter, "1" as QTY
FROM civicrm_value_trial_2 cvt, civicrm_membership cm, civicrm_membership_type cmt
where cm.contact_id in 
   (SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
where cc.contact_id = cm.contact_id and cm.membership_type_id in (1,2,3,4,5) and cc.receive_date >= '2015-01-01' and cc.receive_date <= '2016-05-31')
and cm.contact_id = cvt.entity_id
and cm.membership_type_id = cmt.id
and cvt.whatcom_28 = 1
) sub
group by Member_type, Chapter

Play 1:

Select Member_type, Chapter, sum(Qty) from (
SELECT cmt.name as Member_type, "Whatcom" as Chapter, "1" as Qty
FROM civicrm_value_trial_2 cvt, civicrm_membership cm
where cm.contact_id in 
   (SELECT cc.contact_id FROM civicrm_contribution cc, civicrm_membership cm
where cc.contact_id = cm.contact_id and cm.membership_type_id in (1,2,3,4,5) and cc.receive_date >= '2015-01-01' and cc.receive_date <= '2016-05-31')
and cm.contact_id = cvt.entity_id
and cvt.whatcom_28 = 1
right join civicrm_membership_type cmt
on cm.membership_type_id = cmt.id
) sub
group by Member_type, Chapter

select cm_sub.name Type, cm_sub.id Type_id, cc.contact_id Contact 
from civicrm_contribution cc, 
(SELECT cmt.name, cmt.id, cm.contact_id
FROM civicrm_membership cm
right join civicrm_membership_type cmt
on cm.membership_type_id = cmt.id
where cm.membership_type_id in (1,2,3,4,5)
order by id) cm_sub
where
cc.contact_id = cm_sub.contact_id 
and cc.receive_date >= '2015-01-01' 
and cc.receive_date <= '2016-05-31')

Good 2:
select * from
(Select * from
	(Select Chapter, Member_type, sum(Qty) Count from 
		(Select cmt.id cmt_id, cmt.name Member_type, Chapter, Qty 
		from 
			(SELECT cm.membership_type_id Type_id, "Clark" Chapter, "1" Qty 
			FROM civicrm_contribution cc, civicrm_membership cm, civicrm_value_trial_2 cvt
			where cc.contact_id = cm.contact_id 
			and (cc.receive_date >= '2015-04-01' and cc.receive_date <= '2016-03-31')
			and cm.contact_id = cvt.entity_id
			and cvt.clark_14 = 1
			) sub1
		right join
		civicrm_membership_type cmt
		on sub1.type_id = cmt.id
		where cmt.id != 6
		) sub2
	group by Chapter, Member_type
	order by sub2.cmt_id) sub3
Union all
	(SELECT "Clark" as Chapter,"Additional" as Member_type, memcount_51 as Qty_Sum 
	from civicrm_value_additional_chapters_summary_4 
	where chapter_50 = 'Clark')) clark

Union

(Select * from
	(Select Chapter, Member_type, sum(Qty) Count from 
		(Select cmt.id cmt_id, cmt.name Member_type, Chapter, Qty 
		from 
			(SELECT cm.membership_type_id Type_id, "Cowlitz" Chapter, "1" Qty 
			FROM civicrm_contribution cc, civicrm_membership cm, civicrm_value_trial_2 cvt
			where cc.contact_id = cm.contact_id 
			and (cc.receive_date >= '2015-04-01' and cc.receive_date <= '2016-03-31')
			and cm.contact_id = cvt.entity_id
			and cvt.cowlitz_15 = 1
			) sub1
		right join
		civicrm_membership_type cmt
		on sub1.type_id = cmt.id
		where cmt.id != 6
		) sub2
	group by Chapter, Member_type
	order by sub2.cmt_id) sub3
Union all
	(SELECT "Cowlitz" as Chapter,"Additional" as Member_type, memcount_51 as Qty_Sum 
	from civicrm_value_additional_chapters_summary_4 
	where chapter_50 = 'Cowlitz')) cowlitz
	
*******************************
Good & final

SELECT * from 
(SELECT local_chapter_40 Chapter, member_type_41 Member_type, count(entity_id) Count
FROM civicrm_value_member_list_3
where status_42 in ('New','Current')
and member_type_41 in ('Associate','GenMemA','GenMemB','GenMemC','LifeMem')
and local_chapter_40 != 'At-Large'
group by local_chapter_40, member_type_41
Union
SELECT chapter_50 Chapter, "Additional" as Member_type, memcount_51 as Count 
	from civicrm_value_additional_chapters_summary_4
) sub
order by Chapter, Member_type
