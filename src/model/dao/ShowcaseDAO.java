package model.dao;
import model.mo.Showcase;

import java.util.List;
import model.dao.exception.DuplicatedObjectException;
import model.mo.Wine;

public interface ShowcaseDAO {

    public Showcase create(
            Long wine_id) throws DuplicatedObjectException;

    public List<Showcase> findAll();

    public void delete(Wine wine);
}
