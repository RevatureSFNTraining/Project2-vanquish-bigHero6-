@isTest(seeAllData = true)
public class ReviewTrigger_Test {
    
    // Create test records for Contact and Review objects.
    public static void setup() {
        
        // Create common test contacts
        List<Contact> testContacts = new List<Contact>();
        for(Integer i=0; i<5; i++) {
            testContacts.add(new Contact(FirstName = 'TestContact', LastName = '' + i));
        }
        insert testContacts;
        
        // Create common test reviews
        List<Review__c> testReviews = new List<Review__c>();
        for(Integer i=0; i<5; i++) {
            testReviews.add(new Review__c(Name = 'TestReview ' + i, Reviewer__c = testContacts[0].Id));
        }
        insert testReviews;        
    }
    
    // Tests if deleting and undeleting Reviews will update field Reviewer__c to ANONYMOUS REVIEWER  
    @isTest
    public static void undeleteReviews() {
        
        setup();
        
        List<Review__c> testReviewsDelete = [SELECT Id FROM Review__c WHERE Name LIKE 'TestReview%'];
        
        delete testReviewsDelete;
        undelete testReviewsDelete;
        
        List<Review__c> testReviewsAfterUndelete = [SELECT Id, Reviewer__c FROM Review__c WHERE Name LIKE 'TestReview%'];
        System.debug(testReviewsAfterUndelete);
        
    }

}