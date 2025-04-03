fun printArray(arr: Any?) {
    when (arr) {
        is IntArray -> for (item in arr) print("$item ")
        is Array<*> -> for (item in arr) print("$item ")
        is Iterable<*> -> for (item in arr) print("$item ")
        }
    println()
}

fun main(){
    println("1. Legal types for subscripts:")
    val arr1 = arrayOf(1, 2, 3, 4, 5)
    println(arr1[0])
    // println(arr1[0.5]) Compile time error: argument type mismatch
    // println(arr1["3"]) Compile time error: argument type mismatch
    // println(arr1[true])  Compile time error: argument type mismatch
    // println(arr1[0..2]) argument type mismatch: actual type is 'IntRange', but 'Int' was expected.
    /*
    var ind : Long = 3
    println(arr1[ind]) // Compile time error: argument type mismatch: actual type is 'Long', but 'Int' was expected.
    */
    /*
    var ind : Short = 3
    println(arr1[ind]) // Compile time error: argument type mismatch: actual type is 'Short', but 'Int' was expected.
    */
    

    println("\n2. Range checking in subscripting expressions")
    // println(arr1[6]) // Runtime error: ArrayIndexOutOfBoundsException
    // println(arr1[-1]) // Runtime error: ArrayIndexOutOfBoundsException
    val num = 68
    // println(arr1[num]) // Runtime error: ArrayIndexOutOfBoundsException.


    println("\n3. Ragged multidimensional arrays")
    val raggedArr = arrayOf(arrayOf(1, 2, 3), arrayOf(4, 5), arrayOf(6, 7, 8, 9))
    for (i in raggedArr.indices) {
        printArray(raggedArr[i]) 
    }
    println("Type of raggedArr: ${raggedArr::class.simpleName}") // Array<Array<Int>>
    println("Type of raggedArr[0]: ${raggedArr[0]::class.simpleName}") // Array<Int>
    println("Type of raggedArr[0][0]: ${raggedArr[0][0]::class.simpleName}") // Int


    

    println ("\n4. Initialization of arrays")

    val arr2 = arrayOf(1, 2, 3, 4, 5, "fdbjlka", 3.14, true) // mix type
    printArray(arr2) 

    val intArr = IntArray(5) // size 5, 00000
    printArray(intArr)

    val lambdaArr = Array(5) { it * 2 }
    printArray(lambdaArr) // 0 2 4 6 8

    val arr4 = arrayOfNulls<Int>(5)
    printArray(arr4) 
    println(arr4::class.simpleName)

    val arr5 = Array<Int?>(5) { null }
    printArray(arr5)



    println("\n5. Array slices")

    val arr6 = arrayOf(1, 2, 3, 4, 5)
    val slice = arr6.slice(1..3) // (begin, end) inclusive
    println("Kind of slice: ${slice::class.simpleName}") 
    printArray(slice)
    

    val slice3 = arr6.slice(0..2 step 2) // step 2
    println("Kind of slice: ${slice3::class.simpleName}") 
    printArray(slice3)

    // To achive array when sliced:
    val coppied = arr6.copyOfRange(1, 3) // (begin, end) exclusive
    println("Kind of slice: ${coppied::class.simpleName}") 
    printArray(coppied)



    println("\n6.Allowed Operations")

    val a1 = arrayOf(1, 2, 3)
    val a2 = arrayOf(1, 2, 3)
    val a3 = arrayOf(4, 5, 6)

    println("a1 == a2: ${a1 == a2}")  // false, compares memory
    println("a1 === a2: ${a1 === a2}") // false, same as above
    println("a1 contentEquals a2: ${a1 contentEquals a2}")  // true
    println("a1 contentEquals a3: ${a1 contentEquals a3}")  // false

    val a4 = a1 + a3 // concatenation
    println("Array concatenation: $a4")

    // in operator - check if value exists in array:
    println("2 in a1: ${2 in a1}") // true
    println("10 in a1: ${10 in a1}") // false



}