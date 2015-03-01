
using System;
using System.Globalization;
using DotNetNuke.Common;
using DotNetNuke.Entities.Portals;
using DotNetNuke.Data;
using DotNetNuke.Entities;
using DotNetNuke.Entities.Users;
using DotNetNuke.Security.Roles;
using DotNetNuke.Security.Membership;
using DotNetNuke.Security;
using DotNetNuke.Services.Localization;
using DotNetNuke.Services.Mail;
using DotNetNuke.Entities.Modules;
using DotNetNuke.UI.Skins.Controls;
using DotNetNuke.Entities.Modules.Actions;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Services; 
using DotNetNuke.Services.Exceptions;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;

public partial class ProcessAjax : System.Web.UI.Page
{  
    private static int portalID = PortalAliasController.Instance.GetPortalAlias(Globals.GetDomainName(System.Web.HttpContext.Current.Request)).PortalID;
    //protected static string portalConnectionString = ConfigurationManager.ConnectionStrings[Portals.PortalConnectionString(portalID)].ConnectionString;
	private static string urlPath = DotNetNuke.Entities.Tabs.TabController.CurrentPage.FullUrl;
	
	public static string SiteConnectionString
	{
		get
		{
            return "Data Source=TOM-MSI;Initial Catalog=ExcellentTom;Integrated Security=True";
		}
	}

    public class Item
    {
        public string ItemName;
        public string ItemContent;
        public string ItemID;
        public string LastModified;
    }

    [WebMethod(EnableSession = true)]
    public static List<Item> fetchAllItems()
    {
        List<Item> newItemList = new List<Item>();
        try
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

            for(int i=0;i<itemIDList.Count;i++){
                newItemList.Add(new Item() { ItemName = itemNameList[i], ItemContent = itemContentList[i], ItemID = itemIDList[i], LastModified = itemLastModified[i] });
            }

            return newItemList;
        }

        catch (Exception ex)
        {
            return newItemList;
            
        }

    }
    
	[WebMethod(EnableSession = true)]
	public static string addNewItem(string newItemName,string newItemContent)
	{
		try
        {

            using (SqlConnection objconnectionhelp = new SqlConnection(SiteConnectionString))
            {
                 string querystringhelp = "aaa_insert_new_manage_item";
                 SqlCommand repeatercomand = new SqlCommand(querystringhelp, objconnectionhelp);
                 repeatercomand.CommandType = CommandType.StoredProcedure;
                 objconnectionhelp.Open();
                 repeatercomand.Parameters.Add("@item_content", SqlDbType.NVarChar).Value = newItemContent;
                 repeatercomand.Parameters.Add("@item_name", SqlDbType.NVarChar).Value = newItemName;
                 repeatercomand.Parameters.Add("@type_id", SqlDbType.Int).Value = 1;
                 repeatercomand.ExecuteNonQuery();												

                 objconnectionhelp.Close();
            }
			
            return "successfully";
        }
		
        catch (Exception ex)
        {
            
			return ex.Message.ToString();
        }
		
	}

    [WebMethod(EnableSession = true)]
    public static string updateCurrentSelectedItem(string currentItemName, string currentItemContent, string currentItemID)
    {
        try
        {

            using (SqlConnection objconnectionhelp = new SqlConnection(SiteConnectionString))
            {
                string querystringhelp = "aaa_update_manage_item";
                SqlCommand repeatercomand = new SqlCommand(querystringhelp, objconnectionhelp);
                repeatercomand.CommandType = CommandType.StoredProcedure;
                objconnectionhelp.Open();
                repeatercomand.Parameters.Add("@item_content", SqlDbType.NVarChar).Value = currentItemContent;
                repeatercomand.Parameters.Add("@item_name", SqlDbType.NVarChar).Value = currentItemName;
                repeatercomand.Parameters.Add("@type_id", SqlDbType.Int).Value = 1;
                repeatercomand.Parameters.Add("@item_id", SqlDbType.Int).Value = Convert.ToInt32(currentItemID);
                repeatercomand.ExecuteNonQuery();

                objconnectionhelp.Close();
            }

            return "successfully";
        }

        catch (Exception ex)
        {

            return ex.Message.ToString();
        }

    }
	
	// public static string DataSetToJSON(DataSet ds)
	// {
		// Dictionary<string, object> dict = new Dictionary<string, object>();
		
		// foreach (DataTable dt in ds.Tables) 
		// {
			// object[] arr = new object[dt.Rows.Count + 1];

			// for (int i = 0; i <= dt.Rows.Count - 1; i++) 
			// {
				// arr[i] = dt.Rows[i].ItemArray;
			// }

			// dict.Add(dt.TableName, arr);
		// }

		// System.Web.Script.Serialization.JavaScriptSerializer json = new System.Web.Script.Serialization.JavaScriptSerializer();
		// return json.Serialize(dict);
	// }
	
	// protected void SendExceptionErrorMessage(string url,string exceptionMesg, string Activities, string userId, string exceptionType,string stackTrace)
	// {
		// string notificationErrorMessage= Nektar.Web.Email.SendErrorEmailWithTemplate(url,exceptionMesg,Activities,userId,exceptionType,stackTrace);			
		// Mail.SendMail("notifications@nektardata.com", "support@nektardata.com", "", "Exception Caught - Notification", notificationErrorMessage, "", "HTML", "", "", "", "");
	// }
}
