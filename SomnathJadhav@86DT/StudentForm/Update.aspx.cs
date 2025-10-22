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
    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\SomnathJadhav@86DT\App_Data\Database.mdf;Integrated Security=True");
        SqlCommand cmd = new SqlCommand("UPDATE STUDENTS SET Class = @class, RollNo = @rollno, DOB = @DOB, PhoneNo = @phone, Email = @email WHERE Name = @name", conn);

        cmd.Parameters.AddWithValue("@name", TextBox12.Text);
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
            TextBox12.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            TextBox9.Text = "";
            TextBox10.Text = "";
            TextBox11.Text = "";
            Label11.Text = "Record Updated Successfully";
        }
        else
        {
            Label11.Text = "Error while Updating!";
        }
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\SomnathJadhav@86DT\App_Data\Database.mdf;Integrated Security=True");
        SqlCommand cmd = new SqlCommand("SELECT * FROM STUDENTS WHERE Name = @name", conn);

        cmd.Parameters.AddWithValue("@name", TextBox12.Text.Trim());
        conn.Open();
        SqlDataReader res = cmd.ExecuteReader();

        if (res.Read()) 
        {
            TextBox12.Text = res["Name"].ToString();
            TextBox12.Enabled = true;
            TextBox7.Text = res["Class"].ToString();
            TextBox7.Enabled = true;
            TextBox8.Text = res["RollNo "].ToString();
            TextBox8.Enabled = true;
            TextBox9.Text = res["DOB"].ToString();
            TextBox9.Enabled = true;
            TextBox10.Text = res["PhoneNo"].ToString();
            TextBox10.Enabled = true;
            TextBox11.Text = res["Email"].ToString();
            TextBox11.Enabled = true;
        }
        else
        {
            TextBox12.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            TextBox9.Text = "";
            TextBox10.Text = "";
            TextBox11.Text = "";
        }

        conn.Close();
    }

}