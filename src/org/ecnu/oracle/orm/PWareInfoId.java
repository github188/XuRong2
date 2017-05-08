package org.ecnu.oracle.orm;

// Generated 2013-3-7 21:12:37 by Hibernate Tools 3.4.0.CR1

/**
 * PWareInfoId generated by hbm2java
 */
public class PWareInfoId implements java.io.Serializable {

	private long versionNo;
	private String passNo;

	public PWareInfoId() {
	}

	public PWareInfoId(long versionNo, String passNo) {
		this.versionNo = versionNo;
		this.passNo = passNo;
	}

	public long getVersionNo() {
		return this.versionNo;
	}

	public void setVersionNo(long versionNo) {
		this.versionNo = versionNo;
	}

	public String getPassNo() {
		return this.passNo;
	}

	public void setPassNo(String passNo) {
		this.passNo = passNo;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof PWareInfoId))
			return false;
		PWareInfoId castOther = (PWareInfoId) other;

		return (this.getVersionNo() == castOther.getVersionNo())
				&& ((this.getPassNo() == castOther.getPassNo()) || (this
						.getPassNo() != null && castOther.getPassNo() != null && this
						.getPassNo().equals(castOther.getPassNo())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + (int) this.getVersionNo();
		result = 37 * result
				+ (getPassNo() == null ? 0 : this.getPassNo().hashCode());
		return result;
	}

}
