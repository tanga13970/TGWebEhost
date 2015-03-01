<%@ Control language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" TagName="LOGO" Src="~/Admin/Skins/Logo.ascx" %>
<%@ Register TagPrefix="dnn" TagName="PRIVACY" Src="~/Admin/Skins/Privacy.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TERMS" Src="~/Admin/Skins/Terms.ascx" %>
<%@ Register TagPrefix="dnn" TagName="COPYRIGHT" Src="~/Admin/Skins/Copyright.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Meta" Src="~/Admin/Skins/Meta.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LINKTOFULLSITE" Src="~/Admin/Skins/LinkToFullSite.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.DDRMenu.TemplateEngine" Assembly="DotNetNuke.Web.DDRMenu" %>
<%@ Register TagPrefix="dnn" TagName="MENU" src="~/DesktopModules/DDRMenu/Menu.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="JQUERY" Src="~/Admin/Skins/jQuery.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>

<dnn:META ID="META1" runat="server" Name="viewport" Content="width=device-width,initial-scale=1" />

<dnn:Meta runat="server" Name="robots" Content="noindex" />
<dnn:Meta runat="server" Name="dnncrawler" Content="doindex" />
<dnn:JQUERY ID="dnnjQuery" runat="server" />
<dnn:DnnCssInclude runat="server" FilePath="outsource/font-awesome/css/font-awesome.min.css" PathNameAlias="SkinPath" />
<dnn:DnnCssInclude runat="server" FilePath="outsource/css/skel.css" PathNameAlias="SkinPath" />
<dnn:DnnCssInclude runat="server" FilePath="outsource/css/style.css" PathNameAlias="SkinPath" />
<dnn:DnnCssInclude runat="server" FilePath="outsource/css/style-desktop.css" PathNameAlias="SkinPath" />
<dnn:DnnCssInclude runat="server" FilePath="outsource/css/bootstrap.css" PathNameAlias="SkinPath" />
<dnn:DnnCssInclude runat="server" FilePath="outsource/css/customCss/defaultPageLayout.css" PathNameAlias="SkinPath" />

