package com.struts2.helloworld;

import java.util.Comparator;

public class PersonComparator  implements Comparator<Person> {

	@Override
	public int compare(Person p1, Person p2) {
		// TODO �Զ����ɵķ������
		return p1.getPersonName().compareTo(p2.getPersonName());
	}

}
