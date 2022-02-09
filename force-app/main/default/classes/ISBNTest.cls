/**
 * Tests of the ISBN class.
 * @author Alonso del Arte
 */
@isTest
public class ISBNTest {
    
    private static long calculateCheckDigit(long num) {
        boolean needsTripling = true;
        long sum = 0;
        long digit;
        while (num > 0) {
            digit = Math.mod(num, 10);
            if (needsTripling) digit *= 3;
            sum += digit;
            needsTripling = !needsTripling;
            num /= 10;
        }
        sum *= -1;
        sum = Math.mod(sum, 10);
        if (sum < 0) sum += 10;
        return sum;
    }
    
    @isTest
    public static void testCheckDigitExceptionMessage() {
        long num = (long) (1000000000.0 * Math.random());
        long checkDigit = calculateCheckDigit(num);
        long invalidCheckDigit = checkDigit + 1;
        if (invalidCheckDigit == 10) {
            invalidCheckDigit = 0;
        }
        long invalidNumberForISBN = num * 10 + invalidCheckDigit;
        try {
            ISBN badISBN = new ISBN(invalidNumberForISBN);
            String msg = 'Trying to use ' + invalidNumberForISBN 
                + ' for ISBN should have caused an exception';
            System.assert(false, msg);
        } catch (CheckDigitException cde) {
            String expected = 'Check digit for ' + num 
                + ' should be ' + checkDigit + ' not ' + invalidCheckDigit;
            Object actual = cde.getMessage();
            System.assertEquals(expected, actual);
        }
    }
    
    @isTest
    public static void testConstructor() {
        long num = (long) (1000000000.0 * Math.random());
        long checkDigit = calculateCheckDigit(num);
        for (integer i = 0; i < 10; i++) {
            boolean excIndicator = (i == checkDigit);
            try {
                new ISBN(num * 10 + i);
            } catch (CheckDigitException cde) {
                excIndicator = !excIndicator;
            }
            System.assert(excIndicator);
        }
    }

}
