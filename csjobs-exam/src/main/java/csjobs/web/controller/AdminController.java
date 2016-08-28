package csjobs.web.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import csjobs.model.Application;
import csjobs.model.Job;
import csjobs.model.User;
import csjobs.model.dao.ApplicationDao;
import csjobs.model.dao.JobDao;
import csjobs.model.dao.UserDao;

@Controller
@SessionAttributes("newJob")
public class AdminController {

    @Autowired
	private UserDao userDao;

	@Autowired
	private JobDao jobDao;

	@Autowired
	private ApplicationDao applicationDao;

	@RequestMapping(value = "/admin.html")
	public String admin(ModelMap models) {
		List<Job> jobs = jobDao.getJobs();

		models.put("jobs", jobs);

		return "admin";
	}

	@RequestMapping("/viewAdmin.html")
	public String view(@RequestParam Long id, ModelMap models) {
		models.put("job", jobDao.getJob(id));
		return "admin/viewAdmin";
	}

	@RequestMapping(value = "/newJob.html", method = RequestMethod.GET)
	public String newJobGet(ModelMap models) {

		Job newJob = new Job();

		List<User> reviewers = new ArrayList<User>();
		List<User> users = userDao.getUsers();

		for (User u : users) {

			if (u.isReviewer()) {
				reviewers.add(u);
			}
		}

		models.put("reviewers", reviewers);
		models.put("newJob", newJob);

		return "admin/newJob";

	}

	@RequestMapping(value = "/newJob.html", method = RequestMethod.POST)
	public String newJobPost(@ModelAttribute Job newJob, ModelMap models,
			BindingResult bindingResult, SessionStatus sessionStatus,
			@RequestParam Long chairPersonId,
			@RequestParam List<Long> committeeMembersIds) {
		// setting chairperson
		User committeeChair = userDao.getUser(chairPersonId);
		newJob.setCommitteeChair(committeeChair);

		// setting the review committee

		List<User> reviewers = new ArrayList<User>();
		List<User> users = userDao.getUsers();
		List<User> committeeMembers = new ArrayList<User>();
		for (User u : users) {

			if (u.isReviewer()) {
				reviewers.add(u);
			}
		}

		for (Long i : committeeMembersIds) {
			for (User u : reviewers) {
				if (u.getId() == i) {
					committeeMembers.add(u);
				}

			}
		}
		// validating chair person is present in the committee or not
		boolean present = false;

		if (committeeMembers.contains(committeeChair)) {
			present = true;

		} else
			present = false;

		if (present == false) {
			committeeMembers.add(committeeChair);
		}
		// setting attribute commitee back

		newJob.setCommitteeMembers(committeeMembers);
		jobDao.saveJob(newJob);
		System.out.println("new job created successfully");
		return "redirect:/admin.html";

	}

	@RequestMapping(value = "/edit.html", method = RequestMethod.GET)
	public String editGet(ModelMap models, @RequestParam long jobId) {
		// models.get(key)
		List<User> reviewers = new ArrayList<User>();
		List<User> users = userDao.getUsers();

		for (User u : users) {

			if (u.isReviewer()) {
				reviewers.add(u);
			}
		}

		models.put("reviewers", reviewers);
		models.put("newJob", jobDao.getJob(jobId));

		return "admin/edit";

	}

	@RequestMapping(value = "/edit.html", method = RequestMethod.POST)
	public String editPost(@ModelAttribute Job newJob, ModelMap models,
			BindingResult bindingResult, SessionStatus sessionStatus,
			@RequestParam String publishDate,
	@RequestParam String closeDate,
	
			@RequestParam Long chairPersonId,
			@RequestParam List<Long> committeeMembersIds) {
		
		User committeeChair = userDao.getUser(chairPersonId);
		newJob.setCommitteeChair(committeeChair);

//working with dates
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		

		try {

			Date publish = formatter.parse(publishDate);
			Date close = formatter.parse(closeDate);
			
			System.out.println(publishDate);
			System.out.println(formatter.format(publish));
			System.out.println(closeDate);
			System.out.println(formatter.format(close));
			newJob.setPublishDate(publish);
			newJob.setCloseDate(close);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
	
		
		
		// setting the review committee

		List<User> reviewers = new ArrayList<User>();
		List<User> users = userDao.getUsers();
		List<User> committeeMembers = new ArrayList<User>();
		for (User u : users) {

			if (u.isReviewer()) {
				reviewers.add(u);
			}
		}

		for (Long i : committeeMembersIds) {
			for (User u : reviewers) {
				if (u.getId() == i) {
					committeeMembers.add(u);
				}

			}
		}
		// validating chair person is present in the committee or not
		boolean present = false;

		if (committeeMembers.contains(committeeChair)) {
			present = true;

		} else
			present = false;

		if (present == false) {
			committeeMembers.add(committeeChair);
		}
		// setting attribute commitee back

		newJob.setCommitteeMembers(committeeMembers);

		newJob = jobDao.saveJob(newJob);

		sessionStatus.setComplete();
		System.out.println("Successfully edited");
		return "redirect:/admin.html";

	}
	
	@RequestMapping(value = "/listApplication.html", method = RequestMethod.GET)
	public String listApplicationGet(ModelMap models, @RequestParam long jobId) {
		Job j=jobDao.getJob(jobId);
		List<Application> applications=applicationDao.getApplications(j);
		models.put("applications", applications);
		
		return "admin/listApplication";
	}
}
