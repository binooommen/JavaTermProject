/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import credentials.database;
import java.io.StringReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObjectBuilder;
import javax.json.stream.JsonParser;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

/**
 *
 * @author c0647015
 */
@Path("/customer")
public class customer {

    @GET
    @Produces("application/json")
    public String doGet() {
        return getResults("SELECT * FROM customer");
    }

    @GET
    @Produces("application/json")
    @Path("{id}")
    public String doGet(@PathParam("id") String id) {
        return getResults("SELECT * FROM customer WHERE id = ?", id);
    }

    @POST
    @Consumes("application/json")
    public String doPost(String str) {
        JsonParser parser = Json.createParser(new StringReader(str));
        Map<String, String> mapKeyValue = new HashMap<>();
        String key = "", val;
        while (parser.hasNext()) {
            JsonParser.Event evt = parser.next();
            switch (evt) {
                case KEY_NAME:
                    key = parser.getString();
                    break;
                case VALUE_STRING:
                    val = parser.getString();
                    mapKeyValue.put(key, val);
                    break;
                case VALUE_NUMBER:
                    val = Integer.toString(parser.getInt());
                    mapKeyValue.put(key, val);
                    break;
            }
        }
        Date d = new Date();
        SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
        String curr_date=form.format(d);
        doPostOrPutOrDelete("INSERT INTO customer (create_date, name) VALUES ( ?, ?)", curr_date, mapKeyValue.get("name"));
        return "1";
    }

    @PUT
    @Path("{id}")
    @Consumes("application/json")
    public void doPut(@PathParam("id") String id, String str) {
        JsonParser parser = Json.createParser(new StringReader(str));
        Map<String, String> mapKayValue = new HashMap<>();
        String key = "", val;
        while (parser.hasNext()) {
            JsonParser.Event evt = parser.next();
            switch (evt) {
                case KEY_NAME:
                    key = parser.getString();
                    break;
                case VALUE_STRING:
                    val = parser.getString();
                    mapKayValue.put(key, val);
                    break;
                case VALUE_NUMBER:
                    val = parser.getString();
                    mapKayValue.put(key, val);
                    break;
            }
        }
        System.out.println(mapKayValue);
        doPostOrPutOrDelete("UPDATE customer SET name = ? WHERE id = ?", mapKayValue.get("name"), id);

    }

    @DELETE
    @Path("{id}")
    public String doDelete(@PathParam("id") String id, String str) {
        doPostOrPutOrDelete("DELETE FROM customer WHERE id = ?", id);
        return "1";
    }

    private void doPostOrPutOrDelete(String query, String... params) {
        try (Connection conn = database.getConnection()) {
            PreparedStatement pstmt = conn.prepareStatement(query);
            for (int i = 1; i <= params.length; i++) {
                pstmt.setString(i, params[i - 1]);
            }
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(customer.class.getName()).log(Level.SEVERE, null, ex);
        }
        getResults("SELECT * FROM customer");
    }

    private String getResults(String query, String... params) {
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        String res = new String();
        try (Connection conn = database.getConnection()) {
            System.out.println(query);
            PreparedStatement pstmt = conn.prepareStatement(query);
            if (params.length != 0) {
                pstmt.setString(1, params[0]);
            }
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                JsonObjectBuilder json = Json.createObjectBuilder()
                        .add("id", rs.getInt("id"))
                        .add("create_date", rs.getString("create_date"))
                        .add("name", rs.getString("name"));
                res = json.build().toString();
                sb.append(res);
            }
        } catch (SQLException ex) {
            Logger.getLogger(customer.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (params.length == 0) {
            sb.append("]");
            res = sb.toString();
        }
        return res;
    }

}
