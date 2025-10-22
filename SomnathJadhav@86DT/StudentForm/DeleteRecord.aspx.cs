using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class StudentForm_DeleteRecord : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\SomnathJadhav@86DT\App_Data\Database.mdf;Integrated Security=True");
        SqlCommand cmd = new SqlCommand("DELETE FROM STUDENTS WHERE Name = @name", conn);
        cmd.Parameters.AddWithValue("@name", TextBox1.Text.Trim());
        conn.Open();
        int res = cmd.ExecuteNonQuery();
        conn.Close();

        if (res == 1)
        {
            Label3.Text = "Record Deleted Successfully";
        }
        else
        {
            Label3.Text = "Record Not Found!";
        }
    }
    

}