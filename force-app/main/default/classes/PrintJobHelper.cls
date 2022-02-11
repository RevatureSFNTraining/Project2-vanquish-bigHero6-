//written by Trevor Kleinstuber
public class PrintJobHelper {
	  public static void myMethod(List<Print_Job__c> print){
        // if Print job exceeds Max quantity, the system will display an error message 
        for (Print_Job__c p : print){
            if (p.Quantity__c > 300) {
                p.Quantity__c.addError('Quantity can not exceed 300!');
            }
        }
    }
}
