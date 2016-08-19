/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.api;

import java.util.List;
import org.openmrs.Concept;
import org.openmrs.Patient;
import org.openmrs.api.OpenmrsService;
import org.openmrs.module.drugorders.drugordersdiseases;

/**
 *
 * @author harini-geek
 */
public interface drugordersdiseasesService extends OpenmrsService{
    
    public drugordersdiseases saveDrugOrder(drugordersdiseases order);
    public List<drugordersdiseases> getDrugOrdersByDisease(Concept concept);
    public List<drugordersdiseases> getDrugOrdersByPatient(Patient patient);
    public void deleteDrugOrder(drugordersdiseases order);
    
}