global without sharing class SearchResultsController {
    public SearchResultsController() {

    }

    @AuraEnabled(cacheable=true)
    global static List<List<SObject>> getSearchResults(String searchCriteria){
        List<List<SObject>> searchList = [FIND :searchCriteria IN NAME FIELDS 
                                      RETURNING Account(Id, Name, Description), 
                                      Product2(Id, Name, Author__c, Genre__c, Year__c, ISBN__c, Description)];
        return searchList;
    }
}
