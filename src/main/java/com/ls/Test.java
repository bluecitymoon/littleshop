package com.ls;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		StringBuilder sql =
				new StringBuilder("select r.lane_type_cid, r.cust_role_id, r.id, r.rp_role_id, r.orig_state, r.orig_city, "
					+ " r.orig_ramp, r.dest_state, r.dest_city, r.dest_ramp, r.orig_zip6, r.orig_zip6b, r.dest_zip6,r.dest_zip6b, r.mode_type_cid, "
					+ " r.resource_type_cid, r.type_cid, r.service_level_cid, r.time_out_in_seconds,  r.orig_country_id, r.dest_country_id " + " from routing_guide r WHERE id IN (:laneIds) ");
		
		System.out.println(sql.toString());
	}

}
