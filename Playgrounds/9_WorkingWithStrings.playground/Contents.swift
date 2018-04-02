// String manipulation
//: Playground - noun: a place where people can play

import UIKit

var str = "Hello"

var newString = str + " SF!";

for char in newString {
    print(char);
}

// NS = Next Step which is the company Steve Jobs was working with before coming back to Apple.
// Took a lot of the tech from NS back to Apple.
let newTypeString = NSString(string: newString);

// Exlusive, does not include index
newTypeString.substring(to: 5)

// Exclusive, starts from 5 to the end.
newTypeString.substring(from: 4);

NSString(string: newTypeString.substring(from: 6)).substring(to: 2);

newTypeString.substring(with: NSRange(location: 6, length: 2))

if newTypeString.contains("SF") {
    print("newTypeString contains SF");
}

newTypeString.components(separatedBy: " ");

newTypeString.uppercased;

newTypeString.lowercased;
