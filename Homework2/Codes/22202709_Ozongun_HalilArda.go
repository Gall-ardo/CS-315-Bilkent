package main

import "fmt"


type Obj struct {
	x int
}

func main() {
	fmt.Println("1 - What is the form and type of the control expression?")

	// Control expression as a variable
	value := 5
	switch value {
	case 1:
		fmt.Println("Control expression is an integer")
	case 5:
		fmt.Println("Control expression is an integer")
	}

	// Control expression as an expression
	val1 := 3
	val2 := 4
	switch val1 + val2 {
	case 7:
		fmt.Println("Control expression is an expression resulting in 7")
	}

	// Control expression as a literal
	switch 10 {
		case 10:
		fmt.Println("Control expression is a literal")
		case 20:
		fmt.Println("Control expression is a literal")

	}

	// Control expression as a object
	obj := Obj{4}
	switch obj {
		case Obj{3}:
			fmt.Println("Object with x = 3")
		case Obj{4}:
			fmt.Println("Object with x = 4")
	}

	// Type switch
	var i interface{}
	items := []interface{}{1, "apple", [2]int{3, 4}, []int{1, 2, 3}, map[string]int{"key": 1}, true, nil, Obj{3}}

	for _, i = range items {
		// print value and type of i
		fmt.Printf("Value: %v, Type: %T\t\t", i, i)
		switch v := i.(type) {
		case int:
			fmt.Println("Control expression is an integer")
		case string:
			fmt.Println("Control expression is a string")
		case [2]int:
			fmt.Println("Control expression is an array length 2")
		case []int:
			fmt.Println("Control expression is a slice")
		case map[string]int:
			fmt.Println("Control expression is a map")
		case bool:
			fmt.Println("Control expression is a boolean")
		case nil:
			fmt.Println("Control expression is nil")
		case Obj:
			if v.x == 3 {
				fmt.Println("Control expression is an Obj with x = 3")
			} else {
				fmt.Println("Control expression is an Obj")
			}
		default:
			fmt.Println("No match found")
		}
	}




	fmt.Println("\n\n2 - How are the selectable segments specified?")
	value = 5
	switch value {
	case 5:
		fmt.Println("Case 5: Single statement")
	case 10:
		fmt.Println("Case 10: Multiple statements")
		fmt.Println("You can have more than one line in a case block")
	}



	fmt.Println("\n\n3 - Is execution flow restricted to just a single selectable segment?")
	value = 6
	switch value {
	case 2, 4, 6:
		fmt.Println("Matched even number")
	case 3, 9: 
		fmt.Println("Matched divisible by 3")
	default:
		fmt.Println("No match")
	}
	value = 6
	switch value {
	case 2, 4, 6:
		fmt.Println("Matched even number")
		fallthrough
	case 3, 9: 
		fmt.Println("Matched divisible by 3")
	default:
		fmt.Println("No match")
	}
	/*switch value {
	case 2, 4, 6:
		fmt.Println("Matched even number")
		case 3, 6, 9:
		fmt.Println("Matched divisible by 3")
	}*/




	fmt.Println("\n\n4 - How are case values specified?")

	value = 3
	// literal values
	switch value {
	case 1:
		fmt.Println("Matched 1")
	case 2:
		fmt.Println("Matched 2")
	case 3:
		fmt.Println("Matched 3")
	}

	// expressions
	switch value {
	case 2 + 1:
		fmt.Println("Matched 3")
	case 10 - 3:
		fmt.Println("Matched 7")
	}

	// expression with variables
	var m, n int = 2, 3
	switch value {
	case m * n:
		fmt.Println("Matched 6")
	case m + n:
		fmt.Println("Matched 5")
	}

	// multiple case values

	switch value {
	case 1, 2, 3:
		fmt.Println("Matched 1, 2, or 3")
	case 4, 5, 6:
		fmt.Println("Matched 4, 5, or 6")
	}

	// variables
	var a, b int = 1, 3
	switch value {
	case a:
		fmt.Println("Matched a")
	case b:
		fmt.Println("Matched b")
	}

	// different types not allowed: 
	// "Compile time error: cannot convert "2" (untyped string constant) to type int"
	/*switch value {
	case 1:
		fmt.Println("Matched 1")
	case "2":
		fmt.Println("Matched string 2")
	}*/

	// type switch
	var i2 interface{} = 4
	switch i2.(type) {
	case int:
		fmt.Println("Matched int")
	case string:
		fmt.Println("Matched string")
	case bool:
		fmt.Println("Matched bool")
	case nil:
		fmt.Println("Matched nil")
	}
	
	


	fmt.Println("\n\n5 - What is done about unrepresented expression values?")
	value = 100
	switch value {
	case 10:
		fmt.Println("Matched 10")
	default:
		fmt.Println("No match for the given value")
	}
}
