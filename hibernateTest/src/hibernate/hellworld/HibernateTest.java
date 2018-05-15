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
		
		//1.����һ��SessionFactory ����
		SessionFactory sessionFactory=null;
		//1). ����Configuration ���󣺶�Ӧhibernate �Ļ���������Ϣ�Ͷ����ϵӳ����Ϣ
		Configuration configuration=new Configuration().configure();
		// ��������ע�����hibernate4.35֮��÷����Ͳ����ٻ�ȡ��ʵ����Ϣ�ˣ�
//		ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
//		        .applySettings(configuration.getProperties()).build();
		// �����Ự��������
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
		//1.����һ��SessionFactory ����
		SessionFactory sessionFactory=null;
		//1). ����Configuration ���󣺶�Ӧhibernate �Ļ���������Ϣ�Ͷ����ϵӳ����Ϣ
		Configuration configuration=new Configuration().configure();
		// ��������ע�����hibernate4.35֮��÷����Ͳ����ٻ�ȡ��ʵ����Ϣ�ˣ�
//		ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
//		        .applySettings(configuration.getProperties()).build();
		// �����Ự��������
//		sessionFactory = configuration.buildSessionFactory(serviceRegistry);
		
		sessionFactory = configuration.buildSessionFactory();
		
		Session session=sessionFactory.openSession();
		session.doWork(new Work(){

			@Override
			public void execute(Connection connection)
					throws SQLException {
				// TODO �Զ����ɵķ������
				System.out.println(connection);
			}
		});
	}
	

}
