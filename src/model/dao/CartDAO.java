package model.dao;

import model.dao.exception.DuplicatedObjectException;
import model.mo.User;
import model.mo.Wine;
import model.mo.Cart;

import java.util.List;

public interface CartDAO {

        public Cart create(
        User user,
        Wine wine,
        long quantity
        ) throws DuplicatedObjectException;

      public List<Cart> findCart(User user);

      public Cart remove(User user, Wine wine);

      public Cart removeBlock(User user, Wine wine);

      public void deleteCart(User user);
}
