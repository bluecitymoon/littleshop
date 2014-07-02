package com.ls.grab;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.htmlparser.Node;
import org.htmlparser.NodeFilter;
import org.htmlparser.Parser;
import org.htmlparser.Tag;
import org.htmlparser.nodes.TagNode;
import org.htmlparser.tags.ImageTag;
import org.htmlparser.tags.InputTag;
import org.htmlparser.tags.LinkTag;
import org.htmlparser.tags.Span;
import org.htmlparser.tags.TableColumn;
import org.htmlparser.tags.TableHeader;
import org.htmlparser.tags.TableRow;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;
import org.htmlparser.visitors.NodeVisitor;

import com.ls.entity.Company;

public class HtmlParserUtilPlanB {

	public static void main(String[] args) {

		File file = new File("D:\\Jerry\\58.txt");

		//
		// try {
		// String string = Files.toString(file, Charset.defaultCharset());
		//
		// System.out.println(findContactorName(string));
		//
		// System.out.println(findContactorPhoneNumberImgSrc(string));
		//
		// } catch (IOException e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// }
	}

	public static List<Company> findPagedCompanyList(String wholeCityPageHTML) {

		final List<Company> companyList = new ArrayList<Company>();

		try {

			Parser htmlParser = new Parser();
			htmlParser.setInputHTML(wholeCityPageHTML);

			NodeVisitor nodeVisitor = new NodeVisitor() {

				@Override
				public void visitTag(Tag tag) {

					super.visitTag(tag);

					if (TagFinderUtil.findCompanyLink(tag)) {
						LinkTag linkTag = (LinkTag) tag;
						Company company = new Company();
						company.setName(StringUtils.trimToEmpty(tag.getAttribute("title")));
						company.setfEurl(tag.getAttribute("href"));
						companyList.add(company);

					}
				}
			};

			htmlParser.visitAllNodesWith(nodeVisitor);

		} catch (ParserException e) {

			e.printStackTrace();
		}

		return companyList;
	}

	public static String findCompanyName(String detailPageHtml) {

		final StringBuilder comanyName = new StringBuilder();

		try {

			Parser htmlParser = new Parser();
			htmlParser.setInputHTML(detailPageHtml);

			NodeVisitor nodeVisitor = new NodeVisitor() {

				@Override
				public void visitTag(Tag tag) {

					super.visitTag(tag);

					if (TagFinderUtil.findCompanyName(tag)) {

						Node[] childList = tag.getChildren().toNodeArray();

						for (Node node : childList) {

							if (node instanceof LinkTag) {
								LinkTag nodeLink = (LinkTag) node;
								comanyName.append(StringUtils.trimToEmpty(nodeLink.getStringText()));
							}
						}
					}
				}
			};

			htmlParser.visitAllNodesWith(nodeVisitor);

		} catch (ParserException e) {

			e.printStackTrace();
		}

		return comanyName.toString();
	}

	public static String findContactorPhoneNumberImgSrc(String detailPageHtml) {

		final StringBuilder contactorsPhoneImgSrcBuilder = new StringBuilder();

		try {

			Parser htmlParser = new Parser();
			htmlParser.setInputHTML(detailPageHtml);

			htmlParser.extractAllNodesThatMatch(new NodeFilter() {

				private static final long serialVersionUID = -93037936232004146L;

				public boolean accept(Node node) {
					if (node instanceof TableRow) {
						TableRow row = (TableRow) node;

						Node[] nodeList = row.getChildren().toNodeArray();

						// find header, find column
						boolean contactorHeaderFound = false;
						for (int i = 0; i < nodeList.length; i++) {
							Node current = nodeList[i];

							// find title hardly
							if (!contactorHeaderFound && current instanceof TableHeader) {

								TableHeader th = (TableHeader) current;
								String tdConent = th.getStringText();

								// found!!!!!!
								if (tdConent.trim().contains("联系人")) {
									contactorHeaderFound = true;
								}
							}

							// find his name after title found!!
							if (contactorHeaderFound && current instanceof TableColumn) {
								TableColumn td = (org.htmlparser.tags.TableColumn) current;

								if (td.getAttribute("class") != null && td.getAttribute("class").equals("telNum")) {

									Node[] list = td.getChildren().toNodeArray();
									for (Node img : list) {

										if (img instanceof ImageTag) {

											ImageTag imageTag = (ImageTag) img;

											contactorsPhoneImgSrcBuilder.append(imageTag.getImageURL());

											return true;
										}
									}
								}
							}

						}
					}
					return false;
				}
			});

		} catch (ParserException e) {

		}

		return contactorsPhoneImgSrcBuilder.toString();

	}

