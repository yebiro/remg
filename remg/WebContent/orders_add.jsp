<%@page language="java" import="java.util.*,java.sql.*,java.net.*,java.text.*" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!doctype html>
<html lang="en">
<% 
 String Manager="Manager";
 if(session.getAttribute("account")==null)
 {
	 out.println("<script language=javascript>window.alert('请先进行登录');location.href='index.jsp'</script>");
 }   
 else 
 {
	 Manager=session.getAttribute("account").toString();
 }
%>
<head>
	<title>餐饮店点餐 · 消费管理系统</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/vendor/linearicons/style.css">
	<link rel="stylesheet" href="assets/vendor/chartist/css/chartist-custom.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="assets/css/main.css">
	<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
	<link rel="stylesheet" href="assets/css/demo.css">
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
</head>

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="brand">
				<a href="welcome.jsp" class="panel-title">餐饮店点餐 · 消费管理系统</a>
			</div>
			<div class="container-fluid">
				<div class="navbar-btn">
					<button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
				</div>
				<div id="navbar-menu">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="assets/img/user.png" class="img-circle" alt="Avatar"> <span><%=Manager%></span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
							<ul class="dropdown-menu">
								<!-- <li><a href="#"><i class="lnr lnr-user"></i> <span>My Profile</span></a></li> -->
								<li><a href="index.jsp"><i class="lnr lnr-exit"></i> <span>Logout</span></a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<nav>
					<ul class="nav">
						<li><a href="cust_main" class=""><i class="lnr lnr-user"></i> <span>会员管理</span></a></li>
						<li><a href="order_main" class="active"><i class="lnr lnr-book"></i> <span>订单管理</span></a></li>
						<li><a href="meal_main" class=""><i class="lnr lnr-dinner"></i> <span>套餐管理</span></a></li>
						<li><a href="acti_main" class=""><i class="lnr lnr-layers"></i> <span>活动管理</span></a></li>
						<li><a href="reports_main.jsp" class=""><i class="lnr lnr-chart-bars"></i> <span>消费报告</span></a></li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
				<%
				request.setCharacterEncoding("utf8");
				String url="jdbc:mysql://localhost:3306/remg?useUnicode=true&characterEncoding=utf-8";
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn =DriverManager.getConnection(url, "root","");
				
				String sql="select begin_time,end_time from activities where aid='a001'";
			    Statement stat=conn.createStatement();
			    stat.executeQuery("set names utf8");
			    ResultSet rs=stat.executeQuery(sql);
			    
			    SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" ); 
			    java.util.Date begin_time=null,end_time=null;
			    while(rs.next())
			    {
			    	begin_time=sdf.parse(rs.getString("begin_time")); 
			    	end_time=sdf.parse(rs.getString("end_time"));
			    }
				%>
					<div class="col-md-6">
						<div class="panel">
							<div class="panel-heading">
								<h3 class="panel-title">添加订单</h3>
							</div>
							<form method="post" class="form-auth-small" action="orders_save.jsp">
								<div class="panel-body">
									<input type="text" class="form-control" placeholder="订单号" name="oid">
									<span></span>
									<br>
									<br>
									<input type="text" class="form-control" placeholder="会员手机号" name="telephone_no">
									<span></span>
									<br>
									<br>
									<input type="text" class="form-control" placeholder="服务员工号" name="eid">
									<span></span>
									<br>
									<br>
									<select class="form-control" name="sid">
									<%
									sql="select sid,sname from seats";
								    rs=stat.executeQuery(sql);
								    while(rs.next())
								    {
								    	String sid=rs.getString("sid");
								    	String sname=rs.getString("sname");  
									%>
									    <option value="<%=sid%>"><%=sname %></option>
                                     <%
									}
									%>
									</select>
									<br>
									
									<br>
									<select class="form-control" name="mid">
									<%
									sql="select mid,mname from meals";
								    rs=stat.executeQuery(sql);
								    while(rs.next())
								    {
								    	String mid=rs.getString("mid");
								    	String mname=rs.getString("mname");  
									%>
										<option value="<%=mid%>"><%=mname %></option>
									<%
									}
									%>
									</select>
									<br>
									<br>
									<input type="text" class="form-control" placeholder="数量" name="qty">
									<span></span>
									<br>
									<br>
									
										<%						  
										java.util.Date currentTime = new java.util.Date();    
										java.util.Date time=sdf.parse(sdf.format(currentTime));
									    java.util.Calendar t1=java.util.Calendar.getInstance(); 
                                        java.util.Calendar t2=java.util.Calendar.getInstance(); 
                                        java.util.Calendar t=java.util.Calendar.getInstance(); 
                                        
                                        t1.setTime(begin_time);     
                                        t2.setTime(end_time); 
                                        t.setTime(time); 
                                        int result1=t.compareTo(t1); 
                                        int result2=t.compareTo(t2); 
                                        
										if(result1<0 || result2 >0){
										%>
											<select class="form-control" name="aid">
												<option value="a000">无</option>
											</select>
										<%
										}
										else{
										%>
											<select class="form-control" name="aid">
												<option value="a001">周年庆随机立减</option>
											</select>
										<% 
										}
										%>
									<!-- </select> -->
									<br>
									<br>
									<!-- <input type="text" class="form-control" placeholder="手机号码" name="telephone_no">
									<span></span>
									<br>
									<br>
									<input type="text" class="form-control" placeholder="生日" name="birthdate">
									<br>
									<br> -->
									<!-- <input type="text" class="form-control" value="regular" name="level">
									<br>
									<br> -->
									<a href="javascript:;"><button type="submit" class="btn btn-primary btn-lg btn-block">添加</button></a>
									<br>
									<button onclick="javascript:window.location.href='order_main'" type="button" class="btn btn-warning btn-lg btn-block">返回</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
		<!-- <footer>
			<div class="container-fluid">
				<p class="copyright">&copy; 2017. All Rights Reserved.</p>
			</div>
		</footer> -->
	</div>
	<!-- END WRAPPER -->
	<!-- Javascript -->
	<script src="assets/vendor/jquery/jquery.js"></script>
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="assets/scripts/klorofil-common.js"></script>
	<script>
	$(function() {
		var data, options;

		// headline charts
		data = {
			labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
			series: [
				[23, 29, 24, 40, 25, 24, 35],
				[14, 25, 18, 34, 29, 38, 44],
			]
		};

		options = {
			height: 300,
			showArea: true,
			showLine: false,
			showPoint: false,
			fullWidth: true,
			axisX: {
				showGrid: false
			},
			lineSmooth: false,
		};

		new Chartist.Line('#headline-chart', data, options);


		// visits trend charts
		data = {
			labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
			series: [{
				name: 'series-real',
				data: [200, 380, 350, 320, 410, 450, 570, 400, 555, 620, 750, 900],
			}, {
				name: 'series-projection',
				data: [240, 350, 360, 380, 400, 450, 480, 523, 555, 600, 700, 800],
			}]
		};

		options = {
			fullWidth: true,
			lineSmooth: false,
			height: "270px",
			low: 0,
			high: 'auto',
			series: {
				'series-projection': {
					showArea: true,
					showPoint: false,
					showLine: false
				},
			},
			axisX: {
				showGrid: false,

			},
			axisY: {
				showGrid: false,
				onlyInteger: true,
				offset: 0,
			},
			chartPadding: {
				left: 20,
				right: 20
			}
		};

		new Chartist.Line('#visits-trends-chart', data, options);


		// visits chart
		data = {
			labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
			series: [
				[6384, 6342, 5437, 2764, 3958, 5068, 7654]
			]
		};

		options = {
			height: 300,
			axisX: {
				showGrid: false
			},
		};

		new Chartist.Bar('#visits-chart', data, options);


		// real-time pie chart
		var sysLoad = $('#system-load').easyPieChart({
			size: 130,
			barColor: function(percent) {
				return "rgb(" + Math.round(200 * percent / 100) + ", " + Math.round(200 * (1.1 - percent / 100)) + ", 0)";
			},
			trackColor: 'rgba(245, 245, 245, 0.8)',
			scaleColor: false,
			lineWidth: 5,
			lineCap: "square",
			animate: 800
		});

		var updateInterval = 3000; // in milliseconds

		setInterval(function() {
			var randomVal;
			randomVal = getRandomInt(0, 100);

			sysLoad.data('easyPieChart').update(randomVal);
			sysLoad.find('.percent').text(randomVal);
		}, updateInterval);

		function getRandomInt(min, max) {
			return Math.floor(Math.random() * (max - min + 1)) + min;
		}

		//-----------------------表单验证-----------------------------
		var ok1=false;
        var ok2=false;
        var ok3=false;
        var ok4=false;
        // 验证订单号
        $('input[name="oid"]').focus(function(){
          // $(this).next().text(' 订单号应该为4位');
        }).blur(function(){
          if($(this).val().length == 4 && $(this).val()!=''){
          	$(this).next().text('');
            ok1=true;
          }else{
            $(this).next().text(' 订单号应该为4位');
          }
        });
  
        //验证手机号码
        $('input[name="telephone_no"]').focus(function(){
          // $(this).next().text(' 手机号码应该为11位');
        }).blur(function(){
          if($(this).val().length == 11 && $(this).val() !=''()){
            $(this).next().text('');
            ok2=true;
          }else{
            $(this).next().text(' 手机号码应该为11位');
          }
        });
  
  
        //提交按钮,所有验证通过方可提交
  
        $('.submit').click(function(){
          if(ok1 && ok2){
            $('form').submit();
          }else{
            return false;
          }
        });
          

	});
	</script>
</body>

</html>
<%
stat.close();
conn.close();
%>