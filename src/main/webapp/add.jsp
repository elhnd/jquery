<%@ page import = "org.json.simple.JSONObject"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="org.json.simple.JSONArray"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page contentType="text/html;charset=UTF-8"  language="java" %>
    <%
         JSONArray list = new JSONArray();

         String nom = request.getParameter("nom");
         String cours   = request.getParameter("cours");
         String frais = request.getParameter("frais");

         Connection con;
         PreparedStatement pst;
         ResultSet rs;

         JSONObject obj = new JSONObject();

         Class.forName("com.mysql.jdbc.Driver");
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/formation","eldji","Eldji@92f");
         pst = con.prepareStatement("insert into inscription (nom,cours,frais) values(?,?,?)");
         pst.setString(1, nom);
         pst.setString(2, cours);
         pst.setString(3, frais);
         pst.executeUpdate();
         obj.put("name","success");
         list.add(obj);
         out.println(list.toJSONString());
         out.flush();
         con = null;
    %>