public with sharing class ContactController {
    
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(String searchKey){
      String searchString='%' + searchKey + '%';
       return [SELECT Id, FirstName, LastName, Phone, Email FROM Contact
               WHERE LastName LIKE :searchString];
   }
}