@isTest
public class DataFactory4TestAccountController {
  
    public static List<Account> createTestAccounts(Integer numRecs) {
        
        List<Account> accs = new List<Account>();
        
        for(Integer i=0;i<numRecs;i++) {
            Account a = new Account();
            a.Name='TestAccount' + i;       
            accs.add(a);
        }
        insert accs;
        return accs;
  
    }
}