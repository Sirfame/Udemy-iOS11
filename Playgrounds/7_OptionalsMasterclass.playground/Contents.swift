// Optionals Masterclass

var number : Int?
print(number)

let userEnteredText = "3";
// because this value might be nil, Swift will let us know that we have to use an optional
if let userEnteredInteger = Int(userEnteredText) {
    print(userEnteredInteger)
} else {
    // show an error message to the user
}

