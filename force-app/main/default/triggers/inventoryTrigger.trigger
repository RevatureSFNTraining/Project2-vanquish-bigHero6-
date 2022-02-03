trigger inventoryTrigger on Inventory__c (after insert, after update) {
	// SOQL query for every inventory    
    Switch on Trigger.OperationType{
        when AFTER_INSERT {
            inventoryTriggerHelper.handleTrigger(Trigger.new);
        }
        when AFTER_UPDATE{
            inventoryTriggerHelper.handleTrigger(Trigger.new);
        }
    }
}