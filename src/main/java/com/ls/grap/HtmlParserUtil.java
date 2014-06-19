package com.ls.grap;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;

import org.htmlparser.Parser;
import org.htmlparser.Tag;
import org.htmlparser.util.ParserException;
import org.htmlparser.visitors.NodeVisitor;

import com.google.common.io.Files;

public class HtmlParserUtil {

	public static void main(String[] args) {

		File file = new File("D:\\Jerry\\58.txt");

		try {
			// List<String> lines = Files.readLines(file, Charset.defaultCharset());
			String string = Files.toString(file, Charset.defaultCharset());

			Parser htmlParser = new Parser();
			htmlParser.setInputHTML(string);

			NodeVisitor nodeVisitor = new NodeVisitor(){

				@Override
				public void visitTag(Tag tag) {

					super.visitTag(tag);

					if (TagFinderUtil.findCompanyLink(tag)) {

						System.out.println(tag.getText());
						System.out.println(tag.getAttribute("href"));
					}
				}
			};

			htmlParser.visitAllNodesWith(nodeVisitor);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParserException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
