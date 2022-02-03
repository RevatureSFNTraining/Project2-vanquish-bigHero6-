@isTest
private class TestContactController{
     	
        // NEGATIVE SINGLE TEST (search string not found)
        // --------------------------------------------------------------------------
        @isTest
	    static void TestContactController_Negative() {  
        // -------------------------------------------------------------------------    
            
        Contact[] c= DataFactory4TestContactController.createTestContacts(1);
        
        // ------- ACT: PERFORM TEST -----------------------//
                Test.startTest();
                List<Contact> L = ContactController.getContacts('Nadal');  // from controller looking for 
                Test.stopTest();
        
                // ------- ASSERT: CHECK RESULTS ---------------------//
                // Verify: Empty list
                System.assertEquals(0, L.size());      
        }
    
	// POSITIVE SINGLE TEST
        // --------------------------------------------------------------------------
        @isTest 
        static void TestContactController_Positive() {
        // --------------------------------------------------------------------------
                   
       Contact[] c= DataFactory4TestContactController.createTestContacts(1);
        
        // ------- ACT: PERFORM TEST --------------------------//
	        Test.startTest();
	        List<Contact> L = ContactController.getContacts('TestContact');
	        Test.stopTest();
	
	    // ------- ASSERT: CHECK RESULTS ---------------------//
      
            System.assertEquals('TestContact0',L.get(0).LastName);
        }

	// NEGATIVE BULKIFIED TEST
        // --------------------------------------------------------------------------
        @isTest 
        static void TestBulkContractController_Negative() {
	    // --------------------------------------------------------------------------    
           
	        Contact[] c= DataFactory4TestContactController.createTestContacts(5);
	
	        // ------- ACT: PERFORM TEST --------------------------//        
	        Test.startTest();
	        List<Contact> L = ContactController.getContacts('Nadal');
	        Test.stopTest();
	
	        // ------- ASSERT: CHECK RESULTS ---------------------/	        
	        System.assertEquals(0,L.size());
	        }
/*	
        // POSITIVE BULKIFIED TEST
        // --------------------------------------------------------------------------       
    	@isTest 
        static void TestBulkContactController_Positive() {
        // --------------------------------------------------------------------------
        
            Contact[] c= DataFactory4TestContactController.createTestContacts(5);
        
            // ------- ACT: PERFORM TEST --------------------------//  
            Test.startTest();
            List<Contact> L = ContactController.getContacts('TestContact');
            Test.stopTest();

            // ------- ASSERT: CHECK RESULTS ---------------------//
	        Boolean ok = true;
            for (Integer i=0; i<5; i++){
                ok = ok && (L[i].LastName=='TestContact'+i);
            	if (!ok) break;
            }
	        System.assert(ok);
}
*/
}