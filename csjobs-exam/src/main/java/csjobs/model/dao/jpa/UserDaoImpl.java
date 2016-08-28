package csjobs.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import csjobs.model.User;
import csjobs.model.dao.UserDao;

@Repository
public class UserDaoImpl implements UserDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public User getUser( Long id )
    {
        return entityManager.find( User.class, id );
    }

    @Override
    public User getUser( String email )
    {
        String query = "from User user left join fetch user.roles "
            + "where lower(email) = :email";

        List<User> users = entityManager.createQuery( query, User.class )
            .setParameter( "email", email.toLowerCase() )
            .getResultList();
        return users.size() == 0 ? null : users.get( 0 );
    }

    @Override
    @Transactional
   // @PreAuthorize ("hasRole('ROLE_ADMIN') 	or principal.username == #user.username")
    public User saveUser( User user )
    {
        return entityManager.merge( user );
    }

	@Override
	public List<User> getUsers() {
		// TODO Auto-generated method stub
		
		  return entityManager.createQuery( "from User order by id", User.class )
		            .getResultList();

	}

	@Override
	public User getUserByUsername(String username) {
		// TODO Auto-generated method stub
		String query = "from User user left join fetch user.roles "
	            + "where lower(email) = :username";

	        List<User> users = entityManager.createQuery( query, User.class )
	            .setParameter( "username", username.toLowerCase() )
	            .getResultList();
	        return users.size() == 0 ? null : users.get( 0 );
	}
	
/*	@Override
	public User getUserByUsername(String username) {
		// TODO Auto-generated method stub
		String query = "from User user left join fetch user.roles "
	            + "where lower(email) = :username";

	        List<User> users = entityManager.createQuery( query, User.class )
	            .setParameter( "username", username.toLowerCase() )
	            .getResultList();
	        return users.size() == 0 ? null : users.get( 0 );
	}*/

}
