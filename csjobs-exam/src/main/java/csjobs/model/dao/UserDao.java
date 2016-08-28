package csjobs.model.dao;

import java.util.List;

import csjobs.model.Job;
import csjobs.model.User;

public interface UserDao {

    User getUser( Long id );

    
    User getUser( String email );

    User saveUser( User user );

    List<User> getUsers();


	User getUserByUsername(String username);
}
