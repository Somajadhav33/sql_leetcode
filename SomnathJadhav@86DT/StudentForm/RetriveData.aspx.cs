using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class StudentForm_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\SomnathJadhav@86DT\App_Data\Database.mdf;Integrated Security=True");
        SqlCommand cmd = new SqlCommand("SELECT * FROM STUDENTS WHERE Name = @name", conn);

        cmd.Parameters.AddWithValue("@name", TextBox1.Text.Trim());
        conn.Open();
        SqlDataReader res = cmd.ExecuteReader();

        if (res.HasRows)
        {
            while (res.Read())
            {
                Label10.Text = res["Id"].ToString();
                Label11.Text = res["Name"].ToString();
                Label12.Text = res["Class"].ToString();
                Label13.Text = res["RollNo "].ToString();
                Label14.Text = res["DOB"].ToString();
                Label15.Text = res["PhoneNo"].ToString();
                Label16.Text = res["Email"].ToString();
                Label17.Text = "Record Found!";
            }
        }
        else
        {
            Label10.Text = "NULL";
            Label11.Text = "NULL";
            Label12.Text = "NULL";
            Label13.Text = "NULL";
            Label14.Text = "NULL";
            Label15.Text = "NULL";
            Label16.Text = "NULL";
            Label17.Text = "Record Not Found!";
        }
        conn.Close();
    }

}