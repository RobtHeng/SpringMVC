import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class TestDML {

	public static void main(String[] args) {
		// TODO �Զ����ɵķ������
		Connection conn=null;
		Statement stment=null;
		ResultSet rs=null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			 conn=DriverManager.getConnection("jdbc:sqlserver://127.0.1:1433;DatabaseName=OES_NULL0409","sa","sa");
			 stment=conn.createStatement();
			 rs=stment.executeQuery(" select *from sys_dept where is_stop=0 and is_last=1");
			while(rs.next()){
				System.out.println(rs.getString("dept_code"));
				System.out.println(rs.getString("dept_name"));
				System.out.println("");
			}
		
		} catch (ClassNotFoundException e) {
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
				try {
					if(conn!=null){
						conn.close();
						conn=null;
					}
					if(stment!=null){
						stment.close();
						stment=null;
					}
					if(rs!=null){
						rs.close();
						rs=null;
					}
				} catch (SQLException e) {
					// TODO �Զ����ɵ� catch ��
					e.printStackTrace();
				}
				
			}
		}
}


