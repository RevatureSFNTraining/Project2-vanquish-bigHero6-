public class shipmentTriggerHelper {
    public static final Decimal costToShipPerMile = 2.34;
    public static final Decimal baseCostPerShipment = 10;
    public static final Integer maxBooksPerShipment = 100; 
    //method to find nearest printing press if not listed 
    //and then calculate the cost to ship 
    //from the press to the store
    public static void calculateShipping(List<Shipment__c> theList) {
        //get the stores
        List<ID> storeIDs = new List<ID>();
        for(Shipment__c ship : theList) {
            storeIDs.add(ship.Store__c);
        }    
        Map<ID, Store__c> theStores = new Map<ID, Store__c>([SELECT Id, Location__c FROM Store__c WHERE Id in :storeIDs]);

        //do any of these orders need a printing press assigned?
        List<Shipment__c> shipsThatNeedAPress = new List<Shipment__c>();
        Boolean pullAllPresses = false;
        for(Shipment__c s : theList) {
            if(s.Printing_Press__c == null) {
                pullAllPresses = true;
                shipsThatNeedAPress.add(s);
            }
        }
        List<ID> thePressIDs;
        Map<ID, Printing_Press__c> thePresses;

        //if so, we need to pull up the list of printing presses and we will find the closest
        if(pullAllPresses) {
            thePresses = new Map<ID, Printing_Press__c>([SELECT Id, Location__c FROM Printing_Press__c]);

            //the magic of pass-by-reference at work
            for(Shipment__c ship : shipsThatNeedAPress) {
                Location fromLoc;
                Location toLoc = theStores.get(ship.Store__c).Location__c;
                //approx circumference of the earth
                Decimal howFar = 25000;
                Decimal thisFar;

                //!!!!!!!--------------subMAIN-------------------!!!!!!!!!!
                //store the nearest printing press if not set
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
            for(Shipment__c ship : theList) {
                thePressIDs.add(ship.Printing_Press__c);
            }
            thePresses = new Map<ID, Printing_Press__c>([SELECT Id, Location__c FROM Printing_Press__c WHERE Id IN :thePressIDs]);
        }

        //!!!!!!!------------MAIN--------------------!!!!!!!!!
        //calculate and store the shipping cost
        for(Shipment__c ship : theList) {
            Location fromLoc = thePresses.get(ship.Printing_Press__c).Location__c;
            Location toLoc = theStores.get(ship.Store__c).Location__c;
            ship.Shipping_Cost__c = baseCostPerShipment + costToShipPerMile * Location.getDistance(fromLoc, toLoc, 'mi');
        }
    }
}