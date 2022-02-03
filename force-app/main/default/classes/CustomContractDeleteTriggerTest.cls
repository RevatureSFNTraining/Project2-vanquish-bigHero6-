// Contracts with status of negotiation = denied are the only ones that can be deleted
// cannot be deleted trigger ContractDeletionTrigger on Contract__c (before insert)

trigger CustomContractDeleteTrigger on Contract__c (before delete) {   
    
   
    Switch on Trigger.OperationType {
        when BEFORE_DELETE {
            
            CustomContractDeleteTriggerHelper.displayAttemptedDeletes(Trigger.oldMap);

        }
        
    
    }
    
}
