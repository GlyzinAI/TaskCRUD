package com.javarush.testtask.service;

import com.javarush.testtask.model.Comp;

import java.util.List;

public interface CompService {

    List<Comp> allComponents(int page);

    void add(Comp components);

    void delete(Comp components);

    void edit(Comp components);

    Comp getById(int id);

    int compCount();

    int buildPC();

    List<Comp> allComponents(int page, String needSelect, String searchName);

    int compCount(String needSelect, String searchName);

    boolean isCompExist(String searchName);
}
