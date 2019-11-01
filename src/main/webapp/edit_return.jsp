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

    String etudiantid = request.getParameter("id");
    pst = con.prepareStatement("select id,nom,cours,frais from inscription where id = ? ");
    pst.setString(1,etudiantid);
    rs = pst.executeQuery();

    if(rs.next()==true)
    {
        String id = rs.getString(1);
        String nom = rs.getString(2);
        String cours = rs.getString(3);
        String frais = rs.getString(4);

        JSONObject obj = new JSONObject();

        obj.put("id",id);
        obj.put("nom",nom);
        obj.put("cours",cours);
        obj.put("frais",frais);
        list.add(obj);
    }

    out.print(list.toJSONString());
    out.flush();
    con = null;
 %>
