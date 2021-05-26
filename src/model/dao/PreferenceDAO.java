package model.dao;

import model.dao.exception.DuplicatedObjectException;
import model.mo.Preference;
import model.mo.Wine;

import java.util.List;

public interface PreferenceDAO {

    public Preference create(
            Long user_id,
            String category,
            Long times) throws DuplicatedObjectException;

    public void update(Preference preference) throws DuplicatedObjectException;

    public Preference findByUserCategory(Long user_id, String category);

    public List<Preference> findAll(Long user_id);
}