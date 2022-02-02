global without sharing class AuthorController {
    public AuthorController() {

    }

    @AuraEnabled(cacheable=true)
    global static Account getAuthorById(String authorId){
        Account author = [ SELECT Id, Name, Description, Picture_URL__c FROM Account WHERE Id = :authorId LIMIT 1 ];
        return author; 
    }
}