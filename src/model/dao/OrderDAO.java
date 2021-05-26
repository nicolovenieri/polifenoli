package model.dao;

import com.mysql.cj.x.protobuf.MysqlxCrud;
import model.dao.exception.DuplicatedObjectException;
import model.mo.User;
import model.mo.Wine;
import model.mo.Order;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.math.BigDecimal;

public interface OrderDAO {

    public Order create(
        User user,
        Wine wine,
        Long quantity,
        String status,
        Timestamp timestamp,
        BigDecimal total_amount
    );

    public List<Order> findOrders(User user);

    public List<Order> findBySingleOrder(User user, Timestamp timestamp);

    public void updateStatus(User user, Timestamp timestamp, String status);
}
