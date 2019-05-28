package com.javarush.testtask.controller;

import com.javarush.testtask.model.Comp;
import com.javarush.testtask.service.CompService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class CompController {
    private CompService compService;
    private int page;
    private String searchName = "";
    private String needSelect = "all";
    private int compCount;
    private int buildPC;
    private int pagesCount;

    @Autowired
    public void setCompService(CompService compService) {
        this.compService = compService;
    }

    @GetMapping("/")
    public ModelAndView allParts(@RequestParam(defaultValue = "1") int page) {
        this.page = page;
        List<Comp> compList = compService.allComponents(page, needSelect, searchName);
        compCount = compService.compCount(needSelect, searchName);
        buildPC = compService.buildPC();
        pagesCount = (compCount + 9) / 10;
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("comp");
        modelAndView.addObject("page", page);
        modelAndView.addObject("compList1", compList);
        modelAndView.addObject("compCount", compCount);
        modelAndView.addObject("pagesCount", pagesCount);
        modelAndView.addObject("buildPC", buildPC);
        modelAndView.addObject("searchName", searchName);
        modelAndView.addObject("needSelect", needSelect);
        return modelAndView;
    }

    @GetMapping("/edit/{id}")
    public ModelAndView editPage(@PathVariable("id") int id, @ModelAttribute("message") String message) {
        Comp comp = compService.getById(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("addEditPage");
        modelAndView.addObject("comp", comp);
        modelAndView.addObject("page", page);
        return modelAndView;
    }

    @PostMapping("/edit")
    public ModelAndView editPart(@ModelAttribute("comp") Comp components) {
        ModelAndView modelAndView = new ModelAndView();
        if (compService.isCompExist(components.getTitle().toLowerCase()) && !compService.getById(components.getId()).getTitle().toLowerCase().equals(components.getTitle().toLowerCase())) {
            modelAndView.setViewName("redirect:/edit/" + components.getId());
            modelAndView.addObject("message", "Exist");
        } else {
            compService.edit(components);
            modelAndView.setViewName("redirect:/?page=" + this.page);
        }
        return modelAndView;
    }

    @GetMapping("/add")
    public ModelAndView addPage(@ModelAttribute("message") String message) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("addEditPage");
        return modelAndView;
    }

    @PostMapping("/add")
    public ModelAndView addPart(@ModelAttribute("comp") Comp components) {
        ModelAndView modelAndView = new ModelAndView();
        needSelect = "all";
        searchName = "";
        compCount = compService.compCount(needSelect, searchName);
        pagesCount = (compCount + 9) / 10;

        if (compService.isCompExist(components.getTitle().toLowerCase())) {
            modelAndView.setViewName("redirect:/add");
            modelAndView.addObject("message", "Exist");
        } else {
            compService.add(components);
            compCount = compService.compCount(needSelect, searchName);
            pagesCount = (compCount + 9) / 10;
            modelAndView.setViewName("redirect:/?page=" + pagesCount);
        }
        return modelAndView;
    }

    @GetMapping("/delete/{id}")
    public ModelAndView deletePart(@PathVariable("id") int id) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("redirect:/?page=" + this.page);
        Comp components = compService.getById(id);
        compService.delete(components);
        return modelAndView;
    }

    @PostMapping("/select")
    public ModelAndView Select(@ModelAttribute("needSelect") String needSelect) {
        this.needSelect = needSelect;
        return allParts(1);
    }

    @PostMapping("/search")
    public ModelAndView Search(@ModelAttribute("searchName") String searchName) {
        this.searchName = searchName.trim();
        return allParts(1);
    }

    @GetMapping("/search")
    public ModelAndView SearchAll() {
        this.needSelect = "all";
        this.searchName = "";
        return allParts(1);
    }
}
