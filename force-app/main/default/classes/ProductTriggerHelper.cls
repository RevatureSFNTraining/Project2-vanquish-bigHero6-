/**
 * Helper for the trigger for the Product2 class.
 * @author Alonso del Arte
 */
public class ProductTriggerHelper {
    
    /**
     * Ensures the check digit is correct.
     * @param books A list of one or more <code>Product2</code> items.
     */
    public static void ensureCheckDigitChecksOut(List<Product2> books) {
        for (Product2 book : books) {
            try {
                ISBN barcodeNum = new ISBN((long) book.ISBN__c);
            } catch (CheckDigitException cde) {
                book.addError(cde.getMessage());
            }
        }
    }
    
    // TODO: Write tests for this
    public static void cleanUpOrphanedReviews(List<Product2> books) {
        System.debug('This trigger helper procedure doesn\'t do anything yet');
    }

}