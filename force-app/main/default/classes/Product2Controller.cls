/**
 * Controller to use <code>Product2</code> in Aura components.
 * @author Sergio Santillana
 * @author Alonso del Arte (but only temporarily for rewind)
 */
global without sharing class Product2Controller {

    public Product2Controller() {
        // TODO: Determine if this constructor is needed
    }

    @AuraEnabled(cacheable=true)
    global static Product2 getBookById(String bookId){
        Product2 book = [ SELECT Id, Name, Author__c, Genre__c, Year__c, ISBN__c, Description, DisplayUrl,
        (SELECT UnitPrice FROM PricebookEntries)
        FROM Product2 WHERE Id = :bookId LIMIT 1 ];
        return null;// book;
    }

    @AuraEnabled(cacheable=true)
    global static List<Product2> getBooksByAuthor(String authorName){
        List<Product2> books = [ SELECT Id, Name, Author__c, Genre__c, Year__c, ISBN__c, Description, DisplayUrl, 
        (SELECT UnitPrice FROM PricebookEntries)
        FROM Product2 WHERE Author__c = :authorName ];

        return null;// books;
    }

    @AuraEnabled(cacheable=true)
    global static Account getBookAuthor(String authorName){
        Account author = [ SELECT Id, Description FROM Account WHERE Name = :authorName LIMIT 1 ];
        return null;// author;
    }

}
