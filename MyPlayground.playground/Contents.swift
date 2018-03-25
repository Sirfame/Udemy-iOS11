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

// Arrays and Dictionaries
var array = [35, 36, 5, 2];
print(array[2]);

array.append(0);
array.remove(at: 2)
array.sort();
print(array);

var arr = [3.87, 7.1, 8.9]
arr.remove(at: 1);
arr.append(arr[0] * arr[1]);

let stringArray = [String]();
var dictionary = ["computer":"macBook", "coffee":"drink"]
print(dictionary["computer"]!)

dictionary["pen"] = "writing instrument";

dictionary.removeValue(forKey: "computer");
print(dictionary)

var gameCharacters = [String: Double]()
gameCharacters["ghost"] = 8.7

var menuDictionary = [String: Double]();
menuDictionary["pizza"] = 10.99;
menuDictionary["ice cream"] = 4.99;
menuDictionary["salad"] = 7.99;
var total : Double = 0;
for key in menuDictionary {
    total += key.value;
}
print("The total cost of my meal is \(total)")

