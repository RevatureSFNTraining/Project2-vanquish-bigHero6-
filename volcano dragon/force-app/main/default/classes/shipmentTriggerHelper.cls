public class shipmentTriggerHelper {
public static final Decimal costToShipPerMile = 2.34;
public static final Decimal baseCostPerShipment = 10;
public static final Integer maxBooksPerShipment = 100; 
//method to find nearest printing press if not listed 
//and then calculate the cost to ship 
//from the press to the store
public static void calculateShipping(Map<ID, Shipment__c> theMap) {
    //List<ID> ids = new List<ID>(beforeMap.keySet());
    List<ID> storeIDs = new List<ID>();

    //get the stores
    for(Shipment__c ship : theMap.values()) {storeIDs.add(ship.Store__c);}
    Map<ID, Store__c> theStores = new Map<ID, Store__c>([SELECT Id, Location__c FROM Store__c WHERE Id in :storeIDs]);
    //do any of these orders need a printing press assigned?
    Map<ID, Shipment__c> shipsThatNeedAPress = new Map<ID, Shipment__c>();
    Boolean pullAllPresses = false;
    for(ID i : theMap.keySet()) {
        if(theMap.get(i).Printing_Press__c == null) {
            pullAllPresses = true;
            shipsThatNeedAPress.put(i, theMap.get(i));
        }
    }
    List<ID> thePressIDs;
    Map<ID, Printing_Press__c> thePresses;
    //if so, we need to pull up the list of printing presses and we will find the closest
    if(pullAllPresses) {
        thePresses = new Map<ID, Printing_Press__c>([SELECT Id, Location__c FROM Printing_Press__c]);

        //the magic of pass-by-reference at work
        for(Shipment__c ship : shipsThatNeedAPress.values()) {
            Location fromLoc;
            Location toLoc = theStores.get(ship.Store__c).Location__c;
            Decimal howFar = 25000;//approx circumference of the earth
            Decimal thisFar;
            for(ID it: thePresses.keySet()) {
                fromLoc = thePresses.get(it).Location__c;
                thisFar = Location.getDistance(fromLoc, toLoc, 'mi');
                if(thisFar < howFar) {
                    howFar = thisFar;
                    ship.Printing_Press__c = it;
                }
            }
        }


        //if not we can just calulate the shipping costs based on the information provided
    } else {
        for(Shipment__c ship : theMap.values()) {
            thePressIDs.add(ship.Printing_Press__c);
        }
        thePresses = new Map<ID, Printing_Press__c>([SELECT Id, Location__c FROM Printing_Press__c WHERE Id IN :thePressIDs]);
    }
        //THE MAGIC!
    for(Shipment__c ship : theMap.values()) {
        Location fromLoc = thePresses.get(ship.Printing_Press__c).Location__c;
        Location toLoc = theStores.get(ship.Store__c).Location__c;
        ship.Shipping_Cost__c = baseCostPerShipment + costToShipPerMile * Location.getDistance(fromLoc, toLoc, 'mi');
    }
    //}




}









//the recycle bin of code:
//Integer howMany = beforeMap.size();
    //Integer i = 0;
    //while(i < howMany && !pullAllPresses) {
    //    pullAllPresses |= (beforeMap.get(ids[i]).Printing_Press__c == null);
    //}  
            //    Decimal distance;
    //    Location startLoc = Location.newInstance(28.635308,77.22496);
    //    Location endLoc = Location.newInstance(37.7749295,-122.4194155);
    //    Double dist = Location.getDistance(loc1, loc2, 'mi');
    //}


}