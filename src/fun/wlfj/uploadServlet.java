package fun.wlfj;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class uploadServlet
 */
@WebServlet("/uploadServlet")
@MultipartConfig
public class uploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		if(!ServletFileUpload.isMultipartContent(request)) {
			//非法请求
			return;
		}
		String dormID = request.getParameter("dorm_id");
		int dormNum = Integer.parseInt(request.getParameter("dorm_num"));
		String path = getServletContext().getRealPath("/") + "Files/" + dormID;
		
		//在这里我们检查文件是否存在 如果能对上 就没问题了
		
		File uploadDir = new File(path);
		if(uploadDir.exists()) {
			File[] fileList = uploadDir.listFiles();
			for(File f : fileList) {
				f.delete();
			}
		}else {
			uploadDir.mkdir();
		}
		
		for(int i = 0; i < dormNum; i ++) {
			
			Part filePart = request.getPart("img" + i);
			String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
			//下面要获取用户输入的文件名
			String userInputName = request.getParameter("name" + i);
			//现在我们要将其拼接在一起
			System.out.println(userInputName);
			String fileType = "?";
			try {
				fileType = fileName.split("\\.")[1];
			}catch(ArrayIndexOutOfBoundsException e) {
				response.getWriter().append("文件数量不够!<br>或者是你提交了奇怪的文件上来◡ ヽ(`Д´)ﾉ ┻━┻");
				return;
			}
			InputStream fileIn = filePart.getInputStream();
			FileOutputStream fileOut = null;
			try {
				if(userInputName == null || userInputName.length() <= 1) throw new Exception("Username is invalid.");
				fileOut = new FileOutputStream(path + File.separator + userInputName + "." + fileType);
			}catch(FileNotFoundException e) {
			    response.getWriter().append("内部错误！(◎_◎;)<br>快快联系我-代码001<br>" + path + File.separator + userInputName + "." + fileType);
			    return ;
			}catch(Exception e) {
				response.getWriter().append("请确保姓名字段正确!\n第" + (i + 1) + "个姓名有问题.");
				return;
			}
			int index;
			byte[] buffer = new byte[1024];
			while((index = fileIn.read(buffer)) != -1) {
				fileOut.write(buffer, 0, index);
				fileOut.flush();
			}
			fileOut.close();
			fileIn.close();
		}
		//最后再添加一个写入时间
		FileWriter writer = new FileWriter(path + File.separator + "submitTime.txt");
		Date date = new Date();
		writer.write("" + date.toString());
		writer.flush();
		writer.close();
		response.getWriter().append("谢谢!");
	}

}
