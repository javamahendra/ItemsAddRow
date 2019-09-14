package com.app.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;

public class MotherFormBean {

	private Long id;
	private String name;
	private List<Child> children = LazyList.decorate(new ArrayList(), FactoryUtils.instantiateFactory(Child.class));

	public MotherFormBean() {
		super();
	}

	public MotherFormBean(Long id, String name, List<Child> children) {
		super();
		this.id = id;
		this.name = name;
		this.children = children;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Child> getChildren() {
		return children;
	}

	public void setChildren(List<Child> children) {
		this.children = children;
	}

	@Override
	public String toString() {
		return "MotherFormBean [id=" + id + ", name=" + name + ", children=" + children + "]";
	}

}
