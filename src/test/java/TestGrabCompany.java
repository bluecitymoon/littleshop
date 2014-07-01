import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ls.entity.Company;
import com.ls.grab.GrapImgUtil;
import com.ls.grab.HtmlParserUtil;
import com.ls.grab.HttpClientGrabUtil;
import com.ls.repository.CompanyRepository;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class TestGrabCompany {

	@Autowired
	private CompanyRepository companyRepository;

	@Test
	public void testGrabCompany() {

		String testURL = "http://su.58.com/meirongshi/pn0";

		String htmlForPage = HttpClientGrabUtil.fetchHTMLwithURL(testURL);

		List<Company> companiesInThisPage = HtmlParserUtil.findPagedCompanyList(htmlForPage);

		for (Company company : companiesInThisPage) {

			String companyDetailUrl = company.getfEurl();
			String detailPageHtml = HttpClientGrabUtil.fetchHTMLwithURL(companyDetailUrl);

			String companyName = HtmlParserUtil.findCompanyName(detailPageHtml);
			company.setName(companyName);

			String contactor = HtmlParserUtil.findContactorName(detailPageHtml);
			company.setContactor(contactor);

			String phoneImgSrc = HtmlParserUtil.findContactorPhoneNumberImgSrc(detailPageHtml);
			company.setPhoneSrc(phoneImgSrc);

			String imgFileNameAfterGrabed = GrapImgUtil.grabImgWithSrc(phoneImgSrc);
			company.setPhoneSrc(imgFileNameAfterGrabed);

			companyRepository.save(company);

		}
	}

}
