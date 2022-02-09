/**
 * Represents an International Standard Book Number (ISBN-13) with validated 
 * check digit. This is based on my <code>BarcodeNumberWithCheckDigit</code> 
 * class from my Toy Examples in Java repository. Can also handle FISBN 
 * (ISBN-16). No comment on ISBN-10.
 * @author Alonso del Arte
 */
global class ISBN {
    
    final long barcodeNumber;
    
    private static void validateCheckDigit(long num) {
        long presumedCheckDigit = Math.mod(num, 10);
        long original = num / 10;
        long digits = original;
        boolean needsTripling = true;
        long sum = 0;
        long digit;
        while (digits > 0) {
            digit = Math.mod(digits, 10);
            if (needsTripling) digit *= 3;
            sum += digit;
            needsTripling = !needsTripling;
            digits /= 10;
        }
        sum *= -1;
        sum = Math.mod(sum, 10);
        if (sum < 0) sum += 10;
        if (presumedCheckDigit != sum) {
            String excMsg = 'Check digit for ' + original 
                + ' should be ' + sum + ' not ' + presumedCheckDigit;
            throw new CheckDigitException(excMsg);
        }
    }
    
    /**
     * Constructor.
     * @param num The number with check digit.
     * @throws CheckDigitException If the check digit is incorrect.
     */
    global ISBN(long num) {
        validateCheckDigit(num);
        this.barcodeNumber = num;
    }

}
