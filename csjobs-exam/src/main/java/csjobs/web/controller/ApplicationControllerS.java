package csjobs.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import csjobs.model.Application;
import csjobs.model.Degree;
import csjobs.model.Job;
import csjobs.model.User;
import csjobs.model.dao.ApplicationDao;
import csjobs.model.dao.JobDao;

@Controller
@SessionAttributes("application")
public class ApplicationControllerS {

	@Autowired
	private JobDao jobDao;

	@Autowired
	private ApplicationDao applicationDao;

	@Autowired
	ServletContext context;

	private File getFileDirectory() {

		String path = context.getRealPath("/WEB-INF/files");
		return new File(path);

	}

	@RequestMapping(value = "/application/apply.html", method = RequestMethod.GET)
	public String apply(@RequestParam Long jobId, HttpSession session,
			ModelMap models) {
		
		Job job = jobDao.getJob(jobId);
		User applicant = (User) session.getAttribute("authenticatedUser");
		Application application = applicationDao.getApplication(job, applicant);

		if (application != null && application.isSubmitted()) {
			models.put("errorCode", "error.application.submitted");
			return "error";
		}

		if (application == null)
			application = new Application(job, applicant);

		models.put("application", application);
		return "application/apply";
	}

	@RequestMapping(value = "/application/apply.html", method = RequestMethod.POST)
	public String apply(@ModelAttribute Application application,
			SessionStatus sessionStatus) {
		application = applicationDao.saveApplication(application);
		sessionStatus.setComplete();
		return "redirect:addDegree.html?applicationId=" + application.getId();
	}

	@RequestMapping(value = "/application/addDegree.html", method = RequestMethod.GET)
	public String addDegree(@RequestParam Long applicationId, ModelMap models) {
		models.put("application", applicationDao.getApplication(applicationId));
		models.put("degree", new Degree());
		return "application/addDegree";
	}

	@RequestMapping(value = "/application/addDegree.html", method = RequestMethod.POST)
	public String addDegree(@ModelAttribute Application application,
			@ModelAttribute Degree degree, SessionStatus sessionStatus) {
		application.getDegrees().add(degree);
		application = applicationDao.saveApplication(application);
		sessionStatus.setComplete();
		return "redirect:addDegree.html?applicationId=" + application.getId();
	}

	@RequestMapping(value = "/application/upload.html", method = RequestMethod.GET)
	public String uploadGet(@RequestParam Long applicationId, ModelMap models) {
		models.put("application", applicationDao.getApplication(applicationId));
		// models.put( "degree", new Degree() );

		return "application/upload";
	}

	@RequestMapping(value = "/application/upload.html", method = RequestMethod.POST)
	public String getUpload(@ModelAttribute Application application,
			 @RequestParam MultipartFile cv,
			@RequestParam MultipartFile ts, @RequestParam MultipartFile rs) throws IllegalStateException,
			IOException {
		// Save this file under web-inf/files

		System.out.println("Application entered ");

		//
		// if(cv==null && ts==null && rs==null){
		//
		// application=applicationDao.saveApplication(application);
		// System.out.println("Application saved without files uploaded ");
		// return "redirect:/";
		//
		// }
		//transfer to
		cv.transferTo(new File(getFileDirectory(), cv.getOriginalFilename()));
		ts.transferTo(new File(getFileDirectory(), ts.getOriginalFilename()));
		rs.transferTo(new File(getFileDirectory(), rs.getOriginalFilename()));
		
		//creating model objects
		csjobs.model.File cv1=new csjobs.model.File();
		Date d=new Date();
		cv1.setDate(d);
		String name=application.getId()+"cv"+cv.getOriginalFilename();
    	cv1.setName(name);
    	cv1.setOwner(application.getApplicant());
    	Long size=cv.getSize();
    	cv1.setSize(size);
    	String content=cv.getContentType();
    	cv1.setType(content);
    	application.setCv(cv1);
    	
    	
		csjobs.model.File rs1=new csjobs.model.File();
		rs1.setDate(d);
		 name=application.getId()+"rs"+rs.getOriginalFilename();
    	rs1.setName(name);
    	rs1.setOwner(application.getApplicant()); 
    	size=rs.getSize();
    	rs1.setSize(size);
    	content=rs.getContentType();
    	rs1.setType(content);
		application.setResearchStatement(rs1);
		
		csjobs.model.File ts1=new csjobs.model.File();
		ts1.setDate(d);
		name=application.getId()+"ts"+ts.getOriginalFilename();
    	ts1.setName(name);
    	ts1.setOwner(application.getApplicant());
    	size=ts.getSize();
    	ts1.setSize(size);
    	content=ts.getContentType();
    	ts1.setType(content);
		application.setTeachingStatement(ts1);
		
		
		application = applicationDao.saveApplication(application);
		System.out.println("Application saved with files uploaded");
		return "redirect:/application/view.html"+application.getId();
	}

	@RequestMapping(value = "/application/download.html", method = RequestMethod.GET)
	public String getDownload(@RequestParam Long fileId,
			@RequestParam Long applicationId, HttpServletResponse response)
			throws IllegalStateException, IOException {
		// Save this file under web-inf/files

		// creating file object
		csjobs.model.File file = new csjobs.model.File();

		Application app = applicationDao.getApplication(applicationId);

		if (app.getCv().getId() == fileId) {
			file = app.getCv();
		}
		if (app.getTeachingStatement().getId() == fileId) {
			file = app.getTeachingStatement();
		}
		if (app.getResearchStatement().getId() == fileId) {
			file = app.getResearchStatement();
		}

		// reading from file

		FileInputStream in = new FileInputStream(new File(getFileDirectory(),
				file.getName()));
		OutputStream out = response.getOutputStream();

		response.setHeader("Content-Disposition",
				"inline;filename=" + file.getName());

		// writing to the file
		byte[] buffer = new byte[2048];
		int bytesRead;
		while ((bytesRead = in.read(buffer)) > 0) {

			out.write(buffer, 0, bytesRead);
		}
		in.close();

		return null;
	}
}
