@isTest
public class shipmentTriggerTest {
@testSetup
public static void createStoreAndPress() {

}

@isTest 
public static void calculateShippingWhenInsertAndPressIsSet() {
    Test.startTest();
    //48.46804666769003 mi between 10.00 and 10.50
    Store__c s = new Store__c(Name = 'test store', Location__Latitude__s = 10.00, Location__Longitude__s = 10.00) ;
    Printing_Press__c pp = new Printing_Press__c(Name='test press', Location__Latitude__s = 10.50, Location__Longitude__s = 10.50);
    insert s;
    insert pp;
    Shipment__c sh = new Shipment__c(Name='test shipment', Quantity__c=1, 
        Store__c = [SELECT Id FROM Store__c WHERE Name = 'test store' LIMIT 1].Id, 
        Printing_Press__c = [SELECT Id FROM Printing_Press__c WHERE Name = 'test press' LIMIT 1].Id);
    insert sh;
    sh = [SELECT Id, Shipping_Cost__c FROM Shipment__c WHERE Name = 'test shipment' LIMIT 1];
    Decimal estimated_cost = 48.46804666769003*2.34 + 10;
    Decimal actual_cost = sh.Shipping_Cost__c;
    System.assert(estimated_cost == actual_cost);
    Test.stopTest();

}

@isTest
public static void addPressAndCalculate() {
    Test.startTest();
    //48.46804666769003 mi between 10.00 and 10.50
    Store__c s = new Store__c(Name = 'test store', Location__Latitude__s = 10.00, Location__Longitude__s = 10.00) ;
    Printing_Press__c pp = new Printing_Press__c(Name='test press', Location__Latitude__s = 10.50, Location__Longitude__s = 10.50);
    insert s;
    insert pp;
    Shipment__c sh = new Shipment__c(Name='test shipment', Quantity__c=1, 
        Store__c = [SELECT Id FROM Store__c WHERE Name = 'test store' LIMIT 1].Id 
        //Printing_Press__c = [SELECT Id FROM Printing_Press__c WHERE Name = 'test press' LIMIT 1].Id);
    );
    insert sh;
    sh = [SELECT Id, Shipping_Cost__c FROM Shipment__c WHERE Name = 'test shipment' LIMIT 1];
    Decimal estimated_cost = 48.46804666769003*2.34 + 10;
    Decimal actual_cost = sh.Shipping_Cost__c;
    System.assert(estimated_cost == actual_cost);
    Test.stopTest();


}

@isTest
public static void addPressFindClosestAndCalculate() {
    Test.startTest();
    //48.46804666769003 mi between 10.00 and 10.50 according to Location.getDistance(loc1,loc2,'mi')
    Store__c s = new Store__c(Name = 'test store', Location__Latitude__s = 10.00, Location__Longitude__s = 10.00) ;
    Printing_Press__c pp = new Printing_Press__c(Name='test press', Location__Latitude__s = 10.50, Location__Longitude__s = 10.50);
    Printing_Press__c zz = new Printing_Press__c(Name='test press', Location__Latitude__s = 11.00, Location__Longitude__s = 11.00);
    insert s;
    insert pp;
    Shipment__c sh = new Shipment__c(Name='test shipment', Quantity__c=1, 
        Store__c = [SELECT Id FROM Store__c WHERE Name = 'test store' LIMIT 1].Id 
        //Printing_Press__c = [SELECT Id FROM Printing_Press__c WHERE Name = 'test press' LIMIT 1].Id);
    );
    insert sh;
    sh = [SELECT Id, Shipping_Cost__c FROM Shipment__c WHERE Name = 'test shipment' LIMIT 1];
    Decimal estimated_cost = 48.46804666769003*2.34 + 10;
    Decimal actual_cost = sh.Shipping_Cost__c;
    System.assert(estimated_cost == actual_cost);
    Test.stopTest();


}

@isTest
public static void addAThousandOrders() {
    Test.startTest();
    //48.46804666769003 mi between 10.00 and 10.50 according to Location.getDistance(loc1,loc2,'mi')
    Store__c s = new Store__c(Name = 'test store', Location__Latitude__s = 10.00, Location__Longitude__s = 10.00) ;
    Printing_Press__c pp = new Printing_Press__c(Name='test press', Location__Latitude__s = 10.50, Location__Longitude__s = 10.50);
    Printing_Press__c zz = new Printing_Press__c(Name='test press', Location__Latitude__s = 11.00, Location__Longitude__s = 11.00);
    insert s;
    insert pp;
    List<Shipment__c> shs = new List<Shipment__c>();
    s = [SELECT Id FROM Store__c WHERE Name = 'test store' LIMIT 1];
    for(Integer i = 0; i<1000; i++) {
        Shipment__c sh = new Shipment__c(Name='test shipment ' + i, Quantity__c=i, 
            Store__c = s.Id        
            //Printing_Press__c = [SELECT Id FROM Printing_Press__c WHERE Name = 'test press' LIMIT 1].Id);
            );
        shs.add(sh);
    }
    insert shs;
    Shipment__c sh = [SELECT Id, Shipping_Cost__c FROM Shipment__c WHERE Name = 'test shipment 999' LIMIT 1];
    Decimal estimated_cost = 48.46804666769003*2.34 + 10;
    Decimal actual_cost = sh.Shipping_Cost__c;
    System.assert(estimated_cost == actual_cost);
    Test.stopTest();


}
}