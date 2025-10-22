using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ImageUpload_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (FileUpload.HasFile)
        {
            string fp = FileUpload.FileName;
            //Response.Write("File Name=" + fp);
            string ext = System.IO.Path.GetExtension(fp).ToLower();
            //Response.Write("Extension=" + ext);

            if (ext == ".bmp" || ext == ".jpg" || ext == ".gif" || ext == ".png" || ext == ".jpeg")
            {
                FileUpload.SaveAs(Server.MapPath("uploads//") + fp);

                Image1.ImageUrl += "~/ImageUpload/uploads/" + fp;
                Label1.Text = "Image uploded Successfully ";
            }
            else
            {
                Label1.Text = "Invalid File.";
            }
           
        }
        Console.Read();
    }
}
