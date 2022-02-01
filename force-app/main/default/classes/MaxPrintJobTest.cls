@isTest
public class MaxPrintJobTest {
    @TestSetup
    static void MakeTestData(){
        
    }
    
    //testing a negative case
    @isTest
    public static void negativeTestCase(){
        Printing_Press__c ppp = new Printing_Press__c(name='Volcano Publishing');
        Print_Job__c p = new Print_Job__c(Name = 'Halo', Printing_Press__c = ppp.Id, Quantity__c = 250);
        Database.saveResult sr = Database.insert(p, false);
        Database.saveResult sr2 = Database.update(p, false);
        //List<Print_Job__c> printList = [SELECT id FROM Print_Job__c];
        
        system.assert(!sr.isSuccess());
    }
    
    //testing a positive case
    @isTest
    public static void positiveTestCase(){
        Printing_Press__c ppp = new Printing_Press__c(name='Volcano Publishing');
        Print_Job__c p = new Print_Job__c(Name = 'Halo', Printing_Press__c = ppp.Id, Quantity__c = 320);
        Database.saveResult sr = Database.insert(p, false);
        Database.saveResult sr2 = Database.update(p, false);
        //List<Print_Job__c> printList = [SELECT id FROM Print_Job__c];
        
        system.assert(!sr.isSuccess());
    }
    
    //testing bulk negative cases
    @isTest 
    public static void bulkNegativeTestCase(){
        Integer expected = 10;
        Printing_Press__c ppp = new Printing_Press__c(name='Volcano Publishing');
        List<Print_Job__c> printList = new List<Print_Job__c>();
        for(Integer i = 0; i < expected; i++){
        	Print_Job__c p = new Print_Job__c(Name = 'Halo', Printing_Press__c = ppp.Id, Quantity__c = 250);
            printList.add(p);
        }
        
        List<Database.saveResult> srList = Database.insert(printList, false);
        Integer failCounter = 0;
        for(Database.SaveResult sr : srList){
            if(!sr.isSuccess()){
                failCounter += 1;
            }
        }
        system.assertEquals(expected, failCounter);
    }
    
    //Restricted User test
    @isTest
    public static void testRunAs(){
        // Setup test data
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
           // The following code runs as user 'u'
           System.debug('Current User: ' + UserInfo.getUserName());
           System.debug('Current Profile: ' + UserInfo.getProfileId());
          }
    }

}