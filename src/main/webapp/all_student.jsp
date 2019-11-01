<%@ page contentType="text/html;charset=UTF-8"  language="java" %>
<%@ page import = "org.json.simple.JSONObject"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="org.json.simple.JSONArray"%>
<%@ page import="java.sql.DriverManager" %>
<%
    JSONArray list = new JSONArray();

    Connection con;
    PreparedStatement pst;
    ResultSet rs;

    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/formation","root","mdp");

    String query = "select * from inscription";

    Statement stmt = con.createStatement();
    rs = stmt.executeQuery(query);

    while(rs.next())
    {
        JSONObject obj = new JSONObject();

        String id = rs.getString("id");
        String nom = rs.getString("nom");
        String cours = rs.getString("cours");
        String frais = rs.getString("frais");

        obj.put("nom",nom);
        obj.put("cours",cours);
        obj.put("frais",frais);
        obj.put("id",id);

        list.add(obj);
    }

    out.print(list.toJSONString());
    out.flush();
    con = null;
%>
