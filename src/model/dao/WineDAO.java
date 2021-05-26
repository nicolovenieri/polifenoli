package model.dao;

import java.math.BigDecimal;
import java.util.List;

import model.dao.exception.DuplicatedObjectException;
import model.dao.exception.DataTruncationException;
import model.mo.Wine;

public interface WineDAO {

        public Wine create(
            String name,
            String product_image,
            BigDecimal price,
            String denominazione,
            String annata,
            int avalaibility,
            String vitigni,
            String temperature,
            String format,
            int alcool,
            String category,
            String description
        ) throws DuplicatedObjectException, DataTruncationException;

      public Wine findByWineId(Long WineId);

      public void modify(Wine wine)  throws DuplicatedObjectException, DataTruncationException;

      public void updateAvalaibility(Long wine_id, int order_quantity);

      public void delete(Wine wine);

      public List<Wine> findAll();

      public List<Wine> findByName(String name);

      public List<Wine> filterByCategory(String category);
}
