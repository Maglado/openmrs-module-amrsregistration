package org.openmrs.module.amrsregistration.web.controller;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.Location;
import org.openmrs.Patient;
import org.openmrs.PatientIdentifier;
import org.openmrs.PatientIdentifierType;
import org.openmrs.Person;
import org.openmrs.PersonAddress;
import org.openmrs.PersonAttribute;
import org.openmrs.PersonAttributeType;
import org.openmrs.PersonName;
import org.springframework.validation.BindException;
import org.springframework.validation.Errors;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.mvc.AbstractWizardFormController;
import org.springframework.web.servlet.view.RedirectView;

public class PatientRegistrationFormController extends
        AbstractWizardFormController {
    Log log;
    Patient patient;

    public PatientRegistrationFormController() {
        this.log = LogFactory.getLog(super.getClass());
    }

    protected Object formBackingObject(
            HttpServletRequest paramHttpServletRequest)
            throws ModelAndViewDefiningException {
        if (this.patient == null) {
            return getNewPatient();
        }
        return this.patient;
    }

    protected Map<String, String> referenceData(
            HttpServletRequest paramHttpServletRequest, Object paramObject,
            Error paramError, int paramInt) {
        HashMap<String, String> localHashMap = new HashMap<String, String>();
        switch (paramInt) {
        case 0:
            break;
        case 1:
            break;
        case 2:
        }

        return localHashMap;
    }

    protected int getTargetPage(HttpServletRequest paramHttpServletRequest,
            Object paramObject, Errors paramErrors, int paramInt) {
        int i = super.getTargetPage(paramHttpServletRequest, paramObject,
                paramErrors, paramInt);

        switch (paramInt) {
        case 0:
            this.patient = null;
            break;
        case 1:
            if (this.patient == null) {
                this.patient = ((Patient) paramObject);
            }

            String str1 = ServletRequestUtils.getStringParameter(
                    paramHttpServletRequest, "familyName_0", "Bronson");

            this.patient.getPersonName().setFamilyName(str1);

            break;
        case 2:
            /*
            if (this.patient == null) {
                this.patient = ((Patient) paramObject);
                log.error("Error: Null patient submitted to viewPatient.form");
            }
            */

            String str2 = ServletRequestUtils.getStringParameter(
                    paramHttpServletRequest, "familyName_0", "Charles");

            this.patient.getPersonName().setFamilyName(str2);
            
        }

        return i;
    }

    protected void onBindAndValidate(
            HttpServletRequest paramHttpServletRequest, Object paramObject,
            BindException paramBindException, int paramInt) {
        @SuppressWarnings("unused")
        Patient localPatient = (Patient) paramObject;
    }

    protected ModelAndView processCancel(
            HttpServletRequest paramHttpServletRequest,
            HttpServletResponse paramHttpServletResponse, Object paramObject,
            BindException paramBindException) throws Exception {
        this.patient = null;
        return new ModelAndView(new RedirectView(paramHttpServletRequest
                .getContextPath()
                + "/module/amrsregistration/start.form"));
    }

    protected ModelAndView processFinish(
            HttpServletRequest paramHttpServletRequest,
            HttpServletResponse paramHttpServletResponse, Object paramObject,
            BindException paramBindException) throws Exception {
        this.patient = null;
        return new ModelAndView(new RedirectView(paramHttpServletRequest
                .getContextPath()
                + "/module/amrsregistration/start.form"));
    }

    private Patient getNewPatient() {
        HashSet<PersonName> localHashSet1 = new HashSet<PersonName>();
        localHashSet1.add(new PersonName());
        HashSet<PersonAddress> localHashSet2 = new HashSet<PersonAddress>();
        localHashSet2.add(new PersonAddress());
        HashSet<PersonAttribute> localHashSet3 = new HashSet<PersonAttribute>();
        PersonAttribute localPersonAttribute = new PersonAttribute();
        localPersonAttribute.setAttributeType(new PersonAttributeType());
        localHashSet3.add(localPersonAttribute);
        HashSet<PatientIdentifier> localHashSet4 = new HashSet<PatientIdentifier>();
        PatientIdentifier localPatientIdentifier = new PatientIdentifier();
        localPatientIdentifier.setIdentifierType(new PatientIdentifierType());
        localPatientIdentifier.setLocation(new Location());
        localHashSet4.add(localPatientIdentifier);
        Person localPerson = new Person();
        localPerson.setNames(localHashSet1);
        localPerson.setAddresses(localHashSet2);
        localPerson.setAttributes(localHashSet3);
        this.patient = new Patient(localPerson) {
            private static final long serialVersionUID = 1L;

            public PatientIdentifier getPatientIdentifier() {
                if ((getIdentifiers() != null) && (getIdentifiers().size() > 0)) {
                    return ((PatientIdentifier) getIdentifiers().toArray()[0]);
                }
                return new PatientIdentifier();
            }

            public PersonAddress getPersonAddress() {
                if ((getAddresses() != null) && (getAddresses().size() > 0)) {
                    return ((PersonAddress) getAddresses().toArray()[0]);
                }
                return new PersonAddress();
            }
        };
        this.patient.getIdentifiers().add(new PatientIdentifier());
        return this.patient;
    }
}
