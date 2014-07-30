<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<style>
	#dropdown, #dropdown ul {
		margin: 0;
		padding: 0;
		list-style: none;
	}

	#dropdown li {position: relative; color: #FFFFFF;}
	
	#dropdown a { font-weight: bold;  text-decoration: none; border-top-left-radius: 5px; border-top-right-radius: 5px; }

	#dropdown ul {
		margin: 20px 0 0 0;
		_margin: 0; 
		opacity: 0;
		visibility: hidden;
		position: absolute;
		top: 38px;
		left: 0;
		z-index: 10;    
		background: #00A5FF; 
		background: -webkit-gradient(linear, left top, left bottom, color-stop(32%, #00A5FF), color-stop(100%, #008EDC)); 
		background: -webkit-linear-gradient(top, #00A5FF 32%, #008EDC 100%); 
		background: -moz-linear-gradient(top, #00A5FF 32%, #008EDC 100%); 
		background: -ms-linear-gradient(top, #00A5FF 32%, #008EDC 100%); 
		background: linear-gradient(top, #00A5FF 32%, #008EDC 100%); 
		border-bottom: 5px solid #DDD;
		box-shadow: 0 -1px 0 rgb(221,221,221);	
		border-radius: 3px;
		transition: all .2s ease-in-out;  
	}

	#dropdown li:hover > ul {
		opacity: 1;
		visibility: visible;
		margin: 0;
	}
	
	#dropdown ul ul {
		top: 0;
		left: 150px;
		margin: 0 0 0 20px;
		_margin: 0; 
		box-shadow: -1px 0 0 rgb(221,221,221);		
	}
	
	#dropdown ul li {
		float: none;
		display: block;
		border: 0;
		_line-height: 0;
		box-shadow: 0 1px 0 rgb(221,221,221), 0 2px 0 rgb(221,221,221);
	}

	#dropdown ul a {    
		padding: 10px;
		width: 130px;
		_height: 10px; 
		display: block;
		white-space: nowrap;
		float: none;
		text-transform: none;
		font-weight: bold; text-decoration: none; border-top-left-radius: 5px; border-top-right-radius: 5px;color: #FFFFFF;
	}
	
	#dropdown ul a:hover {
		color: #000; background: rgb(255,255,255); 
		background: -webkit-gradient(linear, left top, left bottom, color-stop(7%,#FFF), color-stop(76%,rgba(221,221,221,1))); 
		background: -webkit-linear-gradient(top, #FFF 7%,rgba(221,221,221,1) 76%); 
		background: -moz-linear-gradient(top, #FFF 7%, rgba(221,221,221,1) 76%); 
		background: -ms-linear-gradient(top, #FFF 7%, rgba(221,221,221,1) 76%); 
		background: linear-gradient(top, #FFF 7%,rgba(221,221,221,1) 76%); 
	}
	
	#dropdown ul li:first-child > a {
		border-radius: 3px 3px 0 0;
	}
	
	#dropdown ul li:first-child > a:after {
		content: '';
		position: absolute;
		left: 40px;
		top: -6px;
		border-left: 6px solid transparent;
		border-right: 6px solid transparent;
		border-bottom: 6px solid rgb(24,75,127);
	}
	
	#dropdown ul ul li:first-child a:after {
		left: -6px;
		top: 50%;
		margin-top: -6px;
		border-left: 0;	
		border-bottom: 6px solid transparent;
		border-top: 6px solid transparent;
		border-right: 6px solid rgb(24,75,127);
	}
</style>
<nav class="rg-site-nav" id="nav">
	<div class="row">
		<ul id="dropdown">
			<li><a title="" href="/ls/user/load.ls">Customer</a></li>
			<li><a title="" href="/ls/user/loadUser.ls">User Management</a></li>
			<li><a title="" href="/ls/user/conf.ls">Configuration</a></li>
			<li><a title="" href="/ls/grab/load.ls">Grab</a></li>
		</ul>
	</div>
</nav>