package model.dao;

import model.dao.exception.DuplicatedObjectException;
import model.mo.Wishlist;
import model.mo.User;
import model.mo.Wine;

import java.util.List;

public interface WishlistDAO {

        public Wishlist create(
            User user,
            Wine wine
        ) throws DuplicatedObjectException;

      public List<Wishlist> findWishlist(User user);

      public Wishlist remove(User user, Wine wine);
}
