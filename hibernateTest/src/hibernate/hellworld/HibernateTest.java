package hibernate.hellworld;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.jdbc.Work;
import org.hibernate.service.ServiceRegistry;
import org.junit.Test;

public class HibernateTest {

	@Test
	public void test() {
		
		//1.创建一个SessionFactory 对象
		SessionFactory sessionFactory=null;
		//1). 创建Configuration 对象：对应hibernate 的基本配置信息和对象关系映射信息
		Configuration configuration=new Configuration().configure();
		// 创建服务注册对象（hibernate4.35之后该方法就不能再获取到实体信息了）
//		ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
//		        .applySettings(configuration.getProperties()).build();
		// 创建会话工厂对象
//		sessionFactory = configuration.buildSessionFactory(serviceRegistry);
		
		sessionFactory = configuration.buildSessionFactory();
		
		Session session=sessionFactory.openSession();
		
		Transaction transaction=session.beginTransaction();
		//configuration.addClass(News.class);
		News news=new News("Java","ATGUIGU",new Date(new java.util.Date().getTime()));
		
		session.save(news);
		transaction.commit();
		session.close();
		sessionFactory.close();
		
		
		
	}
	
	@Test
	public void testDoWork(){
		//1.创建一个SessionFactory 对象
		SessionFactory sessionFactory=null;
		//1). 创建Configuration 对象：对应hibernate 的基本配置信息和对象关系映射信息
		Configuration configuration=new Configuration().configure();
		// 创建服务注册对象（hibernate4.35之后该方法就不能再获取到实体信息了）
//		ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
//		        .applySettings(configuration.getProperties()).build();
		// 创建会话工厂对象
//		sessionFactory = configuration.buildSessionFactory(serviceRegistry);
		
		sessionFactory = configuration.buildSessionFactory();
		
		Session session=sessionFactory.openSession();
		session.doWork(new Work(){

			@Override
			public void execute(Connection connection)
					throws SQLException {
				// TODO 自动生成的方法存根
				System.out.println(connection);
			}
		});
	}
	

}
