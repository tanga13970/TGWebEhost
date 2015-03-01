using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text;
using System.Reflection;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Collections;
using System.ComponentModel;
using System.Drawing;
using System.Web.SessionState;
using System.Web.UI.HtmlControls;
using System.Collections;
using System.ComponentModel;
using System.Drawing;
using System.Globalization;
using System.Text.RegularExpressions;
using System.Web.SessionState;
using System.Web.UI.HtmlControls;
using DotNetNuke;
using DotNetNuke.Security;
using DotNetNuke.Data;
using DotNetNuke.Common;
using DotNetNuke.Entities;
using DotNetNuke.Entities.Users;
using DotNetNuke.Services.Mail;
using DotNetNuke.Entities.Portals;
using DotNetNuke.Entities.Modules.Actions;

public partial class management : DotNetNuke.Entities.Modules.PortalModuleBase
{	
	string portalConnectionString;
	string siteConnectionString;
	private DotNetNuke.Entities.Users.UserInfo objUser = new DotNetNuke.Entities.Users.UserInfo();
	private string urlPath = DotNetNuke.Entities.Tabs.TabController.CurrentPage.FullUrl;
	public string[] panelsList = null;
	public string indicatorTextList = null;
	private List<string> allowDrogPages = new List<string>();
	public System.Web.Script.Serialization.JavaScriptSerializer javaSerial = new System.Web.Script.Serialization.JavaScriptSerializer();
    protected string[] manageID = null;
    protected string[] manageName = null;
    protected string[] manageContent = null;
    protected string[] manageLastModified = null;

    public static string SiteConnectionString
    {
        get
        {
            return "Data Source=TOM-MSI;Initial Catalog=ExcellentTom;Integrated Security=True";
        }
    }

	protected override void OnInit(EventArgs e)
	{
		// portalConnectionString = ConfigurationManager.ConnectionStrings[Portals.PortalConnectionString(PortalId)].ConnectionString;
		// siteConnectionString = ConfigurationManager.ConnectionStrings[Portals.SiteConnectionString].ConnectionString;
		
	}
	
	protected void Page_Load(object sender, System.EventArgs e)
	{
		objUser = DotNetNuke.Entities.Users.UserController.GetUserById(PortalId, UserId);
		
		if(!Page.IsPostBack)
		{
            fetchRecentNews();
		}
		
	}

    protected void fetchRecentNews()
    {
        DataTable newTable = new DataTable();

        using (SqlConnection objConnectionHelp = new SqlConnection(SiteConnectionString))
        {
            string queryStringHelp = "aaa_fetch_manage_item";
            SqlCommand newsComand = new SqlCommand(queryStringHelp, objConnectionHelp);
            newsComand.CommandType = CommandType.StoredProcedure;
            objConnectionHelp.Open();
            SqlDataReader newsRepeater = newsComand.ExecuteReader();
            newTable.Load(newsRepeater);
            objConnectionHelp.Close();
        }

        List<string> itemIDList = newTable.AsEnumerable().Select(dr => Convert.ToString(dr.Field<int>("ItemID"))).ToList();
        List<string> itemNameList = newTable.AsEnumerable().Select(dr => dr.Field<string>("ItemName")).ToList();
        List<string> itemContentList = newTable.AsEnumerable().Select(dr => dr.Field<string>("ItemContent")).ToList();
        List<string> itemLastModified = newTable.AsEnumerable().Select(dr => Convert.ToString(dr.Field<DateTime>("LASTMODIFIED"))).ToList();

        manageID = itemIDList.ToArray();
        manageName = itemNameList.ToArray();
        manageContent = itemContentList.ToArray();
        manageLastModified = itemLastModified.ToArray();
    }
	
}	
