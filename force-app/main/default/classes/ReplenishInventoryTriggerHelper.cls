public class ReplenishInventoryTriggerHelper {
    
    public static void handleTrigger(List<Inventory__c> inventoryList){      
        // Grabs all the inventory item products that are falling below or equal to 20% of the store's capacity
        List<Inventory_Line__c> inventory_line = [select id, inventory__r.store__r.contact__r.id FROM Inventory_Line__c WHERE CapacityCompare__c = 'true'];        
        Set<Id> contactIds = new Set<Id>();
		for (Inventory_Line__c iLc : inventory_line) {
                contactIds.add(iLc.inventory__r.store__r.contact__r.id);
        }        
        List<Contact> contactList = [SELECT id,FirstName,Email FROM Contact WHERE id IN :contactIds];
        sendEmails(contactList);
        
}
    public static void sendEmails(List<Contact> ContactsList){
        List<String> sendTo = new List<String>();
        // all email in the list
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();    
        for (Contact c : ContactsList){
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setSubject('Replenish Inventory Stock'); //Subject of the mail and the body of the mail
            mail.setHtmlBody('Hello ' + c.FirstName + ',' + '\n' + 'Please replenish your inventory to meet your customer needs. ' + 'For more details you can visit' + ' https://volcanodragon-pub/homepage');       
            mails.add(mail);             
        }
        // Step 5: Send all emails in the master list
        Messaging.sendEmail(mails);
    }

}