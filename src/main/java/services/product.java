/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import credentials.database;
import java.io.StringReader;
import java.sql.Connection;
import java.sql.DriverManager;
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
@Path("/product")
public class product {

    @GET
    @Produces("application/json")
    public String doGet() {
        return getResults("SELECT * FROM product");
    }

    @GET
    @Produces("application/json")
    @Path("{id}")
    public String doGet(@PathParam("id") String id) {
        return getResults("SELECT * FROM product WHERE id = ?", id);
    }

    @POST
    @Consumes("application/json")
    public void doPost(String str) {
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
        doPostOrPutOrDelete("INSERT INTO product (create_date, name, cost_price, list_price, description) VALUES ( ?, ?, ?, ?, ?)",
               curr_date, mapKeyValue.get("name"), mapKeyValue.get("cost_price"), mapKeyValue.get("list_price"), mapKeyValue.get("description"));
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
        doPostOrPutOrDelete("UPDATE PRODUCT SET name = ?, cost_price = ?, list_price = ?, description = ? WHERE id = ?",
                mapKayValue.get("name"), mapKayValue.get("cost_price"), mapKayValue.get("list_price"), mapKayValue.get("description"), id);

    }

    @DELETE
    @Path("{id}")
    public void doDelete(@PathParam("id") String id, String str) {
        doPostOrPutOrDelete("DELETE FROM product WHERE id = ?", id);
    }

    private void doPostOrPutOrDelete(String query, String... params) {
        try (Connection conn = database.getConnection()) {
            PreparedStatement pstmt = conn.prepareStatement(query);
            for (int i = 1; i <= params.length; i++) {
                pstmt.setString(i, params[i - 1]);
            }
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(product.class.getName()).log(Level.SEVERE, null, ex);
        }
        getResults("SELECT * FROM product");
    }

    private String getResults(String query, String... params) {
        JsonArrayBuilder productArr = Json.createArrayBuilder();
        String res = new String();
        try (Connection conn = database.getConnection()) {
            System.out.println(query);
            PreparedStatement pstmt = conn.prepareStatement(query);
            if (params.length != 0) {
                pstmt.setString(1, params[0]);
            }
            ResultSet rs = pstmt.executeQuery();
            ResultSet qtyRs;
            int product_id;
            while (rs.next()) {
                product_id = rs.getInt("id");
                String findQtyQuery = "SELECT (sum(quantity) - (SELECT sum(quantity) FROM sale WHERE product_id = 1)) as \"available_qty\" "
                        + "FROM purchase WHERE product_id = "+product_id+";";
                pstmt = conn.prepareStatement(findQtyQuery);
                qtyRs = pstmt.executeQuery();
                int available_qty=0;
                if(qtyRs.next()){
                    available_qty=qtyRs.getInt("available_qty");
                }
                JsonObjectBuilder json = Json.createObjectBuilder()
                        .add("id", product_id)
                        .add("create_date", rs.getString("create_date"))
                        .add("name", rs.getString("name"))
                        .add("cost_price", rs.getString("cost_price"))
                        .add("list_price", rs.getString("list_price"))
                        .add("quantity_available", available_qty)
                        .add("description", rs.getString("description"));
                productArr.add(json);
                res = json.build().toString();
            }
        } catch (SQLException ex) {
            Logger.getLogger(product.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (params.length == 0) {
            res = productArr.build().toString();
        }
        return res;
    }

}
