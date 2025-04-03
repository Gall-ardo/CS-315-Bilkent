package main

import "fmt"
import "reflect"
import "sort"

/*
What types are legal for subscripts?
Are subscripting expressions in element references range checked?
Are ragged multidimensional arrays allowed?
Can array objects be initialized?
Are any kind of slices supported?
Which operators are provided?
*/


func main() {

	fmt.Println("1: Legal types for subscripts: ")

	arr1 := [5]int{1,2,3,4,5}
	fmt.Println(arr1[3])
	var index int64 = 4
	fmt.Println(arr1[index]) // 64 bit integer is legal
	fmt.Println(arr1[int64(3)]) 
	//fmt.Println(arr1[3.3]) -> Compile time Error: invalid array index 3.3 (type float64)
	fmt.Println(arr1[3.0]) // Legal: 3.0 is implicitly treated as int
	//fmt.Println(arr1["3"]) -> Compile time Error: invalid array index "3" (type string)
	var index3 float64 = 3.3
	fmt.Println(arr1[int(index3)]) // No error since float is converted to int
	//fmt.Println(arr1[index3])


	fmt.Println("2: Range checking in Subscripting expressions: ")
	// fmt.Println(arr1[9]) // Compile time error for constant index out of range
	//fmt.Println(arr1[-2]) 
	var index2 = 9
	fmt.Println(arr1[index2]) // Runtime error for variable index out of range


	
	fmt.Println("3: Ragged multidimensional arrays: ")
	
	var multidimensionalArr = [3][2]int{{1,2}, {3,4}, {6,7}} // Normal multidimensional array
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
	// Initialization with only size
	var arr4 = [5]int{}
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

	// step slicing not legal
	// slice3 := arr1[1:3:1] -> Compile time error.
	// slicing with function not legal

	fmt.Println("6: Allowed Operations: ")

	a1 := [3]int{1, 2, 3}
	a2 := [3]int{1, 2, 3}
	a3 := [3]int{4, 5, 6}

	// Equality
	fmt.Println(a1 == a2, a1 == a3) 

	// Arithmetic op.
	//fmt.Println(a1 + a2)
	//fmt.Println(a1 * a2)

	// Concatenation
	s1 := append(a1[:], a2[:]...)
	fmt.Println(s1)
	fmt.Println(reflect.TypeOf(a1[:]).Kind())
	fmt.Println(reflect.TypeOf(s1).Kind())
	
	// length 
	fmt.Println(len(a1))

	// To sort: 
	a1 = [3]int{3, 2, 1}
	fmt.Println(a1)
	sort.Ints(a1[:])
	fmt.Println("After sorting: ", a1)
	fmt.Println(reflect.TypeOf(a1).Kind())

	// Sum, min, max -> Not allowed.


}
