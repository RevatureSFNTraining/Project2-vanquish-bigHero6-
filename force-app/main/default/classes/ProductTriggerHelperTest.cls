/**
 * Tests of the ProductTriggerHelper class.
 * @author Alonso del Arte
 */
@isTest
public class ProductTriggerHelperTest {
    
    /**
     * Test to make sure bad check digits for ISBN are rejected. For example, the
     * correct ISBN-13 for <i>Java in a Nutshell</i> is 978-1-49203-725-5, so 
     * 978-1-49203-725-6 should be rejected.
     */
     
     
    @isTest
    public static void testEnsureBadCheckDigitIsRejected() {
        Product2 book = new Product2(name = 'Java in a Nutshell', 
                                     author__c = 'David Flannagan and Ben Evans', 
                                     genre__c = 'Other', ISBN__c = 9781492037256L, 
                                     year__c = Date.today());
        Database.SaveResult result = Database.insert(book, false);
        System.assert(!result.isSuccess());
    }
    
    /**
     * Test to make sure a valid ISBN with the correct check digit is accepted. 
     * For example, the correct ISBN-13 for <i>Java in a Nutshell</i> is 
     * 978-1-49203-725-5.
     */
     
    @isTest
    public static void testEnsureCheckDigitChecksOut() {
        Product2 book = new Product2(name = 'Java in a Nutshell', 
                                     author__c = 'David Flannagan and Ben Evans', 
                                     genre__c = 'Other', ISBN__c = 9781492037255L, 
                                     year__c = Date.today());
        Database.SaveResult result = Database.insert(book, false);
        System.assert(result.isSuccess());
    }
    
    // TODO: Replace this test with a test that is correct and necessary.
    //       I have not seen this test fail, so I know it's either incorrect
    //  
    //     or unnecessary.
    @isTest
    public static void testCleanUpOrphanedReviews() {
        long isbn = 9785550321772379L;
        Product2 book = new Product2(name = 'Hemlock', 
                                     author__c = 'Bernardo Gerhardt', 
                                     genre__c = 'Other', ISBN__c = isbn, 
                                     year__c = Date.today());
        insert book;
        String reviewText = 'This book needs to be pulled for a rewrite.';
        Review__c review = new Review__c(book__c = book.Id, 
                                         content__c = reviewText);
        insert review;
        delete book;
        List<Review__c> reviews = [SELECT Id, Name, Content__c 
                                   FROM Review__c 
                                   WHERE Book__r.ISBN__c = :isbn];
        System.assertEquals(0, reviews.size());
    }

}