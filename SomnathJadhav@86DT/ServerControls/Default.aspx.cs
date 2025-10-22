using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label3.Text = "You selected: ";
        foreach (ListItem li in CheckBoxList1.Items)
        {
            if (li.Selected)
            {
                Label3.Text += " " + li;
            }
            
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label4.Text = "You selected: " + DropDownList1.SelectedItem.Text;
    }
    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label5.Text = "You selected: " + ListBox1.SelectedItem.Text;
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label6.Text = "You selected: " + RadioButtonList1.SelectedItem.Text;
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {

    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
    protected void TextBox1_TextChanged1(object sender, EventArgs e)
    {
        Label13.Text = "You Entered  : ";
        Label13.Text += TextBox1.Text;
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        Label14.Text = "Selected Date : ";
        Label14.Text += Calendar1.SelectedDate.ToLongDateString();
    }
}