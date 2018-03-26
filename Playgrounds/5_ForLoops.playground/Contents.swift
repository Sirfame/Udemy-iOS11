let array = [8, 4, 8, 1]

for number in array {
    print(number)
}


var arr = ["Sun", "Nhi", "DD", "VS"]
for name in arr {
    print("hi there \(name)")
}


var numbers = [7, 2, 9, 4, 1]
for(index, value) in numbers.enumerated() {
    numbers[index] += 1
}
print(numbers)

var nums = [Double]();
nums = [8, 7, 19, 28]
for (index, value) in nums.enumerated() {
    nums[index] /= 2;
}
print(nums)
