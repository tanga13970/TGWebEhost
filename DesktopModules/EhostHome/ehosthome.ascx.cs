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

public partial class ehosthome : DotNetNuke.Entities.Modules.PortalModuleBase
{	
	string portalConnectionString;
	string siteConnectionString;
	private DotNetNuke.Entities.Users.UserInfo objUser = new DotNetNuke.Entities.Users.UserInfo();
	private string urlPath = DotNetNuke.Entities.Tabs.TabController.CurrentPage.FullUrl;
	public string[] panelsList = null;
	public string indicatorTextList = null;
	private List<string> allowDrogPages = new List<string>();
	public System.Web.Script.Serialization.JavaScriptSerializer javaSerial = new System.Web.Script.Serialization.JavaScriptSerializer();
	
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
			
		}
		
	}
	
}	
