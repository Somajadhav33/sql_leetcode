using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string name = Session["Name"].ToString() ;
        string age = Session["Age"].ToString();
        string city = Session["City"].ToString();
        Label1.Text = "Name: " + name + "<br/>" +
                      "Age: " + age + "<br/>" +
                      "City: " + city;
    }
}