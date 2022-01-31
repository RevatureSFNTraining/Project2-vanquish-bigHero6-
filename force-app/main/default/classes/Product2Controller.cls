global without sharing class Product2Controller {
    public Product2Controller() {

    }

    @AuraEnabled(cacheable=true)
    global static Product2 getBookById(String bookId){
        Product2 book = [ SELECT Id, Name, Author__c, Genre__c, Year__c, ISBN__c, Description, 
        (SELECT UnitPrice FROM PricebookEntries)
        FROM Product2 WHERE Id = :bookId LIMIT 1 ];
        return book;
    }

    @AuraEnabled(cacheable=true)
    global static List<Product2> getBooksByAuthor(String authorName){
        List<Product2> books = [ SELECT Id, Name, Author__c, Genre__c, Year__c, ISBN__c, Description, 
        (SELECT UnitPrice FROM PricebookEntries)
        FROM Product2 WHERE Author__c = :authorName ];

        return books;
    }

    @AuraEnabled(cacheable=true)
    global static Account getBookAuthor(String authorName){
        Account author = [ SELECT Id, Description FROM Account WHERE Name = :authorName LIMIT 1 ];
        return author;
    }
}
