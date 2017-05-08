package org.ecnu.oracle.orm;

// Generated 2013-3-7 21:12:37 by Hibernate Tools 3.4.0.CR1

/**
 * PWareInfo generated by hbm2java
 */
public class PWareInfo implements java.io.Serializable {

	private PWareInfoId id;
	private PWareInfoVersion PWareInfoVersion;
	private PGoodsInfo PGoodsInfo;
	private long warePrice;
	private short maxWareContent;
	private short stdWareOuts;
	private String lastTime;
	private String idUseFlag;
	private String reserve;

	public PWareInfo() {
	}

	public PWareInfo(PWareInfoId id, PWareInfoVersion PWareInfoVersion,
			PGoodsInfo PGoodsInfo, long warePrice, short maxWareContent,
			short stdWareOuts, String idUseFlag) {
		this.id = id;
		this.PWareInfoVersion = PWareInfoVersion;
		this.PGoodsInfo = PGoodsInfo;
		this.warePrice = warePrice;
		this.maxWareContent = maxWareContent;
		this.stdWareOuts = stdWareOuts;
		this.idUseFlag = idUseFlag;
	}

	public PWareInfo(PWareInfoId id, PWareInfoVersion PWareInfoVersion,
			PGoodsInfo PGoodsInfo, long warePrice, short maxWareContent,
			short stdWareOuts, String lastTime, String idUseFlag, String reserve) {
		this.id = id;
		this.PWareInfoVersion = PWareInfoVersion;
		this.PGoodsInfo = PGoodsInfo;
		this.warePrice = warePrice;
		this.maxWareContent = maxWareContent;
		this.stdWareOuts = stdWareOuts;
		this.lastTime = lastTime;
		this.idUseFlag = idUseFlag;
		this.reserve = reserve;
	}

	public PWareInfoId getId() {
		return this.id;
	}

	public void setId(PWareInfoId id) {
		this.id = id;
	}

	public PWareInfoVersion getPWareInfoVersion() {
		return this.PWareInfoVersion;
	}

	public void setPWareInfoVersion(PWareInfoVersion PWareInfoVersion) {
		this.PWareInfoVersion = PWareInfoVersion;
	}

	public PGoodsInfo getPGoodsInfo() {
		return this.PGoodsInfo;
	}

	public void setPGoodsInfo(PGoodsInfo PGoodsInfo) {
		this.PGoodsInfo = PGoodsInfo;
	}

	public long getWarePrice() {
		return this.warePrice;
	}

	public void setWarePrice(long warePrice) {
		this.warePrice = warePrice;
	}

	public short getMaxWareContent() {
		return this.maxWareContent;
	}

	public void setMaxWareContent(short maxWareContent) {
		this.maxWareContent = maxWareContent;
	}

	public short getStdWareOuts() {
		return this.stdWareOuts;
	}

	public void setStdWareOuts(short stdWareOuts) {
		this.stdWareOuts = stdWareOuts;
	}

	public String getLastTime() {
		return this.lastTime;
	}

	public void setLastTime(String lastTime) {
		this.lastTime = lastTime;
	}

	public String getIdUseFlag() {
		return this.idUseFlag;
	}

	public void setIdUseFlag(String idUseFlag) {
		this.idUseFlag = idUseFlag;
	}

	public String getReserve() {
		return this.reserve;
	}

	public void setReserve(String reserve) {
		this.reserve = reserve;
	}

}