package com.company.Controllers;

import com.company.entities.Semiprecious;
import com.company.repositories.interfaces.ISemiPreciousRepo;

import java.util.List;

public class SemipreciousController {
    private final ISemiPreciousRepo repo;
    public SemipreciousController(ISemiPreciousRepo repo) {
        this.repo = repo;
    }
    public String addSemiPrecious(int weight, String name, boolean authenticity) {
        Semiprecious semiPrecious = new Semiprecious(weight, name, authenticity);
        boolean added = repo.addSemiPrecious(semiPrecious);
        return (added ? "You have successfully added new semi-precious stone!" : "Addition was failed!");
    }
    public String getSemiPrecious(int id) {
        Semiprecious semiPrecious = repo.getSemiPrecious(id);
        return (semiPrecious == null ? "Semi-precious stone wasn't found" : semiPrecious.toString());
    }
    public String getAllSemiPrecious() {
        List<Semiprecious> semiPreciousList = repo.getAllSemiPrecious();
        return semiPreciousList.toString();
    }
}