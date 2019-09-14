package com.app.model;

public class Child {

	private Long id;
	private String name;

	public Child(Long id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public Child() {
		super();
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

	@Override
	public String toString() {
		return "Child [id=" + id + ", name=" + name + "]";
	}
}
