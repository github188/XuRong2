package org.ecnu.orm;

// Generated 2013-3-12 14:15:56 by Hibernate Tools 3.4.0.CR1

/**
 * NodeMapping generated by hbm2java
 */
public class NodeMapping implements java.io.Serializable {

	private Long id;
	private String nodeId;
	private String nodeName;
	private Long userId;
	private String employeeName;

	public NodeMapping() {
	}

	public NodeMapping(String nodeId, String nodeName, Long userId, String employeeName) {
		this.nodeId = nodeId;
		this.nodeName = nodeName;
		this.userId = userId;
		this.employeeName = employeeName;
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNodeId() {
		return this.nodeId;
	}

	public void setNodeId(String nodeId) {
		this.nodeId = nodeId;
	}

	public Long getUserId() {
		return this.userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getNodeName() {
		return nodeName;
	}

	public void setNodeName(String nodeName) {
		this.nodeName = nodeName;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

}
