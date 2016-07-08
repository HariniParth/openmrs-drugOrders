<%
    ui.decorateWith("appui", "standardEmrPage");
    ui.includeCss("drugorders", "drugorders.css")
    ui.includeJavascript("drugorders", "drugorders.js")
    def isAllergic = false;
%>
        
<script type="text/javascript">
    var breadcrumbs = [
        { icon: "icon-home", link: '/' + OPENMRS_CONTEXT_PATH + '/index.htm' },
        { label: "${ ui.format(patient.familyName) }, ${ ui.format(patient.givenName) }" , link: '${ui.pageLink("coreapps", "clinicianfacing/patient", [patientId: patient.id])}'},
        { label: "${ ui.message("drugorders.drugorders") }" }
    ];
     
    var patient = { id: ${ patient.id } };

</script>
 

<div class="info-body">
    Drug Allergies:
    <% if (allergies.allergyStatus != "See list") { %>
        ${ ui.message(allergies.allergyStatus) }
    <% } else { %>
        <% allergies.each { allergy -> %>
            ${ allergy.allergen }
        <% } %>
    <% } %>
    


    <div id="individualOrderBody">
        <span id="individualOrderBody"></span>
        <div id="individualOrderWindow">
            <div>
                <h3>${ ui.message("ACTIVE INDIVIDUAL DRUG ORDERS") }
                    <input id="addSingleOrder" type="button" value="ADD" onclick="showIndividualDrugOrderWindow()"/>
                </h3>
            </div>

            ${ ui.includeFragment("drugorders", "drugOrderSingle") }
        </div>

        <div id="addSingleOrderWindow">
            ${ ui.includeFragment("drugorders", "addDrugOrderSingle") }
        </div>
        
        <div id="addSingleOrderDetailsWindow">
            <% if(drugname != "") { %>
                <% allergies.each { allergy -> %>
                    <% if(drugname == "${allergy.allergen}") { %>
                        <% isAllergic = true; %>
                    <% } %>
                <% } %>
                <% if(isAllergic && allergicOrderReason == "") { %>
                    ${ ui.includeFragment("drugorders", "allergicDrugOrderReasons") }
                    
                    <% if(allergicOrderReason != "") { %>
                        ${ ui.includeFragment("drugorders", "addDrugOrderSingleDetails") }
                    <% } %>
            
                <% } else { %>
                    ${ ui.includeFragment("drugorders", "addDrugOrderSingleDetails") }
                <% } %>
            <% } %>

        </div>
        
    </div>
    
    <div class="col-lg-12"></div>
    
    <div id="currentDrugOrdersWindow">
        <% existingDrugOrders.each { existingDrugOrder -> %>
        <a href="#" id="existingDrugOrdersID" onclick="showDrugOrderViewWindow('${ existingDrugOrder.orderId }','${ existingDrugOrder.patientid }','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ existingDrugOrder.startdate }','${ existingDrugOrder.drugname }','${ existingDrugOrder.patientinstructions }','${ existingDrugOrder.pharmacistinstructions }')">
                ${ existingDrugOrder.drugname } ${ existingDrugOrder.startdate } 
            </a>    
            <input id="editOrder" type="submit" value="Edit" onclick="editIndividualDrugOrderWindow('${ existingDrugOrder.orderId }')"/>
            <input id="deleteOrder" type="submit" value="Discontinue" onclick="showDiscontinueIndividualDrugOrderWindow('${ existingDrugOrder.orderId }')"/>
            <br/><br/>
        <% } %>
    </div>
    
    <div id="drugOrderView">
        ${ ui.includeFragment("drugorders", "viewDrugOrderSingle") }
    </div>
    
    <div id="discontinueOrderWindow">
        ${ ui.includeFragment("drugorders", "discontinueDrugOrder") }
    </div>
        
</div>

