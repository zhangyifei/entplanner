package com.entplanner.entity;

import java.util.Comparator;

import com.entplanner.entity.Plan;

public class PlanComparatorDefault implements Comparator<Plan> {

	public PlanComparatorDefault() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public int compare(Plan o1, Plan o2) {

		double v = (o2.getConnect_csp() + o2.getTime_csp() + o2.getCost_csp())
				/ 3
				- (o1.getConnect_csp() + o1.getTime_csp() + o1.getCost_csp())
				/ 3;
		if (v > 0) {
			return 1;
		} else if (v < 0) {
			return -1;
		} else {
			return 0;
		}

	}

}
