package controller;

import java.math.BigDecimal;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;

import model.dao.*;
import model.mo.Preference;
import model.mo.Showcase;
import services.config.Configuration;
import services.logservice.LogService;

import model.mo.User;
import model.mo.Wine;
import model.dao.exception.DuplicatedObjectException;

public class UserProfile {

    private UserProfile() {
    }

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

            userRetrieve(daoFactory, sessionDAOFactory, request);

            daoFactory.commitTransaction();
            sessionDAOFactory.commitTransaction();

            request.setAttribute("loggedOn",loggedUser!=null);
            request.setAttribute("loggedUser", loggedUser);
            request.setAttribute("applicationMessage", applicationMessage);
            request.setAttribute("viewUrl", "userProfile/view");

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

    public static void editProfileView(HttpServletRequest request, HttpServletResponse response) {

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

            userRetrieve(daoFactory, sessionDAOFactory, request);

            daoFactory.commitTransaction();
            sessionDAOFactory.commitTransaction();

            request.setAttribute("loggedOn",loggedUser!=null);
            request.setAttribute("loggedUser", loggedUser);
            request.setAttribute("applicationMessage", applicationMessage);
            request.setAttribute("viewUrl", "userProfile/editView");

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

            UserDAO userDAO = daoFactory.getUserDAO();
            User user = userDAO.findByUserId(loggedUser.getUserId());

            long cap;
            long cvc;
            try {
                cap = Long.parseLong(request.getParameter("cap"));
                user.setCap(cap);

                cvc = Long.parseLong(request.getParameter("cvc"));
                user.setCvc(cvc);
            } catch (NumberFormatException e) { }

            user.setUsername(request.getParameter("username"));
            user.setPassword(request.getParameter("password"));
            user.setEmail(request.getParameter("email"));
            user.setName(request.getParameter("name"));
            user.setSurname(request.getParameter("surname"));
            user.setPhone(request.getParameter("phone"));
            user.setCity(request.getParameter("city"));
            //user.setCap(cap);
            user.setStreet(request.getParameter("street"));
            user.setCivic(request.getParameter("civic"));
            user.setCard_n(request.getParameter("card_n"));
            //user.setCvc(cvc);
            user.setExp_date(request.getParameter("exp_date"));

            userDAO.update(user);
            daoFactory.commitTransaction();
            sessionDAOFactory.commitTransaction();

            userRetrieve(daoFactory, sessionDAOFactory, request);
            request.setAttribute("loggedOn",loggedUser!=null);
            request.setAttribute("loggedUser", loggedUser);
            request.setAttribute("applicationMessage", applicationMessage);
            request.setAttribute("viewUrl", "userProfile/view");

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

    public static void deleteProfile(HttpServletRequest request, HttpServletResponse response) {

        DAOFactory sessionDAOFactory= null;
        DAOFactory daoFactory = null;
        User oldUser;

        Logger logger = LogService.getApplicationLogger();

        try {

            Map sessionFactoryParameters=new HashMap<String,Object>();
            sessionFactoryParameters.put("request",request);
            sessionFactoryParameters.put("response",response);
            sessionDAOFactory = DAOFactory.getDAOFactory(Configuration.COOKIE_IMPL,sessionFactoryParameters);
            sessionDAOFactory.beginTransaction();

            UserDAO sessionUserDAO = sessionDAOFactory.getUserDAO();
            oldUser = sessionUserDAO.findLoggedUser();
            sessionUserDAO.delete(null);

            daoFactory = DAOFactory.getDAOFactory(Configuration.DAO_IMPL,null);
            daoFactory.beginTransaction();

            userRetrieve(daoFactory, sessionDAOFactory, request);

            UserDAO userDAO = daoFactory.getUserDAO();

            try{
                userDAO.delete(oldUser);
            }
            catch(Exception e){
                logger.log(Level.SEVERE, "DAO Error", e);
            }

            wineRetrieve(daoFactory, sessionDAOFactory, request);
            showcaseWineRetrieve(daoFactory, sessionDAOFactory, request);

            int arrayPos;
            try {
                arrayPos = Integer.parseInt(request.getParameter("arrayPos"));
            } catch(NumberFormatException e) {
                arrayPos = 0;
            }

            daoFactory.commitTransaction();
            sessionDAOFactory.commitTransaction();

            request.setAttribute("arrayPos", arrayPos);

            request.setAttribute("loggedOn",false);
            request.setAttribute("loggedUser", null);
            request.setAttribute("viewUrl", "homeManagement/view");

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

    private static void wineRetrieve(DAOFactory daoFactory, DAOFactory sessionDAOFactory, HttpServletRequest request) {

        WineDAO wineDAO = daoFactory.getWineDAO();
        List<Wine> wines;
        wines = wineDAO.findAll();
        request.setAttribute("wines", wines);
    }

    private static void showcaseRetrieve(DAOFactory daoFactory, DAOFactory sessionDAOFactory, HttpServletRequest request) {

        ShowcaseDAO showcaseDAO = daoFactory.getShowcaseDAO();
        List<Showcase> showcases;
        showcases = showcaseDAO.findAll();
        request.setAttribute("showcases", showcases);

    }

    private static void showcaseWineRetrieve(DAOFactory daoFactory, DAOFactory sessionDAOFactory, HttpServletRequest request) {

        showcaseRetrieve(daoFactory, sessionDAOFactory, request);

        List<Wine> wines = new ArrayList<Wine>();

        try {
            List<Showcase> showcases = (List<Showcase>)request.getAttribute("showcases");
            WineDAO wineDAO = daoFactory.getWineDAO();
            Wine wine;

            for(int i = 0; i < showcases.size(); i++) {

                wine = wineDAO.findByWineId(showcases.get(i).getWineId());
                wines.add(wine);
            }
        } catch(Exception e) {  }

        if(!wines.isEmpty()) {
            request.setAttribute("showcase_wines", wines);
        }

    }

    private static void userRetrieve (DAOFactory daoFactory, DAOFactory sessionDAOFactory, HttpServletRequest request) {

        UserDAO sessionUserDAO = sessionDAOFactory.getUserDAO();
        User loggedUser = sessionUserDAO.findLoggedUser();

        UserDAO userDAO = daoFactory.getUserDAO();
        User user = userDAO.findByUserId(loggedUser.getUserId());
        request.setAttribute("user", user);
    }

    private static void preferencesRetrieve(DAOFactory daoFactory, DAOFactory sessionDAOFactory, HttpServletRequest request, Long user_id) {

        List<Wine> wines = new ArrayList<Wine>();
        WineDAO wineDAO = daoFactory.getWineDAO();

        PreferenceDAO preferenceDAO = daoFactory.getPreferenceDAO();
        List<Preference> preferences = new ArrayList<Preference>();
        String[] categoryArray = {"Rosso", "Bianco", "Spumante", "Altro"};

        for (int k = 0; k < categoryArray.length; k++) {
            if(preferenceDAO.findByUserCategory(user_id, categoryArray[k]) != null) {
                preferences.add(preferenceDAO.findByUserCategory(user_id, categoryArray[k]));
            }
        }

        Long preferredCategoryCounter = 0L;
        String preferredCategory = null;

        for(int k = 0; k < preferences.size(); k++) {
            if(preferences.get(k).getTimes() > preferredCategoryCounter) {
                preferredCategoryCounter = preferences.get(k).getTimes();
                preferredCategory = preferences.get(k).getCategory();
            }
        }

        wines = wineDAO.filterByCategory(preferredCategory);
        Random rand = new Random();
        int upperbound = wines.size();
        List<Wine> preferred_wines = new ArrayList<Wine>();

        for(int k = 0; k < 5 && preferred_wines.size()<upperbound; k++) {
            Wine randomItem = wines.get(rand.nextInt(upperbound));
            int z=0;
            while(preferred_wines.contains(randomItem) && preferred_wines.size()<upperbound) {
                randomItem = wines.get(rand.nextInt(upperbound));
                z++;
            }
            preferred_wines.add(randomItem);
        }
        request.setAttribute("preferred_wines", preferred_wines);
    }
}
