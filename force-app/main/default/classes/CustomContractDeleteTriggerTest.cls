@isTest
public class CustomContractDeleteTriggerTest {
    // calls Utility class DataFactory4TestCustomContractDeletion to create records with field values for status
    final static String[] status = new String[] {'Approved', 'Archived', 'Legal Review','Pending', 'Rejected'}; 
     	
        // NEGATIVE SINGLE TEST (Only Approved is tested.)
        // --------------------------------------------------------------------------
        @isTest
	    static void createTestContracts_Negative() {  
        // -------------------------------------------------------------------------    
            
            for (Integer i=0; i<1; i++){
	            
                Contract__c[] c= DataFactory4TestCustomContractDeletion.createTestContracts(1,status[i]);
        
                // ------- ACT: PERFORM TEST -----------------------//
                Test.startTest();
                Database.DeleteResult result = Database.delete(c[0], false);
                Test.stopTest();
        
                // ------- ASSERT: CHECK RESULTS ---------------------//
                // Verify: trigger stopped deletion, error message
                
                System.assert(!result.isSuccess());
                System.assert(result.getErrors().size() > 0);
                System.assert(result.getErrors()[0].getMessage().contains('Contract cannot be deleted'), result.getErrors()[0].getMessage());
            }
        }
    
		// POSITIVE SINGLE TEST
        // --------------------------------------------------------------------------
        @isTest 
        static void TestDeleteContract_Positive() {
        // --------------------------------------------------------------------------
                   
            Contract__c[] c= DataFactory4TestCustomContractDeletion.createTestContracts(1,'Denied');
        
            // ------- ACT: PERFORM TEST --------------------------//
	        Test.startTest();
	        Database.DeleteResult result = Database.delete( c[0], false);
	        Test.stopTest();
	
	        // ------- ASSERT: CHECK RESULTS ---------------------//
            // Verify that the deletion was successful
            System.assert(result.isSuccess());
        }

		// NEGATIVE BULKIFIED TEST
        // --------------------------------------------------------------------------
        @isTest 
        static void TestDeleteBulkContracts_Negative() {
	    // --------------------------------------------------------------------------    
           
	        Contract__c[] c = DataFactory4TestCustomContractDeletion.createTestContracts(5,'Archived');
	
	        // ------- ACT: PERFORM TEST --------------------------//        
	        Test.startTest();
	        Database.DeleteResult[] results = Database.delete(c, false);
	        Test.stopTest();
	
	        // ------- ASSERT: CHECK RESULTS ---------------------//
	        // Verify: trigger stopped deletion, error message
	       
	        for(Database.DeleteResult dr : results) {
	            System.assert(!dr.isSuccess());
	            System.assert(dr.getErrors().size() > 0);
	            System.assert(dr.getErrors()[0].getMessage().contains('Contract cannot be deleted'), dr.getErrors()[0].getMessage());
	        }
	    }
	
        // POSITIVE BULKIFIED TEST
        // --------------------------------------------------------------------------       
    	@isTest 
        static void TestDeleteBulkContracts_Deletable() {
        // --------------------------------------------------------------------------
        
            Contract__c[] c= DataFactory4TestCustomContractDeletion.createTestContracts(5, 'Denied');
        
            // ------- ACT: PERFORM TEST --------------------------//  
            Test.startTest();
            Database.DeleteResult[] results = Database.delete(c, false);
            Test.stopTest();

            // ------- ASSERT: CHECK RESULTS ---------------------//
	        for(Database.DeleteResult dr : results) {
                System.assert(dr.isSuccess());
        }
    }

}
