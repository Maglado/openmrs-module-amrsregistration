package org.openmrs.module.amrsregistration;

import java.util.Date;
import java.util.List;
import java.util.Set;
import org.openmrs.Patient;
import org.openmrs.Person;
import org.openmrs.PersonAddress;
import org.openmrs.PersonAttribute;
import org.openmrs.PersonName;
import org.openmrs.api.APIException;
import org.openmrs.module.amrsregistration.db.RemoteRegistrationDAO;

public abstract interface RemoteRegistrationService {
    public abstract void setRemoteRegistrationDAO(
            RemoteRegistrationDAO paramRemoteRegistrationDAO);

    public abstract void registerPatient(Patient paramPatient,
            String paramString1, String paramString2) throws APIException;

    public abstract List<Person> getPersons(PersonName paramPersonName,
            PersonAddress paramPersonAddress, Set<PersonAttribute> paramSet,
            String paramString, Date paramDate, Integer paramInteger)
            throws APIException;
}