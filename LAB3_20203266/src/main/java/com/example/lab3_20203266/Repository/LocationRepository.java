package com.example.lab3_20203266.Repository;

import com.example.lab3_20203266.Entity.Location;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.data.repository.query.Param;

public interface LocationRepository extends JpaRepository<Location, Long> {

    @Transactional
    @Modifying
    @Query("""
        UPDATE Location l SET l.city = :city, l.postalCode = :postalCode
        WHERE l.locationId = :locationId
    """)
    void actualizarCiudadYCodigoPostal(@Param("city") String city,
                                       @Param("postalCode") String postalCode,
                                       @Param("locationId") Long locationId);
}
