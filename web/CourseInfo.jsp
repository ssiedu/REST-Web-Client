<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLConnection"%>
<%
    String subject=request.getParameter("subject");
    String endPoint="http://localhost:8084/FirstWebService/webapi/course/subject/json/"+subject;
    URL url=new URL(endPoint);
    URLConnection con = url.openConnection();
        InputStream is = con.getInputStream();
        BufferedReader br = new BufferedReader(
                new InputStreamReader(is));
        String output="",resp="";
        
        while ((output = br.readLine()) != null) {
            resp=resp+output;
        }
        //out.println(resp);
        JSONArray jarr=new JSONArray(resp);
%>

<html>
    <body>
        <h3>Courses-Available</h3>
        <hr>
        <table border="2">
            <tr>
                <th>Code</th>
                <th>Title</th>
                <th>Subject</th>
                <th>Dur</th>
                <th>Fees</th>
            </tr>
<%            
        for(int i=0; i<jarr.length();i++){
            JSONObject json=jarr.getJSONObject(i);
            int r1=json.getInt("code");
            String r2=json.getString("title");
            String r3=json.getString("subject");
            int r4=json.getInt("duration");
            int r5=json.getInt("fees");
%>
<tr>
    <td><%=r1%></td>
    <td><%=r2%></td>
    <td><%=r3%></td>
    <td><%=r4%></td>
    <td><%=r5%></td>
</tr>
    
<%
        }
%>
    </table>
<hr>
<a href="index.jsp">Home</a>
    </body>
</html>


