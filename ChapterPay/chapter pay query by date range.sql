SELECT * from 
(SELECT local_chapter_40 Chapter, member_type_41 Member_type, count(entity_id) Count
FROM civicrm_value_member_list_3 ml, civicrm_contribution cc
where status_42 in ('New','Current')
and member_type_41 in ('Associate','GenMemA','GenMemB','GenMemC')
and local_chapter_40 != 'At-Large'
and ml.entity_id = cc.contact_id
and cc.receive_date >= '2015-04-01'
and cc.receive_date <= '2016-03-31'
group by local_chapter_40, member_type_41
UNION
SELECT local_chapter_40 Chapter, member_type_41 Member_type, count(entity_id) Count
FROM civicrm_value_member_list_3 ml, civicrm_contribution cc
where status_42 in ('New','Current')
and member_type_41 in ('LifeMem')
and local_chapter_40 != 'At-Large'
and ml.entity_id = cc.contact_id
and cc.receive_date >= '2015-04-01'
and cc.receive_date <= '2016-03-31'
and cc.total_amount >= 1700
group by local_chapter_40, member_type_41
UNION
SELECT chapter_50 Chapter, "Additional" as Member_type, memcount_51 as Count 
	from civicrm_value_additional_chapters_summary_4
) sub1
order by Chapter, Member_type
