<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0" />
<title>3班打卡收集平台</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

	<%
		String dorm_id = request.getParameter("dorm_id");
		int dorm_num = 0;
		try {
			dorm_num = Integer.parseInt(request.getParameter("dorm_num"));
			int test = Integer.parseInt(dorm_id);
		} catch (NumberFormatException e) {
			//这里可以安排一个彩蛋
			response.sendRedirect("index.jsp");

		}
	%>

	<!-- 在这里根据传入绘图 -->
	<!-- 现在我们要将附加信息发送到servlet 应该怎么做呢 -->

	<div class="container" style="padding:20px;">
		<div class="row">
			<div class="col-sm-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title"><%=dorm_id%>宿舍<%=dorm_num%>人打卡上传
						</h3>
					</div>
					<div class="panel-body">
						<form action="uploadServlet" method="POST"
							enctype="multipart/form-data">
							<input type="text" name="dorm_num" value="<%=dorm_num%>"
								style="display: none"> <input type="text" name="dorm_id"
								value="<%=dorm_id%>" style="display: none">
							<%
								for (int i = 0; i < dorm_num; i++) {
									out.print("<div class=\"form-group\">");
									out.print("<input type=\"file\" class=\"form-control\" name=\"img" + i + "\"><br>");
									//我们在这里增加姓名字段 注意要保证画面的美观性
									out.print("<div class=\"input-group input-group\">"+
											  "<span class=\"input-group-addon\" id=\"basic-addon1\">@</span>"+
											  "<input name=\"name"+i+"\"type=\"text\" class=\"form-control\" placeholder=\"姓名\" aria-describedby=\"basic-addon1\">"+
											"</div>");
									out.print("</div>");
								}
							%>
							<input type="reset" class="btn btn-default" value="重置"> <input
								type="submit" class="btn btn-primary" value="下一步">
						</form>
					</div>
					<!--panel-->
				</div>


			</div>

		</div>

	</div>

</body>
</html>