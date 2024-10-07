/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
// Luan khung

import Model.Genre;
import db.DBContext;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Do Van Luan - CE180457
 */
public class GenreDAO extends DBContext {

    public static void main(String[] args) {
        GenreDAO gDAO = new GenreDAO();
        Genre g = gDAO.getOnlyById(1);
        System.out.println(g.getName());
    }
    
    
    // 1. Read
    public ArrayList<Genre> getAll() {

        ArrayList<Genre> genres = new ArrayList<>();
        String query = "select genreid, name from genre";

        try ( ResultSet rs = execSelectQuery(query)) {

            while (rs.next()) {
                genres.add(new Genre(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Err");
        }
        return genres;
    }

    public Genre getOnlyById(int id) {
        String query = "select genreid, name from genre where genreid = ?";
        Object[] params = {id};

        try ( ResultSet rs = execSelectQuery(query, params)) {
            if (rs.next()) {
                return new Genre(rs.getInt(1), rs.getString(2));
            }
        } catch (SQLException e) {
            System.out.println("Err");
        }

        return null;
    }

    // 2. Create
    public int create(Genre genre) {
        String getNextIdQuery = "select Max(GenreId) + 1 as nextId from Genre g";
        try( ResultSet rs = execSelectQuery(getNextIdQuery)) {
            if (rs.next()) {
                int nextId = rs.getInt(1);
                String createGenreQuery = "insert into Genre values (?, ?)";
                Object[] params = {nextId, genre.getName()};
                return execQuery(createGenreQuery, params);
            }
        } catch (SQLException ex) {
            System.out.println("Err");
        }
        return 0;
    }
    
    // 3. Update
    public int update(Genre genre) {
        String sql = "UPDATE Genre SET Name = ? WHERE GenreId = ?";
        Object[] params = {genre.getName(), genre.getID()};
        try{
            return execQuery(sql, params);
        } catch (SQLException ex){
            Logger.getLogger(GenreDAO.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
    
    // 4. Delete
    public int delete(int id){
        String sql = "delete from Genre where GenreId = ?";
        Object[] params = {id};
        try {
            return execQuery(sql, params);
        } catch (SQLException ex) {
            return 0;
        }
    }

}
