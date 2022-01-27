trigger ReplenishInventory on Inventory__c (after insert, after update) {
	// SOQL query for every inventory    
    Switch on Trigger.OperationType{
        when AFTER_INSERT {
            ReplenishInventoryTriggerHelper.handleTrigger(Trigger.new);
        }
        when AFTER_UPDATE{
            ReplenishInventoryTriggerHelper.handleTrigger(Trigger.new);
        }
    }
}