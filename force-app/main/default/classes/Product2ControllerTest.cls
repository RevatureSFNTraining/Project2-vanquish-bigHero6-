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


}
