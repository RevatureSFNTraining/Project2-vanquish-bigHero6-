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
    /*
    public class SearchWrapper{
        @AuraEnabled
        public String type;

        @AuraEnabled
        public SObject ObjectName;
    }

    @AuraEnabled
    public static List<List<SearchWrapper>> searchByName(String searchText) {
        System.debug('The value of searchText is: '+ searchText);
        List<List<SearchWrapper>> responseList = new List<List<SearchWrapper>>();
        
        List<List<SObject>> results = [FIND :searchText IN NAME FIELDS  RETURNING Account(Id, Name, Description), 
            Product2(Id, Name, Author__c, Genre__c, Year__c, ISBN__c, Description) ];

        for (List<SObject> sobjs1 : results) {

        }

    //The following code will look for matches in the OCS_Investigation__c object for the search argument entered.     
    List<List<SObject>> results1 = [FIND :searchText IN NAME FIELDS  RETURNING Account(Id, Name, Description), 
    Product2(Id, Name, Author__c, Genre__c, Year__c, ISBN__c, Description) ];
    for (List<SObject> sobjs1 : results1) {
      for (SObject sobj1 : sobjs1) {
        ResposeWrapper rw=new ResposeWrapper();
        rw.Id=sobj1.Id;
        rw.ObjectName = ''+sobj1.getSObjectType();
         rw.fieldMap =new List<FieldClass>();
         Map<String,Object> fieldMap = sobj1.getPopulatedFieldsAsMap();
          for(String key : fieldMap.keySet()){
              FieldClass fc = new FieldClass(key,STring.valueOf(fieldMap.get(key)));
               rw.fieldMap.add(fc);

          }
        responseList.add(rw);
      }
    }
        return responseList;
  }
  */
    
    public class ResposeWrapper{
        @AuraEnabled
        public String Id;

        @AuraEnabled
        public String ObjectName;

        @AuraEnabled
        public List<FieldClass> fieldMap; 

    }

    public class FieldClass{
        @AuraEnabled
        public String fieldName;
        @AuraEnabled
        public String fieldValue;

        public FieldClass(String fieldName, STring fieldValue){
            this.fieldName = fieldName;
            this.fieldValue= fieldValue;

        }

    }

    @AuraEnabled
    public static List<ResposeWrapper> searchForString(String searchText) {
        System.debug('The value of searchText is: '+ searchText);
    List<ResposeWrapper> responseList = new List<ResposeWrapper>();                 //This code creates the wrapper for the found records. 

    //The following code will look for matches in the OCS_Investigation__c object for the search argument entered.     
    List<List<SObject>> results1 = [FIND :searchText IN NAME FIELDS  RETURNING Account(Id, Name, Description), 
    Product2(Id, Name, Author__c, Genre__c, Year__c, ISBN__c, Description) ];
    for (List<SObject> sobjs1 : results1) {
      for (SObject sobj1 : sobjs1) {
        ResposeWrapper rw=new ResposeWrapper();
        rw.Id=sobj1.Id;
        rw.ObjectName = ''+sobj1.getSObjectType();
         rw.fieldMap =new List<FieldClass>();
         Map<String,Object> fieldMap = sobj1.getPopulatedFieldsAsMap();
          for(String key : fieldMap.keySet()){
              FieldClass fc = new FieldClass(key,STring.valueOf(fieldMap.get(key)));
               rw.fieldMap.add(fc);

          }
        responseList.add(rw);
      }
    }
        return responseList;
  }
}