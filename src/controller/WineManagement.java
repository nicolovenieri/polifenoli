package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.jdbc.exceptions.MysqlDataTruncation;
import services.config.Configuration;
import services.logservice.LogService;

import model.mo.User;
import model.mo.Wine;
import model.dao.DAOFactory;
import model.dao.UserDAO;
import model.dao.WineDAO;
import model.dao.exception.DuplicatedObjectException;
import model.dao.exception.DataTruncationException;
import java.math.BigDecimal;

public class WineManagement {

    private WineManagement() { }


    public static void view(HttpServletRequest request, HttpServletResponse response) {

        DAOFactory sessionDAOFactory= null;
        DAOFactory daoFactory = null;
        User loggedUser;
        String applicationMessage = null;

        Logger logger = LogService.getApplicationLogger();

        try {

            Map sessionFactoryParameters=new HashMap<String,Object>();
            sessionFactoryParameters.put("request",request);
            sessionFactoryParameters.put("response",response);
            sessionDAOFactory = DAOFactory.getDAOFactory(Configuration.COOKIE_IMPL,sessionFactoryParameters);
            sessionDAOFactory.beginTransaction();

            UserDAO sessionUserDAO = sessionDAOFactory.getUserDAO();
            loggedUser = sessionUserDAO.findLoggedUser();

            daoFactory = DAOFactory.getDAOFactory(Configuration.DAO_IMPL,null);
            daoFactory.beginTransaction();

            List<Wine> wines = wineRetrieve(daoFactory, sessionDAOFactory, request);

            int maxViewSize;
            if(wines.size() < 8) {
                maxViewSize = wines.size();
            } else{
                maxViewSize = 8;
            }
            try {
                maxViewSize = Integer.parseInt(request.getParameter("maxViewSize"));
            } catch(NumberFormatException | NullPointerException e) { }

            daoFactory.commitTransaction();
            sessionDAOFactory.commitTransaction();

            request.setAttribute("maxViewSize", maxViewSize);
            request.setAttribute("loggedUser", loggedUser);
            request.setAttribute("loggedOn",loggedUser!=null);
            request.setAttribute("applicationMessage", applicationMessage);
            request.setAttribute("viewUrl", "adminManagement/wineManagement");

        } catch (Exception e) {
            logger.log(Level.SEVERE, "Controller Error", e);
            try {
                if (sessionDAOFactory != null) sessionDAOFactory.rollbackTransaction();
            } catch (Throwable t) {
            }
            throw new RuntimeException(e);

        } finally {
            try {
                if (sessionDAOFactory != null) sessionDAOFactory.closeTransaction();
            } catch (Throwable t) {
            }
        }
    }


    public static void insertView(HttpServletRequest request, HttpServletResponse response) {

        DAOFactory sessionDAOFactory=null;
        User loggedUser;

        Logger logger = LogService.getApplicationLogger();

        try {

            Map sessionFactoryParameters=new HashMap<String,Object>();
            sessionFactoryParameters.put("request",request);
            sessionFactoryParameters.put("response",response);
            sessionDAOFactory = DAOFactory.getDAOFactory(Configuration.COOKIE_IMPL,sessionFactoryParameters);
            sessionDAOFactory.beginTransaction();

            UserDAO sessionUserDAO = sessionDAOFactory.getUserDAO();
            loggedUser = sessionUserDAO.findLoggedUser();

            request.setAttribute("loggedOn",loggedUser!=null);
            request.setAttribute("loggedUser", loggedUser);
            request.setAttribute("viewUrl", "adminManagement/wineInsModView");

        } catch (Exception e) {
            logger.log(Level.SEVERE, "Controller Error", e);
            try {
                if (sessionDAOFactory != null) sessionDAOFactory.rollbackTransaction();
            } catch (Throwable t) {
            }
            throw new RuntimeException(e);

        } finally {
            try {
                if (sessionDAOFactory != null) sessionDAOFactory.closeTransaction();
            } catch (Throwable t) {
            }
        }
    }

