/**
 * Trigger for the Product2 class, which we're using to represent books.
 * @author Alonso del Arte
 */

trigger ProductTrigger on Product2 (before insert, before update, before delete) {
    
    switch on Trigger.operationType {
        when BEFORE_INSERT, BEFORE_UPDATE {
            ProductTriggerHelper.ensureCheckDigitChecksOut(Trigger.new);
        }
        when BEFORE_DELETE {
            ProductTriggerHelper.cleanUpOrphanedReviews(Trigger.new);
        }
        when else {
            System.debug('Nothing defined for this operation type');
        }
    }

}