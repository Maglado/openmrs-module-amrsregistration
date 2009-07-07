<%@ include file="/WEB-INF/template/include.jsp" %>

<openmrs:require privilege="Register Patients" otherwise="/login.htm" redirect="/admin/amrsregistration/start.form" />

<%@ include file="/WEB-INF/template/header.jsp" %>
<%@ include file="localHeader.jsp" %>

<h2><spring:message code="amrsregistration.start.title"/></h2>
<span><spring:message code="amrsregistration.start.details"/></span>
<br/><br/>
<form id="identifierForm" method="post">
    <b class="boxHeader"><spring:message code="amrsregistration.edit"/> </b>
    <table class="box" border="0" cellspacing="2" cellpadding="2">
        <c:forEach items="${patient.names}" var="name" varStatus="varStatus">
                <spring:nestedPath path="patient.names[${varStatus.index}]">
                    <tr id="name${varStatus.index}Data" >
                        <th align="left" valign="top">
                            <!-- spring:message code="general.preferred"/ -->
                        </th>
                        <th align="left" valign="top">
                            Prefix<!-- spring:message code="PersonName.prefix"-->
                        </th>
                        <th align="left" valign="top">
                            <spring:message code="PersonName.givenName"/>
                        </th>
                        <th>
                            <spring:message code="PersonName.middleName"/>
                        </th>
                        <th>&nbsp;</th>
                        <th>
                            Prefix<!-- spring:message code="PersonName.familyNamePrefix"/ -->
                        </th>
                        <th>
                            <spring:message code="PersonName.familyName"/>
                        </th>
                        <th>
                            <spring:message code="PersonName.familyName2"/>
                        </th>
                        <th>
                            Suffix<!-- spring:message code="PersonName.familyNameSuffix"/ -->
                        </th>
                        <th>
                            <spring:message code="PersonName.degree"/>
                        </th>
                    </tr>
                    <tr>
                        <spring:bind path="personNameId">
                            <input type="hidden" id="personNameId_${varStatus.index}" value="${status.value}"/>
                        </spring:bind>
                        <td align="left" valign="top">
                            ${varStatus.index}&nbsp;
                            <spring:bind path="preferred">
                                <input type="checkbox" id="personName.preferred_${varStatus.index}" value="${status.value}" <c:if test="${status.value == 'true'}">checked</c:if>/>
                            </spring:bind>
                        </td>
                        <td align="left" valign="top">
                            <spring:bind path="prefix">
                                <input type="text" id="prefix_${varStatus.index}" size="3" value="${status.value}" onkeyup="patientSearch(this.value)"/>
                            </spring:bind>
                        </td>
                        <td align="left" valign="top">
                            <spring:bind path="givenName">
                                <input type="text" id="givenName_${varStatus.index}" size="16" value="${status.value}" onkeyup="patientSearch(this.value)"/>
                            </spring:bind>
                        </td>
                        <td align="left" valign="top">
                            <spring:bind path="middleName">
                                <input type="text" id="middleName_${varStatus.index}" size="12" value="${status.value}" onkeyup="patientSearch(this.value)"/>
                            </spring:bind>
                        </td>
                        <td>&nbsp;</td>
                        <td align="left" valign="top">
                            <spring:bind path="familyNamePrefix">
                                <input type="text" id="familyNamePrefix_${varStatus.index}" size="3" value="${status.value}" onkeyup="patientSearch(this.value)"/>
                            </spring:bind>
                        </td>
                        <td align="left" valign="top">
                            <spring:bind path="familyName">
                                <input type="text" id="familyName_${varStatus.index}" size="16" value="${status.value}" onkeyup="patientSearch(this.value)"/>
                            </spring:bind>
                        </td>
                        <td align="left" valign="top">
                            <spring:bind path="familyName2">
                                <input type="text" id="familyName2_${varStatus.index}" size="16" value="${status.value}" onkeyup="patientSearch(this.value)"/>
                            </spring:bind>
                        </td>
                        <td align="left" valign="top">
                            <spring:bind path="familyNameSuffix">
                                <input type="text" id="familyNameSuffix_${varStatus.index}" size="3" value="${status.value}" onkeyup="patientSearch(this.value)"/>
                            </spring:bind>
                        </td>
                        <td align="left" valign="top">
                            <spring:bind path="degree">
                                <input type="text" id="degree_${varStatus.index}" size="4" value="${status.value}" onkeyup="patientSearch(this.value)"/>
                            </spring:bind>
                        </td>
                    </tr>
                </spring:nestedPath>
        </c:forEach>
        </table>
        <br/>
        <table class="box" border="0" cellspacing="2" cellpadding="2">
            <b class="boxHeader"><spring:message code="amrsregistration.edit.address"/></b>
            <c:forEach items="${patient.addresses}" var="address" varStatus="varStatus">
                    <spring:nestedPath path="patient.addresses[${varStatus.index}]">
                        <tr id="address${varStatus.index}Data" >
                            <th align="left" valign="top">
                                ${varStatus.index}<!-- spring:message code="general.preferred"/ -->
                            </th>
                            <td align="left" valign="top">
                                <spring:bind path="personAddressId">
                                    <input type="hidden" id="personAddressId_${varStatus.index}" value="${status.value}"/>
                                </spring:bind>
                                <spring:bind path="preferred">
                                    <input type="checkbox" id="personAddress.preferred_${varStatus.index}" value="${status.value}" <c:if test="${status.value == 'true'}">checked</c:if>/>
                                </spring:bind>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <spring:message code="PersonAddress.address1"/>
                            </th>
                            <td>
                                <spring:bind path="address1">
                                    <input type="text" id="address1_${varStatus.index}" value="${status.value}" onkeyup="patientSearch(this.value)"/>
                                </spring:bind>
                            </td>
                            <th align="right">
                                <spring:message code="PersonAddress.address2"/>
                            </th>
                            <td>
                                <spring:bind path="address2">
                                    <input type="text" id="address2_${varStatus.index}" value="${status.value}" onkeyup="patientSearch(this.value)"/>
                                </spring:bind>
                            </td>
                            <th align="right">
                                Neighborhood Cell <!-- spring:message code="PersonAddress.neighborhoodCell"/ -->
                            </th>
                            <td>
                                <spring:bind path="neighborhoodCell">
                                    <input type="text" id="neighborhoodCell_${varStatus.index}" value="${status.value}" onkeyup="patientSearch(this.value)"/>
                                </spring:bind>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <spring:message code="PersonAddress.cityVillage"/>
                            </th>
                            <td>
                                <spring:bind path="cityVillage">
                                    <input type="text" id="cityVillage_${varStatus.index}" value="${status.value}" onkeyup="patientSearch(this.value)"/>
                                </spring:bind>
                            </td>
                            <th align="right">
                                <spring:message code="Location.township"/>/<spring:message code="Location.division"/>
                            </th>
                            <td>
                                <spring:bind path="townshipDivision">
                                    <input type="text" id="townshipDivision_${varStatus.index}" value="${status.value}" onkeyup="patientSearch(this.value)"/>
                                </spring:bind>
                            </td>
                            <th align="right">
                                <spring:message code="Location.county"/>/<spring:message code="Location.district"/>
                            </th>
                            <td>
                                <spring:bind path="countyDistrict">
                                    <input type="text" id="countyDistrict_${varStatus.index}" value="${status.value}" onkeyup="patientSearch(this.value)"/>
                                </spring:bind>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Sub-Region<!-- spring:message code="PersonAddress.subregion"/ -->
                            </th>
                            <td>
                                <spring:bind path="subregion">
                                    <input type="text" id="subregion_${varStatus.index}" value="${status.value}" onkeyup="personSearch(this.value)"/>
                                </spring:bind>
                            </td>
                            <th align="right">
                                <spring:message code="Location.region"/>
                            </th>
                            <td>
                                <spring:bind path="region">
                                    <input type="text" id="region_${varStatus.index}" value="${status.value}" onkeyup="personSearch(this.value)"/>
                                </spring:bind>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <spring:message code="PersonAddress.stateProvince"/>
                            </th>
                            <td>
                                <spring:bind path="stateProvince">
                                    <input type="text" id="stateProvince_${varStatus.index}" value="${status.value}" onkeyup="personSearch(this.value)"/>
                                </spring:bind>
                            </td>
                            <th align="right">
                                <spring:message code="PersonAddress.country"/>
                            </th>
                            <td>
                                <spring:bind path="country">
                                    <input type="text" id="country_${varStatus.index}" value="${status.value}" onkeyup="personSearch(this.value)"/>
                                </spring:bind>
                            </td>
                            <th align="right">
                                <spring:message code="PersonAddress.postalCode"/>
                            </th>
                            <td>
                                <spring:bind path="postalCode">
                                    <input type="text" id="postalCode_${varStatus.index}" value="${status.value}" onkeyup="personSearch(this.value)"/>
                                </spring:bind>
                            </td>
                        </tr>
                    </spring:nestedPath>
            </c:forEach>

	</table>
    <br/>
    <table class="box" border="0" cellspacing="2" cellpadding="2">
        <b class="boxHeader"><spring:message code="amrsregistration.edit.address"/></b>
        <c:forEach items="${patient.identifiers}" var="identifier" varStatus="varStatus">
                <spring:nestedPath path="patient.identifiers[${varStatus.index}]">
                    <tr id="identifier${varStatus.index}Data" >
                        <th align="left" valign="top">
                            <spring:message code="general.preferred"/>?
                        </th>
                        <td align="left" valign="top">
                            <spring:bind path="preferred">
                                <input type="checkbox" id="identifier.preferred_${varStatus.index}" value="${status.value}" <c:if test="${status.value == 'true'}">checked</c:if>/>
                            </spring:bind>
                        </td>
                        <td>
                            <spring:bind path="identifier">
                                <input type="text" id="identifier_${varStatus.index}" value="${status.value}" onkeyup="patientSearch(this.value)"/>
                            </spring:bind>
                        </td>
                        <th align="right">
                            <spring:message code="PatientIdentifier.identifierType"/>
                        </th>
                        <td>
                            <spring:bind path="identifierType">
                                <select name="identifierType" id="identifierType_${varStatus.index}">
                                    <openmrs:forEachRecord name="patientIdentifierType">
                                        <option value="${record.patientIdentifierTypeId}" <c:if test="${status.value == record.name}">selected</c:if> >
                                            ${record.name}
                                        </option>
                                    </openmrs:forEachRecord>
                                </select>
                            </spring:bind>
                        </td>
                    </tr>
                </spring:nestedPath>
        </c:forEach>
    </table>
    <br/>
<!--
    TestAttributes:
    <c:if test="${testAttributes != null}">${testAttributes}</c:if>
    <br/>
    TestAttributesString:
    <c:if test="${testAttributesString != null}">${testAttributesString}</c:if>
-->    
    &nbsp;
    <input type="submit" name="_cancel" value="<spring:message code='general.cancel'/>">
    &nbsp; &nbsp;
    <input type="submit" name="_target1" value="<spring:message code='general.back'/>">
    &nbsp; &nbsp;
    <input type="submit" name="_finish" value="<spring:message code='general.submit'/>">
</form>
<br/>
<%@ include file="/WEB-INF/template/footer.jsp"%>