    public static void insert(HttpServletRequest request, HttpServletResponse response) {

        DAOFactory sessionDAOFactory= null;
        DAOFactory daoFactory = null;
        String applicationMessage = null;
        User loggedUser;

        Logger logger = LogService.getApplicationLogger();

        try {

            Map sessionFactoryParameters=new HashMap<String,Object>();
            sessionFactoryParameters.put("request",request);
            sessionFactoryParameters.put("response",response);
            sessionDAOFactory = DAOFactory.getDAOFactory(Configuration.COOKIE_IMPL,sessionFactoryParameters);
            sessionDAOFactory.beginTransaction();

            daoFactory = DAOFactory.getDAOFactory(Configuration.DAO_IMPL,null);
            daoFactory.beginTransaction();

            UserDAO sessionUserDAO = sessionDAOFactory.getUserDAO();
            loggedUser = sessionUserDAO.findLoggedUser();

            WineDAO wineDAO = daoFactory.getWineDAO();

            BigDecimal price = new BigDecimal(request.getParameter("price"));
            int avalaibility = Integer.parseInt(request.getParameter("avalaibility"));
            int alcool = Integer.parseInt(request.getParameter("alcool"));
            try {

                wineDAO.create(
                        request.getParameter("name"),
                        request.getParameter("product_image"),
                        price,
                        request.getParameter("denominazione"),
                        request.getParameter("annata"),
                        avalaibility,
                        request.getParameter("vitigni"),
                        request.getParameter("temperature"),
                        request.getParameter("format"),
                        alcool,
                        request.getParameter("category"),
                        request.getParameter("description")
                        );

            } catch (DuplicatedObjectException e) {
                applicationMessage = "Vino già esistente";
                logger.log(Level.INFO, "Tentativo di inserimento di vino già esistente");
            } catch (DataTruncationException e) {
                applicationMessage = "importo massimo consentito: sei cifre intere e due decimali.";
            }

            wineRetrieve(daoFactory, sessionDAOFactory, request);

            daoFactory.commitTransaction();
            sessionDAOFactory.commitTransaction();

            request.setAttribute("loggedOn",loggedUser!=null);
            request.setAttribute("loggedUser", loggedUser);
            request.setAttribute("applicationMessage", applicationMessage);
            request.setAttribute("viewUrl", "adminManagement/wineManagement");

        } catch (Exception e) {
            logger.log(Level.SEVERE, "Controller Error", e);
            try {
                if (daoFactory != null) daoFactory.rollbackTransaction();
                if (sessionDAOFactory != null) sessionDAOFactory.rollbackTransaction();
            } catch (Throwable t) {
            }
            throw new RuntimeException(e);

        } finally {
            try {
                if (daoFactory != null) daoFactory.closeTransaction();
                if (sessionDAOFactory != null) sessionDAOFactory.closeTransaction();
            } catch (Throwable t) {
            }
        }

    }

    public static void modifyView(HttpServletRequest request, HttpServletResponse response) {

        DAOFactory sessionDAOFactory=null;
        DAOFactory daoFactory = null;
        User loggedUser;

        Logger logger = LogService.getApplicationLogger();

        try {

            Map sessionFactoryParameters=new HashMap<String,Object>();
            sessionFactoryParameters.put("request",request);
            sessionFactoryParameters.put("response",response);
            sessionDAOFactory = DAOFactory.getDAOFactory(Configuration.COOKIE_IMPL,sessionFactoryParameters);
            sessionDAOFactory.beginTransaction();

            UserDAO sessionUserDAO = sessionDAOFactory.getUserDAO();
            loggedUser = sessionUserDAO.findLoggedUser();

            daoFactory = DAOFactory.getDAOFactory(Configuration.DAO_IMPL,null);
            daoFactory.beginTransaction();

            Long wine_id = new Long(request.getParameter("wine_id"));

            WineDAO wineDAO = daoFactory.getWineDAO();
            Wine wine = wineDAO.findByWineId(wine_id);

            daoFactory.commitTransaction();
            sessionDAOFactory.commitTransaction();

            request.setAttribute("loggedOn",loggedUser!=null);
            request.setAttribute("loggedUser", loggedUser);
            request.setAttribute("wine", wine);
            request.setAttribute("viewUrl", "adminManagement/wineInsModView");

        } catch (Exception e) {
            logger.log(Level.SEVERE, "Controller Error", e);
            try {
                if (sessionDAOFactory != null) sessionDAOFactory.rollbackTransaction();
            } catch (Throwable t) {
            }
            throw new RuntimeException(e);

        } finally {
            try {
                if (sessionDAOFactory != null) sessionDAOFactory.closeTransaction();
            } catch (Throwable t) {
            }
        }
    }

