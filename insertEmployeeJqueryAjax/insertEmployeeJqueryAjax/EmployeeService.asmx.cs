using System;
using System.Collections.Generic;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Script.Serialization;

namespace insertEmployeeJqueryAjax
{
   
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class EmployeeService : System.Web.Services.WebService
    {
        [WebMethod]
        public void AddEmployee(Employee emp)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spAddNewEmployee", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name",emp.Name);
                cmd.Parameters.AddWithValue("@Gender", emp.Gender);
                cmd.Parameters.AddWithValue("@Phone", emp.Phone);
                cmd.Parameters.AddWithValue("@Email", emp.Email);
                cmd.Parameters.AddWithValue("@Age", emp.Age);
                cmd.Parameters.AddWithValue("@Salary", emp.Salary);
                con.Open();
                cmd.ExecuteNonQuery();
            }          
        }

        [WebMethod]
        public void GetAllEmployees()
        {
           List<Employee> listEmployee = new List<Employee>();
           string CS=ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString; 
           using(SqlConnection con=new SqlConnection(CS))
           {
               SqlCommand cmd = new SqlCommand("Select * from tbl_AddNewEmployee", con);
               cmd.CommandType = CommandType.Text;
               con.Open();
               SqlDataReader rdr = cmd.ExecuteReader();
               while(rdr.Read())
               {
                   Employee employee = new Employee();
                   employee.ID = Convert.ToInt32(rdr["ID"]);
                   employee.Name = rdr["Name"].ToString();
                   employee.Gender = rdr["Gender"].ToString();
                   employee.Phone = rdr["Phone"].ToString();
                   employee.Email = rdr["Email"].ToString();
                   employee.Age = Convert.ToInt32(rdr["Age"]);
                   employee.Salary = rdr["Salary"].ToString();

                   listEmployee.Add(employee);
               }
           }
           JavaScriptSerializer js = new JavaScriptSerializer();
           Context.Response.Write(js.Serialize(listEmployee));
        }


        [WebMethod]
        public void GetSingleEmployees(string id)
        {
            Employee employee = new Employee();
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("Select * from tbl_AddNewEmployee Where ID = "+ id +"", con);
                cmd.CommandType = CommandType.Text;
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                   
                    employee.ID = Convert.ToInt32(rdr["ID"]);
                    employee.Name = rdr["Name"].ToString();
                    employee.Gender = rdr["Gender"].ToString();
                    employee.Phone = rdr["Phone"].ToString();
                    employee.Email = rdr["Email"].ToString();
                    employee.Age = Convert.ToInt32(rdr["Age"]);
                    employee.Salary = rdr["Salary"].ToString();
                }
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(employee));
        } 

    }
}
