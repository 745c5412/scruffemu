package scruffemu.database.active.data;

import com.zaxxer.hikari.HikariDataSource;

import scruffemu.database.active.AbstractDAO;
import scruffemu.main.Logging;

import java.sql.ResultSet;
import java.sql.SQLException;

public class LangItemData extends AbstractDAO<Object> {
    public LangItemData(HikariDataSource dataSource) {
        super(dataSource);
    }

    @Override
    public void load(Object obj) {
    }

    public ResultSet load(int id) {
        Result result = null;
        ResultSet RS = null;
        try {
            result = getData("SELECT * from lang_items;");
            RS = result.resultSet;
            while(RS.next()) {
                try {
                    Logging.getInstance().write("boutique", "INSERT INTO site_shop_objects_templates VALUES('" + RS.getInt("id")
                            + "', '" + RS.getInt("type") + "', '" +
                            RS.getString("name").replace("{\"fr\":\"", "").replace("\"}", "").replace("'", "\\'") + "', '" +
                            RS.getString("description").replace("{\"fr\":\"", "").replace("\"}", "").replace("'", "\\'") + "', "
                            + "'" + RS.getInt("skin") + "', '" +
                            RS.getInt("level") + "', '" +
                            (RS.getString("effects") == null ? "" :
                                    RS.getString("effects")
                                            .replace("null", "")) + "');");
                } catch(Exception e) {
                    e.printStackTrace();
                    Logging.getInstance().write("boutique", "ERREUR : " + e.getMessage() + " " + e.getLocalizedMessage());
                }
            }


        } catch (SQLException e) {
            super.sendError("AnimationData load", e);
        } finally {
            close(result);
        }
        return RS;
    }

    @Override
    public boolean update(Object obj) {
        return false;
    }
}
