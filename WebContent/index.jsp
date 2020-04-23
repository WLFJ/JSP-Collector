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

	<!-- 在这里我们让用户填写一个表单,宿舍号(就可以了)之后创建对应人数的表单供其上传
页面1:填写相关表单
页面2:实现文件上传
解决问题:接收1的表单并跳转到第二个页面
 -->
	<div class="container" style="padding:20px;">
		<div class="row">
			<div class="col-xs-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">请输入宿舍号与提交人数</h3>
					</div>
					<div class="panel-body">
						<form action="courier.jsp" method="POST">
							<div class="form-group">
								<label for="dorm_id">宿舍号</label> <input type="text"
									name="dorm_id" class="form-control" id="dorm_id">
							</div>
							<div class="form-group">
								<label for="dorm_num">人数</label> <input type="number"
									name="dorm_num" id="dorm_num" class="form-control" value="6">
							</div>
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