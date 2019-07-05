package scruffemu.database.active.data;

import com.zaxxer.hikari.HikariDataSource;

import scruffemu.area.map.entity.Animation;
import scruffemu.database.active.AbstractDAO;
import scruffemu.game.World;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AnimationData extends AbstractDAO<Animation> {
    public AnimationData(HikariDataSource dataSource) {
        super(dataSource);
    }

    @Override
    public void load(Object obj) {
    }

    public void load() {
        Result result = null;
        try {
            result = getData("SELECT * from animations");
            ResultSet RS = result.resultSet;
            while (RS.next()) {
                World.world.addAnimation(new Animation(RS.getInt("guid"), RS.getInt("id"), RS.getString("nom"), RS.getInt("area"), RS.getInt("action"), RS.getInt("size")));
            }
        } catch (SQLException e) {
            super.sendError("AnimationData load", e);
        } finally {
            close(result);
        }
    }

    @Override
    public boolean update(Animation obj) {
        return false;
    }
}
