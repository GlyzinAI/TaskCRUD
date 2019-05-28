package com.javarush.testtask.dao;

import com.javarush.testtask.model.Comp;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public class CompDAOImpl implements CompDAO {
    private SessionFactory sessionFactory;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Comp> allComponents(int page) {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from Comp order by id").setFirstResult(10 * (page - 1)).setMaxResults(10).list();
    }

    @Override
    public void add(Comp comp) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(comp);
    }

    @Override
    public void delete(Comp comp) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(comp);
    }

    @Override
    public void edit(Comp comp) {
        Session session = sessionFactory.getCurrentSession();
        session.update(comp);
    }

    @Override
    public Comp getById(int id) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(Comp.class, id);
    }

    @Override
    public int compCount() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("select count(*) from Comp", Number.class).getSingleResult().intValue();
    }

    @Override
    public int buildPC() {
        int count;
        try {
            count = sessionFactory.getCurrentSession().createQuery("select min(quantity) FROM Comp where necessary = true", Number.class).getSingleResult().intValue();
        } catch (NullPointerException e) {
            count = 0;
        }
        return count;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Comp> allComponents(int page, String needSelect, String searchName) {
        String q;
        Session session = sessionFactory.getCurrentSession();
        Query query;
        switch (needSelect) {
            case "need":
                q = "from Comp where necessary = true AND title LIKE :param order by id";
                break;
            case "notNeed":
                q = "from Comp where necessary = false AND title LIKE :param order by id";
                break;
            default:
                q = "from Comp where title LIKE :param order by id";
                break;
        }
        query = session.createQuery(q);
        query.setParameter("param", "%" + searchName + "%");
        return query.setFirstResult(10 * (page - 1)).setMaxResults(10).list();
    }

    @Override
    public boolean isCompExist(String searchName) {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("select count(*) from Comp where LOWER(title) = :param", Number.class).setParameter("param", searchName).getSingleResult().intValue() > 0;
    }

    @Override
    public int compCount(String needSelect, String searchName) {
        String q;
        Session session = sessionFactory.getCurrentSession();
        switch (needSelect) {
            case "need":
                q = "select count(*) from Comp where necessary = true AND title LIKE :param";
                break;
            case "notNeed":
                q = "select count(*) from Comp where necessary = false AND title LIKE :param";
                break;
            default:
                q = "select count(*) from Comp where title LIKE :param";
                break;
        }
        return session.createQuery(q, Number.class).setParameter("param", "%" + searchName + "%").getSingleResult().intValue();
    }
}
