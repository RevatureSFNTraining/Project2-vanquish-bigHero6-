// NOT USED
public with sharing class ProductController {
    // String likeString;  DO THIS LAter
    @AuraEnabled(cacheable=true)
    public static List<Product2> getProducts(String searchKey){
      String searchString = '%' + searchKey + '%';
      return [SELECT Id, Name FROM Product2
               WHERE Name LIKE :searchString];

   }
}

