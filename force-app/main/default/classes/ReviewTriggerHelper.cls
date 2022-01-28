public class ReviewTriggerHelper {
    
    public static void afterUndeleteTriggerMethod(List<Review__c> reviews) {
        List<Review__c> anonymousReviews = [SELECT Id FROM Review__c WHERE Id IN :reviews];
        List<Contact> anonymousContacts = new List<Contact>([SELECT Id FROM Contact WHERE Name = 'ANONYMOUS REVIEWER' LIMIT 1]);
        
        for(Review__c review : anonymousReviews) {
            review.Reviewer__c = anonymousContacts[0].Id;
        }
        
        update anonymousReviews;

    }

}