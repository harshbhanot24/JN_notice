package com.jnnotice.model;

public class Trade {
@Override
	public String toString() {
		return "Trade [TradeShort=" + TradeShort + ", TradeFull=" + TradeFull + ", active=" + active + ", NID=" + NID
				+ "]";
	}
String TradeShort=null;
String TradeFull=null;
boolean active=true;
int NID;
public boolean isActive() {
	return active;
}
public void setActive(boolean active) {
	this.active = active;
}
public int getNID() {
	return NID;
}
public void setNID(int nID) {
	NID = nID;
}
public String getTradeShort() {
	return TradeShort;
}
public void setTradeShort(String tradeShort) {
	TradeShort = tradeShort;
}
public String getTradeFull() {
	return TradeFull;
}
public void setTradeFull(String tradeFull) {
	if(tradeFull.equalsIgnoreCase("ece")){
		TradeFull="Electronics and Communication Engineering";
	}
	if(tradeFull.equalsIgnoreCase("ME")){
		TradeFull="MEchanical Engineering";
	}
	if(tradeFull.equalsIgnoreCase("CE")){
		TradeFull="Civil Engineering";
	}
	if(tradeFull.equalsIgnoreCase("TE")){
		TradeFull="Textile Engineering";
	}
	if(tradeFull.equalsIgnoreCase("AP")){
		TradeFull="Applied Sciences";
	}
	
}

}
