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