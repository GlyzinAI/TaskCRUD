package com.javarush.testtask.service;

import com.javarush.testtask.dao.CompDAO;
import com.javarush.testtask.model.Comp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CompServiceImpl implements CompService {
    private CompDAO compDAO;

    @Autowired
    public void setCompDAO(CompDAO compDAO) {
        this.compDAO = compDAO;
    }

    @Transactional
    @Override
    public List<Comp> allComponents(int page) {
        return compDAO.allComponents(page);
    }

    @Transactional
    @Override
    public void add(Comp components) {
        compDAO.add(components);
    }

    @Transactional
    @Override
    public void delete(Comp components) {
        compDAO.delete(components);
    }

    @Transactional
    @Override
    public void edit(Comp components) {
        compDAO.edit(components);
    }

    @Transactional
    @Override
    public Comp getById(int id) {
        return compDAO.getById(id);
    }

    @Transactional
    @Override
    public int compCount() {
        return compDAO.compCount();
    }

    @Transactional
    @Override
    public int buildPC() {
        return compDAO.buildPC();
    }

    @Transactional
    public List<Comp> allComponents(int page, String needSelect, String searchName) {
        return compDAO.allComponents(page, needSelect, searchName);
    }

    @Transactional
    public boolean isCompExist(String searchName) {
        return compDAO.isCompExist(searchName);
    }

    @Transactional
    public int compCount(String needSelect, String searchName) {
        return compDAO.compCount(needSelect, searchName);
    }


}
