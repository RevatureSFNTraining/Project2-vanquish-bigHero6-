global class ISBN {
    
    final long barcodeNumber;
    
    private static void validateCheckDigit(long num) {
        long checkDigit = Math.mod(num, 10);
        num /= 10;
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
        if (checkDigit != sum) {
            String excMsg = 'Expected check digit ' + sum + ' but was ' + checkDigit;
            throw new CheckDigitException(excMsg);
        }
    }
    
    global ISBN(long num) {
        validateCheckDigit(num);
        this.barcodeNumber = num;
    }

}