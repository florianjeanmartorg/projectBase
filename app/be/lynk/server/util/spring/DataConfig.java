//package be.lynk.server.util.spring;
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.jdbc.datasource.DriverManagerDataSource;
//import org.springframework.orm.jpa.JpaTransactionManager;
//import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
//import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
//import org.springframework.transaction.PlatformTransactionManager;
//import org.springframework.transaction.annotation.EnableTransactionManagement;
//import play.Play;
//
//import javax.persistence.EntityManagerFactory;
//import javax.sql.DataSource;
//import java.util.HashMap;
//
//@Configuration
//@EnableTransactionManagement
//public class DataConfig {
//
//    @Bean
//    public EntityManagerFactory entityManagerFactory() {
//        HibernateJpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
//        vendorAdapter.setShowSql(true);
//        vendorAdapter.setGenerateDdl(true);
//        LocalContainerEntityManagerFactoryBean entityManagerFactory = new LocalContainerEntityManagerFactoryBean();
//        entityManagerFactory.setPackagesToScan("be.lynk.server.model.entities");
//        entityManagerFactory.setJpaVendorAdapter(vendorAdapter);
//        entityManagerFactory.setDataSource(dataSource());
//        entityManagerFactory.setJpaPropertyMap(new HashMap<String, String>(){{
//            put("hibernate.hbm2ddl.auto", "update");
//            put("hibernate.dialect", "org.hibernate.dialect.PostgreSQL82Dialect");
//        }});
//        entityManagerFactory.afterPropertiesSet();
//        return entityManagerFactory.getObject();
//    }
//
//    @Bean
//    public PlatformTransactionManager transactionManager() {
//        JpaTransactionManager transactionManager = new JpaTransactionManager(entityManagerFactory());
//
//        return transactionManager;
//    }
//
//    @Bean
//    public DataSource dataSource() {
//        final DriverManagerDataSource dataSource = new DriverManagerDataSource();
//        dataSource.setDriverClassName(Play.application().configuration().getString("db.default.driver"));
//        dataSource.setUrl(Play.application().configuration().getString("db.default.url"));
//        dataSource.setPassword("play");
//        dataSource.setUsername("play");
//        return dataSource;
//    }
//
//}