<div id="navPanel" class="skel-layer skel-layer-top-left" style="backface-visibility: hidden; position: relative;display: none;overflow-y: auto;overflow-x: hidden;top: 0px;width: 80%;height: 100%;float: left;border-right:2px solid #eee;width:324px;"><div data-action="navList" data-args="nav"><nav><a class="link depth-0" href="index.html" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><span class="indent-0"></span>Welcome</a><a class="link depth-0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><span class="indent-0"></span>Dropdown</a><a class="link depth-1" href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><span class="indent-1"></span>Lorem ipsum dolor</a><a class="link depth-1" href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><span class="indent-1"></span>Magna phasellus</a><a class="link depth-1" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><span class="indent-1"></span>Phasellus consequat</a><a class="link depth-2" href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><span class="indent-2"></span>Lorem ipsum dolor</a><a class="link depth-2" href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><span class="indent-2"></span>Phasellus consequat</a><a class="link depth-2" href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><span class="indent-2"></span>Magna phasellus</a><a class="link depth-2" href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><span class="indent-2"></span>Etiam dolore nisl</a><a class="link depth-1" href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><span class="indent-1"></span>Veroeros feugiat</a><a class="link depth-0" href="left-sidebar.html" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><span class="indent-0"></span>Left Sidebar</a><a class="link depth-0" href="right-sidebar.html" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><span class="indent-0"></span>Right Sidebar</a><a class="link depth-0" href="no-sidebar.html" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><span class="indent-0"></span>No Sidebar</a></nav></div></div>
<div id="skin_wrapper" style="position: relative; ">
	<!-- Header -->
	<div id="header-wrapper">
		<div id="skel-layers-visibleWrapper" style="position: relative;float:left;">
			<div id="titleBar" class="skel-layer skel-layer-top-left" style="backface-visibility: hidden; transition: -webkit-transform 0.5s ease, opacity 0.5s ease; -webkit-transition: -webkit-transform 0.5s ease, opacity 0.5s ease; position: relative; display: block; transform: translate(0px, 0px); width: 100%; height: 44px; z-index: 10004;margin-top: -5px;">
				<span class="toggle" data-action="toggleLayer" data-args="navPanel" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); cursor: pointer;"></span>
				<span class="title" data-action="copyHTML" data-args="logo">					
				</span>
			</div>
		</div>
		<header id="header" class="container">
			<div class="header_left" style="position: relative;display: block;width: 20%;float: left;">
				<!-- Logo -->
				<div id="logo">
					<h1><dnn:LOGO id="dnnLogo" runat="server" /></h1>				
				</div>
			</div>
			<div class="header_right">
				<div id="loginPane" runat="server" style="position: relative;float: right;display: block;">
					
					<dnn:LOGIN ID="dnnLogin" CssClass="LoginLink" runat="server" LegacyMode="false" />
						
					<dnn:USER ID="dnnUser" runat="server" LegacyMode="false" CssClass="LoginUser"/>
						
				</div>
				
				<!-- Nav -->		
				<nav id="nav">
					<dnn:MENU ID="bootstrapNav" MenuStyle="bootstrapNav" runat="server"></dnn:MENU>				
				</nav>
			</div>	
			   
		</header>
	</div>

	<!-- Main -->
	<div id="main-wrapper">
		<div class="container">
			<div id="content">
				<!-- Content -->
				<div id="ContentPane" runat="server" class="ContentPane"></div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<div id="footer-wrapper">
		<footer id="footer" class="container">
			<div class="row">
				<div class="3u">
				
					<!-- Links -->
					<section class="widget links">
						<h3>Passwords</h3>
						<ul class="style2">
							<li><a href="#">Etiam feugiat condimentum</a></li>
							<li><a href="#">Aliquam imperdiet suscipit odio</a></li>
							<li><a href="#">Sed porttitor cras in erat nec</a></li>
							<li><a href="#">Felis varius pellentesque potenti</a></li>
							<li><a href="#">Nullam scelerisque blandit leo</a></li>
						</ul>
					</section>
				
				</div>
				<div class="3u">
				
					<!-- Links -->
					<section class="widget links">
						<h3>Work Tips</h3>
						<ul class="style2">
							<li><a href="#">Etiam feugiat condimentum</a></li>
							<li><a href="#">Aliquam imperdiet suscipit odio</a></li>
							<li><a href="#">Sed porttitor cras in erat nec</a></li>
							<li><a href="#">Felis varius pellentesque potenti</a></li>
							<li><a href="#">Nullam scelerisque blandit leo</a></li>
						</ul>
					</section>
				
				</div>
				<div class="3u">
				
					<!-- Links -->
					<section class="widget links">
						<h3>Notes</h3>
						<ul class="style2">
							<li><a href="#">Etiam feugiat condimentum</a></li>
							<li><a href="#">Aliquam imperdiet suscipit odio</a></li>
							<li><a href="#">Sed porttitor cras in erat nec</a></li>
							<li><a href="#">Felis varius pellentesque potenti</a></li>
							<li><a href="#">Nullam scelerisque blandit leo</a></li>
						</ul>
					</section>
				
				</div>
				<div class="3u">
				
					<!-- Contact -->
					<section class="widget contact last">
						<h3>Contact Us</h3>
						<ul>
							<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
							<li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
							<li><a href="#" class="icon fa-pinterest"><span class="label">Pinterest</span></a></li>
						</ul>
						<p>1234 Fictional Road<br />
						Nashville, TN 00000<br />
						(800) 555-0000</p>
					</section>
				
				</div>
			</div>
			<div class="row">
				<div class="12u">
					<div id="copyright">
						<ul class="menu">
							<li>&copy; E Host. All rights reserved</li><li> <a href="http://html5up.net"></a></li>
						</ul>
					</div>
					<div id="SocialPane" runat="server" class="socialIcns" style="display:none;"></div> 
				</div>
			</div>
		</footer>
	</div>
</div>
<div id="skel-layers-hiddenWrapper" style="height: 100%;"></div>