	public static String findContactorEmailImgSrc(String detailPageHtml) {

		final StringBuilder contactorsEmailSrcBuilder = new StringBuilder();

		try {

			Parser htmlParser = new Parser();
			htmlParser.setInputHTML(detailPageHtml);

			htmlParser.extractAllNodesThatMatch(new NodeFilter() {

				private static final long serialVersionUID = -93037936232004146L;

				public boolean accept(Node node) {
					if (node instanceof TableRow) {
						TableRow row = (TableRow) node;

						Node[] nodeList = row.getChildren().toNodeArray();

						// find header, find column
						boolean contactorHeaderFound = false;
						for (int i = 0; i < nodeList.length; i++) {
							Node current = nodeList[i];

							// find title hardly
							if (!contactorHeaderFound && current instanceof TableHeader) {

								TableHeader th = (TableHeader) current;
								String tdConent = th.getStringText();

								// found!!!!!!
								if (tdConent.trim().contains("邮箱")) {
									contactorHeaderFound = true;
								}
							}

							// find his email after title found!!
							if (contactorHeaderFound && current instanceof TableColumn) {
								TableColumn td = (org.htmlparser.tags.TableColumn) current;

								Node[] list = td.getChildren().toNodeArray();
								for (Node img : list) {

									if (img instanceof ImageTag) {

										ImageTag imageTag = (ImageTag) img;

										contactorsEmailSrcBuilder.append(imageTag.getImageURL());

										return true;
									}
								}
							}

						}
					}
					return false;
				}
			});

		} catch (ParserException e) {

		}
		System.out.println(contactorsEmailSrcBuilder.toString());
		
		return contactorsEmailSrcBuilder.toString();

	}

	public static String findContactorName(String detailPageHtml) {
		final StringBuilder contactorsBuilder = new StringBuilder();

		try {

			Parser htmlParser = new Parser();
			htmlParser.setInputHTML(detailPageHtml);

			htmlParser.extractAllNodesThatMatch(new NodeFilter() {

				private static final long serialVersionUID = -93037936232004146L;

				public boolean accept(Node node) {
					if (node instanceof TableRow) {
						TableRow row = (TableRow) node;

						Node[] nodeList = row.getChildren().toNodeArray();

						// find header, find column
						boolean contactorHeaderFound = false;
						for (int i = 0; i < nodeList.length; i++) {
							Node current = nodeList[i];

							// find title hardly
							if (!contactorHeaderFound && current instanceof TableHeader) {

								TableHeader th = (TableHeader) current;
								String tdConent = th.getStringText();

								// found!!!!!!
								if (tdConent.trim().contains("联系人")) {
									contactorHeaderFound = true;
								}
							}

							// find his name after title found!!
							if (contactorHeaderFound && current instanceof TableColumn) {
								TableColumn td = (org.htmlparser.tags.TableColumn) current;

								contactorsBuilder.append(td.getStringText().trim());

								return true;
							}

						}
					}
					return false;
				}
			});

		} catch (ParserException e) {

		}

		return contactorsBuilder.toString();
	}

	public static Node findNodeById(String html, final String divId) {

		try {

			Parser htmlParser = new Parser();
			htmlParser.setInputHTML(html);

			Node[] nodes = htmlParser.extractAllNodesThatMatch(new NodeFilter() {

				public boolean accept(Node node) {

					if (node instanceof TagNode) {
						TagNode tag = (TagNode) node;

						String id = StringUtils.trimToEmpty(tag.getAttribute("id"));

						if (StringUtils.isNotBlank(id) && divId.equals(id)) {
							return true;
						}
					}
					return false;
				}
			}).toNodeArray();

			if (null != nodes && nodes.length > 0) {
				Node foundNode = nodes[0];
				return foundNode;
			}

		} catch (ParserException e) {

			e.printStackTrace();
		}

		return null;
	}

	public static String findCompanyAddress(String detailPageHtml) {


		final StringBuilder address = new StringBuilder();

		try {

			Parser htmlParser = new Parser();
			htmlParser.setInputHTML(detailPageHtml);

			htmlParser.extractAllNodesThatMatch(new NodeFilter() {

				private static final long serialVersionUID = -93037936232004146L;

				public boolean accept(Node node) {
					if (node instanceof TableRow) {
						TableRow row = (TableRow) node;

						Node[] nodeList = row.getChildren().toNodeArray();

						// find header, find column
						boolean contactorHeaderFound = false;
						for (int i = 0; i < nodeList.length; i++) {
							Node current = nodeList[i];

							// find title hardly
							if (!contactorHeaderFound && current instanceof TableHeader) {

								TableHeader th = (TableHeader) current;
								String tdConent = th.getStringText();

								// found!!!!!!
								if (tdConent.trim().contains("公司地址")) {
									contactorHeaderFound = true;
								}
							}

							// find his name after title found!!
							if (contactorHeaderFound && current instanceof TableColumn) {
								TableColumn td = (org.htmlparser.tags.TableColumn) current;

								if (td.getAttribute("class") != null && td.getAttribute("class").equals("adress")) {

									Node[] list = td.getChildren().toNodeArray();
									for (Node span : list) {

										if (span instanceof Span) {

											Span spanTag = (Span) span;

											address.append(spanTag.getStringText().trim());

											return true;
										}
									}
								}
							}

						}
					}
					return false;
				}
			});

		} catch (ParserException e) {

		}

		return address.toString();

	
	}
}
