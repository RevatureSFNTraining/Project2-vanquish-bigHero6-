public with sharing class bookCardCarouselController {
    public bookCardCarouselController() {

    }
    @AuraEnabled
    public static List<Product2> getBookCards() {
        List<Product2> books = [SELECT Id, Product2.Name, Product2.Author__c, Product2.Genre__c, Product2.ISBN__c
                                FROM Product2
                                LIMIT 5];
        return books;
    }
}