<dnn:DnnJsInclude ID="bootstrapJS" runat="server" FilePath="outsource/js/bootstrap.min.js" PathNameAlias="SkinPath" />
<script type="text/javascript">
	
	$(function(){
		$('.userDisplayName').addClass('hidden-xs');
		$('.registerGroup ul:first').addClass('nav nav-pills');
	
		$( "#dnn_dnnUser_messageLink" ).find("strong").replaceWith( "<i class='fa fa-envelope'></i>" );
		
		$( "#dnn_dnnUser_notificationLink" ).find("strong").replaceWith( "<i class='fa fa-exclamation-circle'></i>" );
		
		$(window).scroll(function() {
			
			var scrolled = $(window).scrollTop();
			if (scrolled >48) {
				$("#dnn_dnnLogo_imgLogo").css({'height': '60px','width': '100px'});
				if($('#ControlBar_ControlPanel').length>0 && $('#navPanel').css('display') == 'none'){
					$("#header").css({'position': 'fixed','top':'50px','height':'90px','background':'white','left':'0','right':'0','z-index':'10','border-bottom':'5px solid #f1f1f1'});
				}	
				else if($('#ControlBar_ControlPanel').length==0 && $('#navPanel').css('display') == 'none'){
					$("#header").css({'position': 'fixed','top':'0','height':'90px','background':'white','left':'0','right':'0','z-index':'10','border-bottom':'5px solid #f1f1f1'});
				}	
				$("#nav").css({'margin-top':'0 ','font-size':'0.7em'});
			} else {
				$("#dnn_dnnLogo_imgLogo").css({'height' : '131px','width': '245px'});

				$("#header").css({'position': 'relative','top':'0','height':'150px','background':'white','left':'0','right':'0','z-index':'10','border-bottom':'0px solid #f1f1f1'});
				
				$("#nav").css({'margin-top':'0','font-size':'0.9em'});
			}
		});
		
		$('#titleBar').off('click');
		$('#titleBar').click(function(){
			if($('#navPanel').css('display') == 'none'){
				$('#navPanel').css({'display':'block','width':'350px','float':'left','height':'100%','transition-property': 'width','transition-duration':'2s'});
				$('#skin_wrapper').css({'float':'left','width':'649px'});
				$('#Body').css({'min-width':'1000px'});
			}
			else{
				$('#navPanel').css({'display':'none','width':'0px'});
				$('#skin_wrapper').css({'float':'left','width':'100%'});
				$('#Body').css({'min-width':'300px'});
			}
		});
		
		var htmlStr = '<div data-action="navList" data-args="nav"><nav>';
		$('#navPanel').html('');
		$('#nav ul li a').each(function(){
			var hrefA = $(this).attr('href');
			var name = $(this).html();
			htmlStr += '<a class="link depth-0" href="'+hrefA+'" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><span class="indent-0"></span>'+name+'</a>';
		});
		htmlStr += '</nav></div>';
		$('#navPanel').html(htmlStr);
	});
	

	skel.init({
		reset: 'full',
		breakpoints: {
			'global':	{ range: '*', href: 'Portals/_default/Skins/SuperHost/outsource/css/style.css' },
			'desktop':	{ range: '737-', href: 'Portals/_default/Skins/SuperHost/outsource/css/style-desktop.css', containers: 1200, grid: { gutters: 40 } },
			'1000px':	{ range: '737-1200', href: 'Portals/_default/Skins/SuperHost/outsource/css/style-1000px.css', containers: 960, grid: { gutters: 25 }, viewport: { width: 1080 } },
			'mobile':	{ range: '-736', href: 'Portals/_default/Skins/SuperHost/outsource/css/style-mobile.css', containers: '100%!', grid: { collapse: true, gutters: 20 }, viewport: { scalable: false } }
		},
		plugins: {
			layers: {
				config: {
					mode: 'transform'
				},
				navPanel: {
					hidden: true,
					breakpoints: 'mobile',
					position: 'top-left',
					side: 'left',
					animation: 'pushX',
					width: '80%',
					height: '100%',
					clickToHide: true,
					html: '<div data-action="navList" data-args="nav"></div>',
					orientation: 'vertical'
				},
				titleBar: {
					breakpoints: 'mobile',
					position: 'top-left',
					side: 'top',
					height: 44,
					width: '100%',
					html: '<span class="toggle" data-action="toggleLayer" data-args="navPanel"></span><span class="title" data-action="copyHTML" data-args="logo"></span>'
				}
			}
		}
	});
	
</script>

<dnn:dnnjsinclude id="dropotron" runat="server" filepath="js/jquery.dropotron.min.js" pathnamealias="skinpath" />
<dnn:dnnjsinclude id="skel" runat="server" filepath="js/skel.min.js" pathnamealias="skinpath" />
<dnn:DnnJsInclude ID="skellayers" runat="server" FilePath="js/skel-layers.min.js" PathNameAlias="SkinPath" />
<dnn:dnnjsinclude id="init" runat="server" filepath="js/init.js" pathnamealias="skinpath" />
