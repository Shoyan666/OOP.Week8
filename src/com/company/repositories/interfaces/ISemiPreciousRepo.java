package com.company.repositories.interfaces;
import com.company.entities.Semiprecious;

import java.util.List;

public interface ISemiPreciousRepo {
    boolean addSemiPrecious(Semiprecious semiPrecious);
    Semiprecious getSemiPrecious(int id);
    List<Semiprecious> getAllSemiPrecious();
}
