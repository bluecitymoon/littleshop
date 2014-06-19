package com.ls.grap;

import org.htmlparser.Tag;


public class TagFinderUtil {
	
	public static boolean findCompanyLink(Tag tag) {
		boolean find = tag.getTagName().equalsIgnoreCase("a") && tag.getAttribute("class") != null && tag.getAttribute("class").equals("fl");
		
		return find;
	}

}
