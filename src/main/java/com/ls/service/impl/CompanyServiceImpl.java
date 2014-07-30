package com.ls.service.impl;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.ls.entity.Company;
import com.ls.entity.Problem;
import com.ls.entity.Step;
import com.ls.repository.CompanyRepository;
import com.ls.repository.ProblemRepository;
import com.ls.repository.StepRepository;
import com.ls.service.CompanyService;

@Service("companyService")
public class CompanyServiceImpl implements CompanyService {

	@Autowired
	private CompanyRepository companyRepository;

	@Autowired
	private ProblemRepository problemRepository;

	@Autowired
	private StepRepository stepRepository;

	public List<Company> findCompany(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Company> findAllCompanies() {
		return companyRepository.findAll();
	}

	public Page<Company> getCompanyInPage(Integer index) {

		return companyRepository.findAll(new PageRequest(index, 10));
	}

	public Problem saveProblem(Problem problem) {

		return problemRepository.save(problem);
	}

	public Step saveStep(Step step) {

		return stepRepository.save(step);
	}

	@Override
	public Page<Company> getCompanyInPage(String companyNameParam, String contactorParam, String starParam, String allStarCheckboxParam, String distinctParam, Integer pageNumber) {
		Page<Company> companyPage = companyRepository.findAll(generateSpecification(companyNameParam, contactorParam, starParam, allStarCheckboxParam, distinctParam), new PageRequest(pageNumber, 10));
		
		return companyPage;
	}

	private Specification<Company> generateSpecification(final String companyNameParam, final String contactorParam, final String starParam, final String allStarCheckboxParam, final String distinctParam) {
		return new Specification<Company>() {

			@Override
			public Predicate toPredicate(Root<Company> root, CriteriaQuery<?> query, CriteriaBuilder cb) {

				Predicate predicate = cb.conjunction();
				
				if (StringUtils.isNotBlank(companyNameParam)) {
					predicate.getExpressions().add(cb.like(root.<String> get("name"), "%" + companyNameParam.trim() + "%"));
				}
				
				if (StringUtils.isNotBlank(contactorParam)) {
					predicate.getExpressions().add(cb.equal(root.<String> get("contactor"), contactorParam.trim()));
				}
				
				if (StringUtils.isNotBlank(distinctParam)) {
					predicate.getExpressions().add(cb.equal(root.<String> get("area"), distinctParam.trim()));
				}
				
				if (StringUtils.isNotBlank(allStarCheckboxParam)) {
					
					//all star true : ignore star value
					if (allStarCheckboxParam.trim().equalsIgnoreCase("false")) {
						predicate.getExpressions().add(cb.equal(root.<String> get("star"), Integer.valueOf(starParam)));
					}
				}
				return predicate;
			}
		};

	}
}
