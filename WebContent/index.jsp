<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
	//用户在客户端login.jsp点击submit
	String name = request.getParameter("name");//获取客户端传来的name参数
	if(name != null && !name.trim().equals("")){//如果name不为null或不为（前后空白）“”
		Cookie cookie = new Cookie("name",name);//则生成cookie
		cookie.setMaxAge(30);//保留30秒
		response.addCookie(cookie);//传回客户端保存
	}else{
		//Cookie中读取用户信息，若存在则打印欢迎信息
		Cookie [] cookies = request.getCookies();
		if(cookies != null && cookies.length >0){
			for(Cookie cookie : cookies){
				String cookieName = cookie.getName();
				if("name".equals(cookieName)){
					String val = cookie.getValue();
					name = val;
				}
			}
		}
	}
	
	//如果name不为null或不为（前后空白）“” 打印信息
	if(name != null && !name.trim().equals("")){
		out.print("hello: " + name);
	}else{//否则重定向到login.jsp
		response.sendRedirect("login.jsp");
	}
		
	%>

</body>
</html>