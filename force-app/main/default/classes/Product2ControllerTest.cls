/**
 * Tests of the Product2Controller class.
 * @author Alonso del Arte, trying to reproduce Sergio Santillana's tests which 
 * were misplaced or lost somehow.
 */
@isTest
public with sharing class Product2ControllerTest {

    @isTest
    public static void testGetBookAuthor() {
        String authorName = 'Joanna Q. Public';
        Account expected = new Account(name = authorName);
        insert expected;
        Account actual = Product2Controller.getBookAuthor(authorName);
        System.assertEquals(expected, actual);
    }
    
    @isTest
    public static void testGetBooksByAuthor() {
        String authorName = 'Mahmoud Hameid';
        Account bookAuthor = new Account(name = authorName);
        insert bookAuthor;
        Product2 book1 = new Product2(name = 'The Reckoning, Part I', 
                                      Author__c = bookAuthor.Name, 
                                      Genre__c = 'Other', Year__c = Date.today(), 
                                      ISBN__c = 9785550000000014L);
        Product2 book2 = new Product2(name = 'The Reckoning, Part II', 
                                      Author__c = bookAuthor.Name, 
                                      Genre__c = 'Other', Year__c = Date.today(), 
                                      ISBN__c = 9785550000000021L);
        insert book1;
        insert book2;
        Set<Product2> expected = new Set<Product2>{book1, book2};
        Set<Product2> actual 
            = new Set<Product2>(Product2Controller.getBooksByAuthor(authorName));
        System.assertEquals(expected, actual);
    }
    
    @isTest
    public static void testGetBookById() {
        Account bookAuthor = new Account(name = 'Olga Vrpna');
        insert bookAuthor;
        Product2 expected = new Product2(name = 'Seven Days and Six Nights', 
                                      Author__c = bookAuthor.Name, 
                                      Genre__c = 'Other', Year__c = Date.today(), 
                                      ISBN__c = 9785550000000038L);
        insert expected;
        String bookID = expected.Id;
        Product2 actual = Product2Controller.getBookById(bookId);
        System.assertEquals(expected, actual);
    }

}
