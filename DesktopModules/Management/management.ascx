<%@ Control Language="C#" AutoEventWireup="true" CodeFile="management.ascx.cs" Inherits="management" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>

<dnn:DnnCssInclude runat="server" FilePath="css/jquery-te-1.4.0.css"  />
<dnn:DnnJsInclude  runat="server" FilePath="jquery/jquery-te-1.4.0.js" />
<dnn:DnnCssInclude runat="server" FilePath="DesktopModules/management/css/management.css"  />
<dnn:DnnJsInclude  runat="server" FilePath="DesktopModules/management/js/management.js" />

<script type="text/javascript">
    var manageID = <%= this.javaSerial.Serialize(this.manageID) %>;
    var manageName = <%= this.javaSerial.Serialize(this.manageName) %>;
    var manageContent = <%= this.javaSerial.Serialize(this.manageContent) %>;
    var manageLastModified = <%= this.javaSerial.Serialize(this.manageLastModified) %>;
</script>

<div id="management_div">
	<ul class="nav nav-tabs" role="tablist" id="myTab">
	  <li role="presentation" class="active"><a href="#Work" aria-controls="Work" role="tab" data-toggle="tab">Work</a></li>
	  <li role="presentation"><a href="#Passwords" aria-controls="Passwords" role="tab" data-toggle="tab">Passwords</a></li>
	</ul>

	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 tab-content">
		<div role="tabpanel" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 tab-pane active" id="Work">
			<div>
				<div class="block-flat">
					<div class="header">							
						<h3 style="display: inline-block;">
							<i class="fa fa-newspaper-o temp_top_header"></i> <span class="hidden-xs">Work Collection</span>
						</h3> 
						<a class="btn btn-primary col-lg-2 col-md-2 col-sm-4 col-xs-4 btn_add_new_seed" type="button" href="#" style="float:right;" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus"></i> <span class="hidden-xs">New Item</span></a>
					</div>
					
					<div class="content work_content_div">
						
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 work-column-div div_item_grid_header">
							<div class="col-lg-2 col-sm-2 col-md-2 col-xs-4">Name</div>
							<div class="col-lg-8 col-sm-8 col-md-8 col-xs-8">Content</div>
							<div class="col-lg-2 col-sm-2 col-md-2 col-xs-0 hidden-xs">Date</div>								
						</div>													
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 work-column-div div-item-to-be-inserted" style="padding-left:0;padding-right:0;">

						</div>
							
					</div>
					    
					
				</div>	
			</div>
		</div>
		<div role="tabpanel" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 tab-pane" id="Passwords">password</div>
	</div>
</div>

<div class=" modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">Add New</h4>
			</div>
			<div class="modal-body">
						
				<div class="name_div">
					<input type="text" placeholder="Name" class="input_item_name" value="" title="Subject" style="width:100%;height:34px;border: 0px;outline: none;padding-left: 10px;border-left:1px solid #db684f;"/>
				</div>
				<div class="content_div" style="padding-top:5px;">
					<textarea rows="36" placeholder="Content" cols="50" class="jqte-text tet_item_content">
					
					</textarea>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary btn_add_new_seed_in_modal">Save changes</button>
				</div>
			</div>
		</div>
	</div>
</div>

<div class=" modal fade" id="Div1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="H1">Current Item</h4>
			</div>
			<div class="modal-body">
						
				<div class="name_div">
					<input type="text" placeholder="Name" class="input_current_item_name" value="" title="Subject" style="width:100%;height:34px;border: 0px;outline: none;padding-left: 10px;border-left:1px solid #db684f;"/>
				</div>
				<div class="content_div" style="padding-top:5px;">
					<textarea rows="36" placeholder="Content" cols="50" class="jqte-text tet_current_item_content">
					
					</textarea>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary btn_update_seed_in_modal">Update</button>
				</div>
			</div>
		</div>
	</div>
</div>