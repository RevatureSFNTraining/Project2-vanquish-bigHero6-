public class CustomContractDeleteTriggerHelper { 
    
    public static void displayAttemptedDeletes(Map<Id, Contract__c> oldMap){
 
        for (Id key: oldMap.keySet()) {
			Contract__c c = oldMap.get(key);
           
            //System.debug('Contract '+ oldMap.get(key).Name + 'ID' + key);
            if (c.Status_of_Negotiation__c!='Denied'){
           
        		c.addError('Contract cannot be deleted');
    		}
           
        }
       
    }

}