<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
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
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<%
	String path = getServletContext().getRealPath("/") + "Files/";
	File rootDic = new File(path);
%>
<body>
	<div class="container" style="padding: 20px;">
		<div class="row">
			<div class="col-sm-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">老大今天要Pick谁啊?</h3>
					</div>
					<div class="panel-body">
						<form action="download" method="POST">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>Pick</th>
										<th>宿舍号</th>
										<th>提交文件数</th>
										<th>最后提交时间</th>
									</tr>
								</thead>
								<%
								//现在我们要增检查功能,那么页面自然要增加id,然后根据id打开相应的文件就好啦
								//我们还要增加改名功能,这样方便修正一些错误
								//还应该增加“打回去”功能,事实上就是在已经提交的基础上可以再次提交自己的
								//我们先设计页面吧!
									File[] fileList = rootDic.listFiles();
									for (File f : fileList) {
										//读入对应的文件目录下的时间
										BufferedReader timeReader = null;
										try {
											timeReader = new BufferedReader(new FileReader(f.getPath() + File.separator + "submitTime.txt"));
										} catch (FileNotFoundException e) {
											//如果时间戳无效,则说明上传不完整
											continue;
										}
										int includeFileCount = f.listFiles().length - 1;
										StringBuffer sb = new StringBuffer();
										sb.append("<tr>").append("<td>");
										sb.append("<input type=\"checkbox\" id=\"pick\" name=\"").append(f.getName()).append("\">")
												.append("</td>").append("<td>").append(f.getName()).append("</td><td>").append(includeFileCount)
												.append("</td><td>").append(timeReader.readLine()).append("</td></tr>");
										timeReader.close();
										out.print(sb.toString());
									}
								%>
							</table>
							<!-- 现在我们将地址提交到处理压缩的Servlet -->
							<input type="submit" class="btn btn-primary" style="" value="下载">
						</form>
					</div>
					<!--panel-->
				</div>


			</div>

		</div>

	</div>

</body>
</html>