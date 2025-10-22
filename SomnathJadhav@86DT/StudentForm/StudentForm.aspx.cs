using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class StudentForm_StudentForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\SomnathJadhav@86DT\App_Data\Database.mdf;Integrated Security=True");
        SqlCommand cmd = new SqlCommand("INSERT INTO STUDENTS(Name, Class, RollNo, DOB, PhoneNo, Email) VALUES (@name, @class, @rollno, @DOB, @phone, @email)", conn);
        cmd.Parameters.AddWithValue("@name", TextBox1.Text);
        cmd.Parameters.AddWithValue("@class", TextBox7.Text);
        cmd.Parameters.AddWithValue("@rollno", TextBox8.Text);
        cmd.Parameters.AddWithValue("@DOB", TextBox9.Text);
        cmd.Parameters.AddWithValue("@phone", TextBox10.Text);
        cmd.Parameters.AddWithValue("@email", TextBox11.Text);
        conn.Open();
        int res = cmd.ExecuteNonQuery();
        conn.Close();

        if (res == 1)
        {
            Label8.Text = "Record Saved Successfully";
        }
        else
        {
            Label8.Text = "Error while inserting!";
        }

    }
}