package main

import "fmt"
import "reflect"

func main() {

	fmt.Println("1: Legal types for subscripts: ")
	arr1 := [5]int{1,2,3,4,5}
	fmt.Println(arr1[3])
	var index int64 = 4
	fmt.Println(arr1[index])
	fmt.Println(arr1[int64(3)]) 
	//fmt.Println(arr1[3.3]) // Compile time Error: invalid array index 3.3 (type float64)
	fmt.Println(arr1[3.0])
	// fmt.Println(arr1["3"]) // Compile time Error: invalid array index "3" (type string)
	var index3 float64 = 3.0
	fmt.Println(arr1[int(index3)])
	// fmt.Println(arr1[index3]) // Compile time Error: (variable of type float64) must be integer



	fmt.Println("2: Range checking in Subscripting expressions: ")
	// fmt.Println(arr1[9]) // Compile time error for constant index out of range
	// fmt.Println(arr1[-2]) // Compile time error for negative index
	//var index2 = 9
	// fmt.Println(arr1[index2]) // Runtime error: index out of range [9] with length 5


	
	fmt.Println("3: Ragged multidimensional arrays: ")
	
	var multidimensionalArr = [3][2]int{{1,2}, {3,4}, {6,7}}
	//var multidimensionalArrOOB = [3][2]int{{1,2}, {3,4}, {6,7,8}} // Compile time error.
	fmt.Println(multidimensionalArr)

	fmt.Println(reflect.TypeOf(multidimensionalArr).Kind())
	fmt.Println(reflect.TypeOf(multidimensionalArr[0]).Kind())

	var raggedArr = [3][4]int{{1,2,3,4}, {5,6}, {7,8,9}} // Legal. but not ragged. It fills with 0
	fmt.Println(raggedArr)
	fmt.Println(reflect.TypeOf(raggedArr).Kind())
	fmt.Println(reflect.TypeOf(raggedArr[1]).Kind())

	var raggedSlice = [3][]int{{1,2}, {3,4,5}, {6,7,8,9}} // If size is not given, it is array of slices
	fmt.Println(raggedSlice)
	fmt.Println(reflect.TypeOf(raggedSlice).Kind())
	fmt.Println(reflect.TypeOf(raggedSlice[1]).Kind())


	fmt.Println("4: Initialization of arrays: ")
	
	var arr2 = [5]int{1,2,3,4,5}
	fmt.Println(reflect.TypeOf(arr2).Kind())

	var arr3 = [...]int{1,2,3,4,5}
	fmt.Println(reflect.TypeOf(arr3).Kind())

	var arr4 = [5]int{} // Initialization with only size

	fmt.Println(arr4)
	fmt.Println(reflect.TypeOf(arr4).Kind())

	var arr5 [5]int = [5]int{1,2,3,4,5}
	fmt.Println(reflect.TypeOf(arr5).Kind())
	



	fmt.Println("5: Array Slice: ")
	slice1 := arr1[1:3] // Slice of array
	slice2 := arr1[1:] // Slice of array with capacity
	fmt.Println(slice1)
	fmt.Println(reflect.TypeOf(slice1).Kind())
	fmt.Println(slice2)
	fmt.Println(reflect.TypeOf(slice2).Kind())
	// slice3 := arr1[1:3:1] //  Compile time error.



	
	fmt.Println("6: Allowed Operations: ")

	fmt.Println("2: Equality of arrays (value-based)")
	a1 := [3]int{1, 2, 3}
	a2 := [3]int{1, 2, 3}
	a3 := [3]int{3, 2, 1}
	fmt.Println("a1 == a2:", a1 == a2) // true
	fmt.Println("a1 == a3:", a1 == a3) // false

	// Compile-time error if array lengths don't match
	// a4 := [4]int{1, 2, 3, 4}
	// fmt.Println(a1 == a4) // ❌ Error: mismatched types

	fmt.Println("3: Memory equality using pointers")
	p1 := &a1
	p2 := &a2
	fmt.Println("p1 == p2:", p1 == p2) // false

	p3 := &a1
	fmt.Println("p1 == p3:", p1 == p3) // true

	fmt.Println("\n4: Concatenation — Not supported for arrays directly")
	// No + operator for arrays
	// You'd need to convert to slice and use append:
	slice := append(a1[:], a2[:]...)
	fmt.Println("Concatenated as slice:", slice)



}
