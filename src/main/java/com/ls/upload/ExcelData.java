package com.ls.upload;

import java.util.List;

public class ExcelData {
	
	private String sheetName;
	
	private List<List<String>> lines;

	public String getSheetName() {
		return sheetName;
	}

	public void setSheetName(String sheetName) {
		this.sheetName = sheetName;
	}

	public List<List<String>> getLines() {
		return lines;
	}

	public void setLines(List<List<String>> lines) {
		this.lines = lines;
	}

	@Override
	public String toString() {
		return "ExcelData [sheetName=" + sheetName + ", lines=" + lines + "]";
	}

	

}