    public static void modify(HttpServletRequest request, HttpServletResponse response) {

        DAOFactory sessionDAOFactory= null;
        DAOFactory daoFactory = null;
        String applicationMessage = null;
        User loggedUser;

        Logger logger = LogService.getApplicationLogger();

        try {

            Map sessionFactoryParameters=new HashMap<String,Object>();
            sessionFactoryParameters.put("request",request);
            sessionFactoryParameters.put("response",response);
            sessionDAOFactory = DAOFactory.getDAOFactory(Configuration.COOKIE_IMPL,sessionFactoryParameters);
            sessionDAOFactory.beginTransaction();

            UserDAO sessionUserDAO = sessionDAOFactory.getUserDAO();
            loggedUser = sessionUserDAO.findLoggedUser();

            daoFactory = DAOFactory.getDAOFactory(Configuration.DAO_IMPL,null);
            daoFactory.beginTransaction();

            Long wine_id = new Long(request.getParameter("wine_id"));

            WineDAO wineDAO = daoFactory.getWineDAO();
            Wine wine = wineDAO.findByWineId(wine_id);

            BigDecimal price = new BigDecimal(request.getParameter("price"));
            int avalaibility = Integer.parseInt(request.getParameter("avalaibility"));
            int alcool = Integer.parseInt(request.getParameter("alcool"));

            wine.setName(request.getParameter("name"));
            wine.setProductImage(request.getParameter("product_image"));
            wine.setPrice(price);
            wine.setDenominazione(request.getParameter("denominazione"));
            wine.setAnnata(request.getParameter("annata"));
            wine.setAvalaibility(avalaibility);
            wine.setVitigni(request.getParameter("vitigni"));
            wine.setTemperature(request.getParameter("temperature"));
            wine.setFormat(request.getParameter("format"));
            wine.setAlcool(alcool);
            wine.setCategory(request.getParameter("category"));
            wine.setDescription(request.getParameter("description"));

            try {
                wineDAO.modify(wine);
                applicationMessage = "Modifica avvenuta correttamente";
            } catch (DuplicatedObjectException e) {
                applicationMessage = "Vino già esistente";
                logger.log(Level.INFO, "Tentativo di inserimento di vino già esistente");
            } catch (DataTruncationException e) {
                applicationMessage = "Errore nella modifica del prezzo: importo massimo consentito: sei cifre intere e due decimali.";
                logger.log(Level.INFO, "Importo massimo consentito: sei cifre intere e due decimali.");
            }

            wineRetrieve(daoFactory, sessionDAOFactory, request);

            daoFactory.commitTransaction();
            sessionDAOFactory.commitTransaction();

            wineRetrieve(daoFactory, sessionDAOFactory, request);
            request.setAttribute("loggedOn",loggedUser!=null);
            request.setAttribute("loggedUser", loggedUser);
            request.setAttribute("applicationMessage", applicationMessage);
            request.setAttribute("viewUrl", "adminManagement/wineManagement");

        } catch (Exception e) {
            logger.log(Level.SEVERE, "Controller Error", e);
            try {
                if (daoFactory != null) daoFactory.rollbackTransaction();
                if (sessionDAOFactory != null) sessionDAOFactory.rollbackTransaction();
            } catch (Throwable t) {
            }
            throw new RuntimeException(e);

        } finally {
            try {
                if (daoFactory != null) daoFactory.closeTransaction();
                if (sessionDAOFactory != null) sessionDAOFactory.closeTransaction();
            } catch (Throwable t) {
            }
        }

    }

