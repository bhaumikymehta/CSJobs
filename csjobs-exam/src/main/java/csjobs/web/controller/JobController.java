package csjobs.web.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;

import csjobs.model.User;
import csjobs.model.dao.JobDao;
import csjobs.web.editor.UserPropertyEditor;

@Controller
public class JobController {

    @Autowired
    private JobDao jobDao;

    @Autowired
    private WebApplicationContext context;

    @InitBinder
    public void initBinder( WebDataBinder binder )
    {
        binder.registerCustomEditor( User.class,
            (UserPropertyEditor) context.getBean( "userPropertyEditor" ) );
        
        binder.registerCustomEditor( Date.class,
            new CustomDateEditor( new SimpleDateFormat( "M/d/yyyy" ), true ) );
    }
    @RequestMapping({ "/index.html", "/job/list.html" })
    public String list( ModelMap models )
    {
        models.put( "openJobs", jobDao.getOpenJobs() );
        return "job/list";
    }

    @RequestMapping("/job/view.html")
    public String view( @RequestParam Long id, ModelMap models )
    {
        models.put( "job", jobDao.getJob( id ) );
        return "job/view";
    }

}
