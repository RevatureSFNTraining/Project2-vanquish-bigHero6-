// UTILITY CLASS
@isTest
public class DataFactory4TestCustomContractDeletion {
    
    
    // ---- Status_of_Negotiation__c values: 
    // 		Approved, 
    // 		Archived, 
    // 		Denied, 
    // 		Legal Review, 
    // 		Pending, 
    // 		Rejected
  
 
    public static List<Contract__c> createTestContracts(Integer numRecs, String statusVal) {
        
        List<Contract__c> conts = new List<Contract__c>();
        
        for(Integer i=0;i<numRecs;i++) {
            Contract__c a = new Contract__c();
            a.Name='TestContract__c' + i;
            a.Status_of_Negotiation__c=statusVal;
 
            conts.add(a);
        }
        insert conts;
        return conts;
    }
    
    

    
}