    public static void delete(HttpServletRequest request, HttpServletResponse response) {

        DAOFactory sessionDAOFactory= null;
        DAOFactory daoFactory = null;
        User loggedUser;

        Logger logger = LogService.getApplicationLogger();

        try {

            Map sessionFactoryParameters=new HashMap<String,Object>();
            sessionFactoryParameters.put("request",request);
            sessionFactoryParameters.put("response",response);
            sessionDAOFactory = DAOFactory.getDAOFactory(Configuration.COOKIE_IMPL,sessionFactoryParameters);
            sessionDAOFactory.beginTransaction();

            UserDAO sessionUserDAO = sessionDAOFactory.getUserDAO();
            loggedUser = sessionUserDAO.findLoggedUser();

            daoFactory = DAOFactory.getDAOFactory(Configuration.DAO_IMPL,null);
            daoFactory.beginTransaction();

            Long wine_id = new Long(request.getParameter("wine_id"));

            WineDAO wineDAO = daoFactory.getWineDAO();
            Wine wine = wineDAO.findByWineId(wine_id);

            //faccio la delete e catcho la Null pointer exception che avviene nel
            //caso un utente aggiorni la pagina dopo aver cliccato sul pulsante cestino
            try{
                wineDAO.delete(wine);
            }
            catch(NullPointerException e){
                request.setAttribute("viewUrl", "adminManagement/view");
            }

            wineRetrieve(daoFactory, sessionDAOFactory, request);

            daoFactory.commitTransaction();
            sessionDAOFactory.commitTransaction();

            request.setAttribute("loggedOn",loggedUser!=null);
            request.setAttribute("loggedUser", loggedUser);
            request.setAttribute("viewUrl", "adminManagement/wineManagement");

        } catch (Exception e) {
            logger.log(Level.SEVERE, "Controller Error", e);
            try {
                if (daoFactory != null) daoFactory.rollbackTransaction();
                if (sessionDAOFactory != null) sessionDAOFactory.rollbackTransaction();
            } catch (Throwable t) {
            }
            throw new RuntimeException(e);


        } finally {
            try {
                if (daoFactory != null) daoFactory.closeTransaction();
                if (sessionDAOFactory != null) sessionDAOFactory.closeTransaction();
            } catch (Throwable t) {
            }
        }

    }

    public static void searchView(HttpServletRequest request, HttpServletResponse response) {

        DAOFactory sessionDAOFactory= null;
        DAOFactory daoFactory = null;
        User loggedUser;

        Logger logger = LogService.getApplicationLogger();

        try {

            Map sessionFactoryParameters=new HashMap<String,Object>();
            sessionFactoryParameters.put("request",request);
            sessionFactoryParameters.put("response",response);
            sessionDAOFactory = DAOFactory.getDAOFactory(Configuration.COOKIE_IMPL,sessionFactoryParameters);
            sessionDAOFactory.beginTransaction();

            UserDAO sessionUserDAO = sessionDAOFactory.getUserDAO();
            loggedUser = sessionUserDAO.findLoggedUser();

            daoFactory = DAOFactory.getDAOFactory(Configuration.DAO_IMPL,null);
            daoFactory.beginTransaction();

            wineSearch(daoFactory, sessionDAOFactory, request);

            daoFactory.commitTransaction();
            sessionDAOFactory.commitTransaction();

            request.setAttribute("loggedOn",loggedUser!=null);
            request.setAttribute("loggedUser", loggedUser);
            request.setAttribute("viewUrl", "adminManagement/wineManagement");

        } catch (Exception e) {
            logger.log(Level.SEVERE, "Controller Error", e);
            try {
                if (sessionDAOFactory != null) sessionDAOFactory.rollbackTransaction();
            } catch (Throwable t) {
            }
            throw new RuntimeException(e);

        } finally {
            try {
                if (sessionDAOFactory != null) sessionDAOFactory.closeTransaction();
            } catch (Throwable t) {
            }
        }

    }

    private static List<Wine> wineRetrieve(DAOFactory daoFactory, DAOFactory sessionDAOFactory, HttpServletRequest request) {

        WineDAO wineDAO = daoFactory.getWineDAO();
        List<Wine> wines;
        wines = wineDAO.findAll();
        request.setAttribute("wines", wines);
        return wines;

    }

    private static void categoryRetrieve(DAOFactory daoFactory, DAOFactory sessionDAOFactory, HttpServletRequest request) {

        WineDAO wineDAO = daoFactory.getWineDAO();
        List<Wine> wines;
        wines = wineDAO.filterByCategory(request.getParameter("category"));
        request.setAttribute("wines", wines);

    }

    private static void wineSearch(DAOFactory daoFactory, DAOFactory sessionDAOFactory, HttpServletRequest request) {

        WineDAO wineDAO = daoFactory.getWineDAO();
        List<Wine> wines;
        wines = wineDAO.findByName(request.getParameter("searchString"));
        request.setAttribute("wines", wines);
    }

}
