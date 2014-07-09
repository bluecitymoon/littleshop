package com.ls.upload;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelReader {

	public static void main(String[] args) {

		String fileName = "D:\\data\\Jerry\\littleshop\\db_schema\\test.xlsx";

		try {
			List<ExcelData>  readExcel = readExcel(fileName);
			
			for (ExcelData excelData : readExcel) {
				System.out.println(excelData.toString());
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static List<ExcelData> readExcel(String fileName) throws IOException {
		List<ExcelData> result = new ArrayList<ExcelData>();
		
		XSSFWorkbook xwb = new XSSFWorkbook(fileName);

		int sheetCount = 0;
		try {

			for (; sheetCount < 10; sheetCount++) {
				xwb.getSheetName(sheetCount);
			}

		} catch (java.lang.IllegalArgumentException e) {
			System.out.println(sheetCount);
		}

		XSSFRow row;
		String cell;
		for (int k = 0; k < sheetCount; k++) {
			
			XSSFSheet sheet = xwb.getSheetAt(k);
			ExcelData excelData = new ExcelData();
			excelData.setSheetName(sheet.getSheetName());
			
			List<List<String>> rows = new ArrayList<List<String>>();
			
			excelData.setLines(rows);
			
			result.add(excelData);
			for (int i = sheet.getFirstRowNum(); i < sheet.getPhysicalNumberOfRows(); i++) {
				row = sheet.getRow(i);
				List<String> cells = new ArrayList<String>();
				if (!isEmptyRow(row)) {
					for (int j = row.getFirstCellNum(); j < row.getPhysicalNumberOfCells(); j++) {
						cell = row.getCell(j) == null ? "" : row.getCell(j).toString();
						cells.add(cell);
					}
				}
				
				rows.add(cells);
			}
		}

		return result;
	}

	public static boolean isEmptyRow(XSSFRow row) {

		for (int j = row.getFirstCellNum(); j < row.getPhysicalNumberOfCells(); j++) {
			String cell = row.getCell(j) == null ? "" : row.getCell(j).toString();

			if (StringUtils.isNotBlank(cell)) {
				return false;
			}
		}

		return true;
	}
}
