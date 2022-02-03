@isTest
public class DataFactory4TestContactController {
  
    public static List<Contact> createTestContacts(Integer numRecs) {
        
        List<Contact> conts = new List<Contact>();
        
        for(Integer i=0;i<numRecs;i++) {
            Contact c = new Contact();
            c.LastName='TestContact' + i;       
            conts.add(c);
        }
        insert conts;
        return conts;
  
    }
}