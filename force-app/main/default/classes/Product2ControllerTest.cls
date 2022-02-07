/**
 * Tests of the Product2Controller class.
 */
@isTest
public with sharing class Product2ControllerTest {

    @isTest
    public void testBookAuthor() {
        String authorName = 'Joanna Q. Public';
        Account expected = new Account(name = authorName);
        insert expected;
        Account actual = Product2Controller.getBookAuthor(authorName);
        System.assertEquals(expected, actual);
    }


}
