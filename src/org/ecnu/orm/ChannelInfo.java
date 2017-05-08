package org.ecnu.orm;

// Generated 2013-3-12 14:15:56 by Hibernate Tools 3.4.0.CR1

import java.util.Date;

/**
 * ChannelInfo generated by hbm2java
 */
public class ChannelInfo implements java.io.Serializable {

	private Long id;
	private NodeInfo nodeInfo;
	private String channelId;
	private String wareId;
	private String wareName;
	private Integer normalStock;
	private Integer currentNumber;
	private Integer incrementNumber;
	private String isSpecial;//是否为特殊货道标记，1是，2不是
	private Date lastTime;

	public ChannelInfo() {
	}

	public ChannelInfo(NodeInfo nodeInfo, String channelId, Date lastTime) {
		this.nodeInfo = nodeInfo;
		this.channelId = channelId;
		this.lastTime = lastTime;
	}

	public ChannelInfo(NodeInfo nodeInfo, String channelId, String wareId,
			String wareName, Integer normalStock, Integer currentNumber,
			Integer incrementNumber, String isSpecial, Date lastTime) {
		this.nodeInfo = nodeInfo;
		this.channelId = channelId;
		this.wareId = wareId;
		this.wareName = wareName;
		this.normalStock = normalStock;
		this.currentNumber = currentNumber;
		this.incrementNumber = incrementNumber;
		this.isSpecial = isSpecial;
		this.lastTime = lastTime;
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public NodeInfo getNodeInfo() {
		return this.nodeInfo;
	}

	public void setNodeInfo(NodeInfo nodeInfo) {
		this.nodeInfo = nodeInfo;
	}

	public String getChannelId() {
		return this.channelId;
	}

	public void setChannelId(String channelId) {
		this.channelId = channelId;
	}

	public String getWareId() {
		return this.wareId;
	}

	public void setWareId(String wareId) {
		this.wareId = wareId;
	}

	public String getWareName() {
		return this.wareName;
	}

	public void setWareName(String wareName) {
		this.wareName = wareName;
	}

	public Integer getNormalStock() {
		return this.normalStock;
	}

	public void setNormalStock(Integer normalStock) {
		this.normalStock = normalStock;
	}

	public Integer getCurrentNumber() {
		return this.currentNumber;
	}

	public void setCurrentNumber(Integer currentNumber) {
		this.currentNumber = currentNumber;
	}

	public Integer getIncrementNumber() {
		return this.incrementNumber;
	}

	public void setIncrementNumber(Integer incrementNumber) {
		this.incrementNumber = incrementNumber;
	}

	public Date getLastTime() {
		return this.lastTime;
	}

	public void setLastTime(Date lastTime) {
		this.lastTime = lastTime;
	}

	public String getIsSpecial() {
		return isSpecial;
	}

	public void setIsSpecial(String isSpecial) {
		this.isSpecial = isSpecial;
	}

}
