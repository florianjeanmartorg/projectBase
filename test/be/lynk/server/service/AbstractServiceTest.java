//package be.lynk.server.service;
//
//import be.lynk.server.controller.technical.security.CommonSecurityController;
//import be.lynk.server.dto.MyselfDTO;
//import be.lynk.server.dto.post.AccountRegistrationDTO;
//import be.lynk.server.dto.post.CustomerRegistrationDTO;
//import be.lynk.server.dto.post.LoginDTO;
//import be.lynk.server.dto.technical.DTO;
//import be.lynk.server.model.GenderEnum;
//import be.lynk.server.model.entities.technical.AbstractEntity;
//import be.lynk.server.util.exception.MyRuntimeException;
//import com.fasterxml.jackson.databind.JsonNode;
//import org.junit.AfterClass;
//import org.junit.Before;
//import org.junit.BeforeClass;
//import org.junit.Test;
//import org.springframework.context.ApplicationContext;
//import org.springframework.context.ApplicationContextAware;
//import play.Logger;
//import play.db.jpa.JPA;
//import play.db.jpa.JPAPlugin;
//import play.libs.F;
//import play.libs.Json;
//import play.mvc.Result;
//import play.test.FakeApplication;
//import play.test.FakeRequest;
//import play.test.Helpers;
//import scala.Option;
//
//import javax.persistence.EntityManager;
//import javax.persistence.criteria.CriteriaBuilder;
//import javax.persistence.criteria.CriteriaDelete;
//import javax.persistence.criteria.Root;
//import javax.persistence.metamodel.ManagedType;
//import javax.persistence.metamodel.Type;
//import javax.transaction.NotSupportedException;
//import javax.transaction.SystemException;
//import java.util.ArrayList;
//import java.util.Iterator;
//import java.util.List;
//import java.util.Set;
//import java.util.function.Function;
//import java.util.function.Predicate;
//import java.util.stream.Collectors;
//
//import static java.lang.Thread.sleep;
//import static org.junit.Assert.assertEquals;
//import static play.test.Helpers.*;
//
///**
// * Created by florian on 19/04/15.
// */
//public abstract class AbstractServiceTest implements ApplicationContextAware {
//
//    protected static final String FIRSTNAME = "firstname";
//    protected static final String LASTNAME = "lastname";
//    protected static final String EMAIL = "my@email.com";
//    protected static final String PASSWORD = "password";
//    protected boolean connected = false;
//
//    protected static EntityManager em;
//    protected ApplicationContext applicationContext;
//
//    public void setApplicationContext(ApplicationContext applicationContext) {
//        this.applicationContext = applicationContext;
//    }
//
//    @BeforeClass
//    public static void setUp() {
//
//        FakeApplication app = Helpers.fakeApplication();
//        Helpers.start(app);
//        // TODO - this needs to be tunned
//        // wait 2 seconds to be sure app is started on all environments
//        try {
//            sleep(2000);
//        } catch (Exception e) {
//            // do nothing
//        }
//
//        Option<JPAPlugin> jpaPlugin = app.getWrappedApplication().plugin(JPAPlugin.class);
//        em = jpaPlugin.get().em("default");
//        JPA.bindForCurrentThread(em);
//
//        em.getTransaction().begin();
//    }
//
//    // after class
//    @AfterClass
//    public static void tearDown() {
//        em.getTransaction().rollback();
//
//        JPA.bindForCurrentThread(null);
//        if (em.isOpen()) {
//            em.close();
//        }
//    }
//
//}
