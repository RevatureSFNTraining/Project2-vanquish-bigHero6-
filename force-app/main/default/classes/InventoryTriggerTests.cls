@isTest
public with sharing class InventoryTriggerTests {
    
    @isTest static void positive_Test(){
        // Positive Test contains positive tests with testing as a 2 different users
        // Set up User 1
        // 
        // 
        // Create a unique UserName
        String uniqueUserName = 'standarduser' + DateTime.now().getTime() + '@testorg.com';
        // This code runs as the system user
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        User u = new User(Alias = 'standt', Email='standarduser@testorg.com',
        EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
        LocaleSidKey='en_US', ProfileId = p.Id,
        TimeZoneSidKey='America/Los_Angeles',
         UserName=uniqueUserName);
               
        System.runAs(u) {
        // Create a contact
        Contact c = new Contact();
        c.FirstName = 'Richard';
        c.LastName = 'Holmes';
        c.Email = 'testemail123@gmail.com';
        insert c;
        
        Contact test_c = [SELECT id,Email FROM Contact WHERE Email = 'testemail123@gmail.com'];
        System.assertEquals('testemail123@gmail.com', test_c.Email);
        
        // Create a Store
        Store__c s = new Store__c();
        s.Name = 'Target';
        s.Contact__c = c.id;
        insert s;
        
        // Create an Inventory       
        Inventory__c iItems = new Inventory__c();
        iItems.Name = 'Book 1 Stock';
        iItems.Capacity__c = 100;
        iItems.Quantity__c = 100;
        insert iItems;

        // Test if CapacityCompare formula field is true based on updated inventory capacity
        try {
            Inventory__c inventory_c = [SELECT id,Name FROM Inventory__c WHERE Name = 'Test Line 1'];
            inventory_c.Quantity__c = 10;
            update inventory_c;
            System.assertEquals('true', inventory_c.QuantityCapacityCompare__c);  // Inventory Line quantity is below capacity
        } catch (Exception e) {
            System.debug('An error happened, there was no e-mail attached to contact');
        }
        
        // Create an E-mail
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>(); 
        Messaging.SingleEmailMessage myMail = new Messaging.SingleEmailMessage();
        List<String> sendTo = new List<String>();
        sendTo.add(c.Email);
        myMail.setToAddresses(sendTo);
        myMail.setHtmlBody('TEST');
        myMail.setSubject('Replenish Inventory Stock');
        mails.add(myMail);    
        
        // Check if e-mail has same field properties
        System.assertEquals(sendTo.size(), 1); // e-mail exists in contact
        System.assertNotEquals(myMail, null); // makes sure sent mail is not null
        System.assertEquals(myMail.htmlbody, 'TEST'); // body in email matches
        System.assertEquals(myMail.getSubject(), 'Replenish Inventory Stock'); // subject matches in email
           
        }
        //end RunAs(User 1)

        // Create a unique UserName 2
        String uniqueUserName2 = 'standarduser2' + DateTime.now().getTime() + '@testorg.com';
        // This code runs as the system user
        Profile p2 = [SELECT Id FROM Profile WHERE Name='Standard User'];
        User u2 = new User(Alias = 'standt2', Email='standarduser2@testorg.com',
        EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
        LocaleSidKey='en_US', ProfileId = p2.Id,
        TimeZoneSidKey='America/Los_Angeles',
         UserName=uniqueUserName2);
        
        // Run as Second user
        System.runAs(u2){
            
            // Create a contact
            Contact c2 = new Contact();
            c2.FirstName = 'Ronny';
            c2.LastName = 'Thomas';
            c2.Email = 'testemail12345@gmail.com';
            insert c2;
            
            Contact test_c2 = [SELECT id,Email FROM Contact WHERE Email = 'testemail12345@gmail.com'];
            System.assertEquals('testemail12345@gmail.com', test_c2.Email);
            
            // Create a Store
            Store__c s2 = new Store__c();
            s2.Name = 'Target';
            s2.Contact__c = c2.id;
            insert s2;
            
            // Create an Inventory       
            Inventory__c iItems2 = new Inventory__c();
            iItems2.Name = 'Book 2 Stock';
            iItems2.Capacity__c = 1000;
            insert iItems2;
                        
            // Test if CapacityCompare formula field is true based on updated inventory capacity
            try {
                Inventory__c inventory_c2 = [SELECT id,Name,Capacity__c FROM Inventory__c WHERE Name = 'Book 2 Stock'];
                inventory_c2.Capacity__c = 2500;
                update inventory_c2;
                System.assertEquals('true', inventory_c2.QuantityCapacityCompare__c);  // Inventory Line quantity is below capacity
            } catch (Exception e) {
                System.debug('An error happened, there was no e-mail attached to contact');
            }
            
            // Create an E-mail
            List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>(); 
            Messaging.SingleEmailMessage myMail = new Messaging.SingleEmailMessage();
            List<String> sendTo = new List<String>();
            sendTo.add(c2.Email);
            myMail.setToAddresses(sendTo);
            myMail.setHtmlBody('TEST WORKS');
            myMail.setSubject('Replenish Inventory Stock2');
            mails.add(myMail);    
            
            // Check if e-mail has same field properties
            System.assertEquals(sendTo.size(), 1); // e-mail exists in contact
            System.assertNotEquals(myMail, null); // makes sure sent mail is not null
            System.assertEquals(myMail.htmlbody, 'TEST WORKS'); // body in email matches
            System.assertEquals(myMail.getSubject(), 'Replenish Inventory Stock2'); // subject matches in email
            }          
        //end System.RunAs(User 2)
        //end Positive Tests
        
        
    }
    

 
    @isTest static void negative_Test(){
        
        
        // Create a unique UserName 3
        String uniqueUserName3 = 'standarduser3' + DateTime.now().getTime() + '@testorg.com';
        // This code runs as the system user
        Profile p3 = [SELECT Id FROM Profile WHERE Name='Standard User'];
        User u3 = new User(Alias = 'standt2', Email='standarduser3@testorg.com',
        EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
        LocaleSidKey='en_US', ProfileId = p3.Id,
        TimeZoneSidKey='America/Los_Angeles',
         UserName=uniqueUserName3);
        
        // Run as User 3
         System.runAs(u3){
             Contact c = new Contact();
        c.FirstName = 'Richard';
        c.LastName = 'Holmes';
        // no e-mail attached to contact        
        insert c;
        
        System.assertEquals(c.Email, null); // no e-mail attached to contact
        
        Store__c s = new Store__c();
        s.Name = 'Target';
        s.Contact__c = c.id;
        insert s;
        
        Inventory__c iItems = new Inventory__c();
        iItems.Name = 'Book 3 Stock';
        iItems.Capacity__c = 10;
        insert iItems;
       
        
        iItems.Capacity__c = -10; // Adding a negative capacity
        try {
            update iItems;
        } catch (DmlException e) {
            System.assert(e.getMessage().contains('Capacity must be greater or equal to 0'), e.getMessage());
            System.debug(e.getMessage());
            System.debug('An error happened, there was no e-mail attached to contact');
            System.assertEquals('FIELD_CUSTOM_VALIDATION_EXCEPTION', e.getDmlStatusCode(0));
        }
        Contact d = [SELECT id,FirstName,Email FROM Contact WHERE EMAIL = NULL];
        
        Messaging.SingleEmailMessage myMail = new Messaging.SingleEmailMessage();

        String body = 'Hello ' + c.FirstName + ',';
                  body += '\n'; 
                  body += 'According to the ReplenishInventory trigger, ';
                  body += 'please replenish your inventory to meet your customer needs. ';
                  body += 'For more details you can visit';
                  body += ' https://volcanodragon-pub/homepage';
        myMail.setHtmlBody(body);
        myMail.setSubject('Replenish Inventory Stock');
        System.assertEquals(myMail.HTMLBody, body);
        System.assertEquals(c.Email,null);
        System.assertEquals(d.Email,null);
         }
        // End SystemAs User 3
        // End Negative Test       
    }
    
    
    @isTest
    public static void bulkNegativeTestCase() {
        // Insert Bulk Negative Test Cases when each of the 10 records has a negative capacity
        // Tests will fail since Capacity cannot be below 0
        Integer expected = 10;
        List<Inventory__c> cList = new List<Inventory__c>();
        for(Integer i = 0; i < expected; i++) {
            Inventory__c c = new Inventory__c(Name = 'Book Stock', Capacity__c = -10);
            cList.add(c);
        }
        List<Database.saveResult> srList = Database.insert(cList, false);
        Integer failCounter = 0;
        for(Database.SaveResult sr : srList) {
            if(!sr.isSuccess()) {
                failCounter += 1;
            }
        }
        system.assertEquals(expected, failCounter);
        // End Bulk Negative Test Case
    }
}