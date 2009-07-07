package org.openmrs.module.amrsregistration.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.openmrs.Patient;
import org.openmrs.Person;
import org.openmrs.PersonAddress;
import org.openmrs.PersonAttribute;
import org.openmrs.PersonName;
import org.openmrs.api.context.Context;
import org.openmrs.module.amrsregistration.RemoteRegistrationService;
import org.openmrs.web.dwr.DWRPersonService;

public class DWRRemoteRegistrationService extends DWRPersonService {
    private RemoteRegistrationService getRemoteRegistrationService() {
        return ((RemoteRegistrationService) Context
                .getService(RemoteRegistrationService.class));
    }

    public List<Patient> getPatients(PersonName paramPersonName,
            PersonAddress paramPersonAddress, Set<PersonAttribute> paramSet,
            String paramString, Date paramDate, Integer paramInteger) {
        List<Person> localList = getRemoteRegistrationService().getPersons(
                paramPersonName, paramPersonAddress, paramSet, paramString,
                paramDate, paramInteger);
        ArrayList<Patient> localArrayList = new ArrayList<Patient>();
        for (Person localPerson : localList) {
            if (!(localPerson.isUser())) {
                localArrayList.add((Patient) localPerson);
            }
        }
        return localArrayList;
    }

    public String sayHello(String paramString) {
        return "Hello, " + paramString;
    }

    public PersonName getPersonName(Integer paramInteger) {
        Person localPerson = Context.getPersonService().getPerson(paramInteger);
        if (localPerson != null) {
            return localPerson.getPersonName();
        }
        return null;
    }
}
