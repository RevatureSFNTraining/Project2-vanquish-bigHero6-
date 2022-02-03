@isTest
private class TestAccountController{
     	
        // NEGATIVE SINGLE TEST (search string not found)
        // --------------------------------------------------------------------------
        @isTest
	    static void TestAccountController_Negative() {  
        // -------------------------------------------------------------------------    
            
        Account[] a= DataFactory4TestAccountController.createTestAccounts(1);
        
        // ------- ACT: PERFORM TEST -----------------------//
                Test.startTest();
                List<Account> L = AccountController.getAccounts('Nadal');  // from controller looking for Nadal
                Test.stopTest();
        
                // ------- ASSERT: CHECK RESULTS ---------------------//
                // Verify: Empty list
                System.assertEquals(0, L.size());
                
             
        }
    
		// POSITIVE SINGLE TEST
        // --------------------------------------------------------------------------
        @isTest 
        static void TestAccountController_Positive() {
        // --------------------------------------------------------------------------
                   
        Account[] a= DataFactory4TestAccountController.createTestAccounts(1);
        
        // ------- ACT: PERFORM TEST --------------------------//
	        Test.startTest();
	        List<Account> L = AccountController.getAccounts('Test');
	        Test.stopTest();
	
	    // ------- ASSERT: CHECK RESULTS ---------------------//
      
            System.assertEquals('TestAccount0',L[0].Name);
        }

		// NEGATIVE BULKIFIED TEST
        // --------------------------------------------------------------------------
        @isTest 
        static void TestBulkAccountController_Negative() {
	    // --------------------------------------------------------------------------    
           
	        Account[] a= DataFactory4TestAccountController.createTestAccounts(5);
	
	        // ------- ACT: PERFORM TEST --------------------------//        
	        Test.startTest();
	        List<Account> L = AccountController.getAccounts('Nadal');
	        Test.stopTest();
	
	        // ------- ASSERT: CHECK RESULTS ---------------------/	        
	        System.assertEquals(0,L.size());
	        }
	
        // POSITIVE BULKIFIED TEST
        // --------------------------------------------------------------------------       
    	@isTest 
        static void TestBulkAccountController_Positive() {
        // --------------------------------------------------------------------------
        
            Account[] a= DataFactory4TestAccountController.createTestAccounts(5);
        
            // ------- ACT: PERFORM TEST --------------------------//  
            Test.startTest();
            List<Account> L = AccountController.getAccounts('est');
            Test.stopTest();

            // ------- ASSERT: CHECK RESULTS ---------------------//
	        Boolean ok = true;
            for (Integer i=0; i<5; i++){
                ok = ok && (L[i].Name=='TestAccount'+i);
            	if (!ok) break;
            }
	        System.assertEquals(true,ok);
}
}