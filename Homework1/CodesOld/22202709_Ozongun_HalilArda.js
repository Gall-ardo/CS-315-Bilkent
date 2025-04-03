/*
1. What types are legal for subscripts?
2. Are subscripting expressions in element references range checked?
3. Are ragged multidimensional arrays allowed?
4. Can array objects be initialized?
5. Are any kind of slices supported?
6. Which operators are provided?
*/

console.log("1: Legal types for subscripts: ");

let arr1 = [1, 2, 3, 4, 5];
console.log(arr1[2]); // 3

let idx = 3;
console.log(arr1[idx]); // 4

// JS coerces strings to numbers if possible
console.log(arr1["1"]); // 2
console.log(arr1[1.0]); // 2

// Invalid types become undefined
console.log(arr1[true]); // undefined (true is coerced to "true")
console.log(arr1["banana"]); // undefined
console.log(arr1[[1]]); // 2 (array [1] coerced to "1")


console.log("\n2: Range checking in element references:");

console.log(arr1[10]); // undefined
console.log(arr1[-1]); // undefined (no negative indexing)


console.log("\n3: Ragged multidimensional arrays:");

let ragged = [
    [1, 2, 3],
    [4, 5],
    [6, 7, 8, 9]
];
console.log(ragged);

// Accessing elements
console.log(ragged[0][1]); // 2
console.log(ragged[1][2]); // undefined


console.log("\n4: Initialization of arrays:");

let init1 = [1, 2, 3];
let init2 = Array(5).fill(0);
let init3 = Array.from({length: 5}, (_, i) => i + 1);
let init4 = new Array(3); // undefined values

console.log(init1);
console.log(init2);
console.log(init3);
console.log(init4);


console.log("\n5: Array Slice:");

let sliced1 = arr1.slice(1, 3); // [2, 3]
let sliced2 = arr1.slice(2);    // [3, 4, 5]
let sliced3 = arr1.slice(-2);   // [4, 5]

console.log(sliced1);
console.log(sliced2);
console.log(sliced3);


console.log("\n6: Allowed Operations:");

let a1 = [1, 2, 3];
let a2 = [1, 2, 3];
let a3 = [4, 5, 6];

// Equality check
console.log(JSON.stringify(a1) === JSON.stringify(a2)); // true

// No built-in array arithmetic
// console.log(a1 + a3); // "1,2,34,5,6" (coerced to strings)

// Concatenation
let concat = a1.concat(a3);
console.log(concat);

// Length
console.log(a1.length); // 3

// Sorting
let unsorted = [3, 1, 2];
unsorted.sort();
console.log("Sorted:", unsorted);

// Sum, Min, Max
let sum = a1.reduce((acc, val) => acc + val, 0);
let max = Math.max(...a1);
let min = Math.min(...a1);

console.log("Sum:", sum);
console.log("Max:", max);
console.log("Min:", min);
