//: Playground - noun: a place where people can play

import UIKit

// Primitive Data Types
var name = "Sirfame";
var myInt = 25;
print(myInt + 100);
myInt += 1

var age: Int = 24;
print("my name is \(name) and i am \(age)");

var dub: Double = 5.76
var int: Int = 8

print("The product of \(dub) and \(int) is \(Double(int) * dub)");

var bool = true;

if bool {
    print(name)
}

// Random numbers
let diceRoll = arc4random_uniform(6)
