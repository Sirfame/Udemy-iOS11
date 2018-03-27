// Function to see if it is prime

func isPrime(n : Int) -> Bool {
    if n < 2 {
        return false;
    }
    var divisor = 2;
    while divisor <= n / 2 {
        if n % divisor == 0 {
            return false;
        }
        divisor += 1;
    }
    return true;
}

for i in 1 ... 100 {
    if isPrime(n: i) {
        print(i)
    }
}
