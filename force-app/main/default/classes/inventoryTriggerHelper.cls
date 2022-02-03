public class inventoryTriggerHelper {
    public static void handleTrigger(List<Inventory__c> inventoryList){      
        // Grabs all the inventory item products that are falling below or equal to 20% of the store's capacity
        List<Inventory__c> inventory_list = [select id, store__r.contact__r.id FROM Inventory__c WHERE QuantityCapacityCompare__c = 'true'];        
        Set<Id> contactIds = new Set<Id>();
        for (Inventory__c iLc : inventory_list) {
                contactIds.add(iLc.store__r.contact__r.id);
        }        
        List<Contact> contactList = [SELECT id, LastName, Email FROM Contact WHERE id IN :contactIds];
        sendEmails(contactList);
        
}
    public static void sendEmails(List<Contact> ContactsList){
        List<String> sendTo = new List<String>();
        // all email in the list
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();    
        for (Contact c : ContactsList){
            sendTo.add(c.Email);Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();mail.setReplyTo('volcanodragonPub@voldrag.com');mail.setSenderDisplayName('Volcano Dragon Publisher');mail.setToAddresses(sendTo);mail.setSubject('Replenish Inventory Stock'); //Subject of the mail and the body of the mail
            mail.setHtmlBody('Hello ' + c.LastName + ',' + '\n' + 'Please replenish your inventory stock to meet your customer needs. You are running low and need to purchase more. ' + 'To contact us about book inventory orders visit: ' + 'https://vol-dragon-publishing-developer-edition.na213.force.com/main/s/contactsupport');mails.add(mail);             
        }
        // Step 5: Send all emails in the master list
        Messaging.sendEmail(mails);
    }

}