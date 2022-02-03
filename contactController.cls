public with sharing class contactController {
    
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(String searchKey){
      String searchString='%' + searchKey + '%';
       return [SELECT Id, LastName, Phone, Email FROM Contact
               WHERE LastName LIKE :searchString];
   }
}
