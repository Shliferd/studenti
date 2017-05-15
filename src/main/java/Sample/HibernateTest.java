package Sample;

import com.studenti.model.student;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import javax.persistence.Query;
import java.util.List;


/**
 * Created by Andrei on 14.05.2017.
 */
public class HibernateTest {


    public static void main(String[] args){
//        student student=new student();
//        student.setIdStudent(3);
//        student.setUsername("altceva");
//        student.setPassword("123");
//        student.setName("Vladoiu");
//        student.setForname("Ion");
//        student.setCredits(20);

        SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
        Session session=sessionFactory.openSession();
        session.beginTransaction();

        Query query=session.createQuery("SELECT u FROM student u WHERE u.name = ?1");
        query.setParameter(1,"Pop");
        List<student> result=query.getResultList();
        for(student student :result){
            System.out.println(student.toString());
        }
        //session.getTransaction().commit();
        session.close();

    }
}
