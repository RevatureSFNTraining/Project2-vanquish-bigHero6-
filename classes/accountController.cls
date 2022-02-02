public with sharing class AccountController {
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(String searchKey){
       String searchString = '%' + searchKey + '%';
       return [SELECT Id, Name FROM Account
               WHERE Name LIKE :searchString ];

   }
}
