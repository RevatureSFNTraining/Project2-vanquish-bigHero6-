trigger shipmentTrigger on Shipment__c (before insert, before update) {
    //Shipment__c.Store__c, the destination is required
    //Shipment__c.Quantity__c, the amount of books being shipped is required
	switch on Trigger.operationType{
        when BEFORE_INSERT {
            shipmentTriggerHelper.calculateShipping(Trigger.new);
        }
        when BEFORE_UPDATE {
            shipmentTriggerHelper.calculateShipping(Trigger.new);            
        }
	}
}