<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		//1.获取Cookie
		Cookie[] cookies = request.getCookies();//获取的是一个cookie数组
		if(cookies != null && cookies.length >0){//如果cookie不为空并大于零则遍历cookie
			for(Cookie cookie : cookies){
				//2.获取Cookie的name 和 value
				out.print(cookie.getName()+"::"+cookie.getValue());
				out.print("<br>");
			}
		}else{//如果为空则创建cookie
			out.print("没有一个cookie，正在创建并返回");
			//1.创建一个cookie对象
			Cookie cookie = new Cookie("name","thisisfritscookie");
			cookie.setMaxAge(30);//设置时效(秒)，正数为存储时间，0为立即删除，负数为不存储
			
			//2.调用response(响应客户端)的一个方法把cookie传给客户端
			response.addCookie(cookie);
		}
	%>

</body>
</html>