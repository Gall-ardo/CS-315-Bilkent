enum class Color { RED, GREEN, BLUE }

sealed class Result {
    object Success : Result()
    data class Error(val message: String) : Result()
}

data class Obj(val x: Int)

// Sealed class for type-safe "union" types
sealed class Item {
   data class IntItem(val value: Int) : Item()
   data class StringItem(val value: String) : Item()
   data class ArrayItem(val value: Array<Int>) : Item() {
       override fun equals(other: Any?): Boolean {
           if (this === other) return true
           if (javaClass != other?.javaClass) return false
           other as ArrayItem
           return value.contentEquals(other.value)
       }
       override fun hashCode(): Int {
           return value.contentHashCode()
       }
   }
   data class ListItem(val value: List<Int>) : Item()
   data class MapItem(val value: Map<String, Int>) : Item()
   data class BoolItem(val value: Boolean) : Item()
   object NothingItem : Item()
   data class ObjItem(val value: Obj) : Item()
}

fun main() {
   println("1-What is the form and type of the control expression?")

   // variable
   var value = 5
   when (value) {
       1 -> println("Control expression is an integer with value 1")
       5 -> println("Control expression is an integer with value 5")
       else -> println("No match")
   }
   
   //expression
   var val1 = 3
   var val2 = 4
   when (val1 + val2) {
       7 -> println("Control expression is an expression resulting in 7")
       else -> println("No match")
   }
   
   // literal
   when (10) {
       10 -> println("Control expression is a literal with value 10")
       20 -> println("Control expression is a literal with value 20")
       else -> println("No match")
   }
   
   // object
   var obj = Obj(4)
   when (obj) {
       Obj(3) -> println("Object with x = 3")
       Obj(4) -> println("Object with x = 4")
       else -> println("No match")
   }

    // conditionals
   when {
       value == 5 -> println("Value is 5")
       value > 10 -> println("Value is greater than 10")
       else -> println("Value is not 5 and not greater than 10")
   }

    // nullable types
    val nullableValue: Int? = null
    when (nullableValue) {
        null -> println("Value is null")
        1 -> println("Value is 1")
        else -> println("Value is neither null nor 1")
    }
    
    // enum
    val colour = Color.RED
    when (colour) {
        Color.RED -> println("Color is red")
        Color.BLUE -> println("Color is blue")
        else -> println("Color is not red or blue")
    }
      
   val items = listOf( Item.IntItem(1), Item.StringItem("apple"), Item.ArrayItem(arrayOf(3, 4)), Item.ListItem(listOf(1, 2, 3)), Item.MapItem(mapOf("key" to 1)), Item.BoolItem(true), Item.NothingItem, Item.ObjItem(Obj(3)))
   
   for (item in items) {
       print("Value: $item, Type: ")
       when (item) {
           is Item.IntItem -> println("Control expression is an integer: ${item.value}")
           is Item.StringItem -> println("Control expression is a string: ${item.value}")
           is Item.ArrayItem -> println("Control expression is an array: ${item.value.contentToString()}")
           is Item.ListItem -> println("Control expression is a list: ${item.value}")
           is Item.MapItem -> println("Control expression is a map: ${item.value}")
           is Item.BoolItem -> println("Control expression is a boolean: ${item.value}")
           is Item.NothingItem -> println("Control expression is Nothing")
           is Item.ObjItem -> {
               if (item.value.x == 3) {
                   println("Control expression is an Obj with x = 3")
               } else {
                   println("Control expression is an Obj with x = ${item.value.x}")
               }
           }
       }
   }



   
   println("\n\n2-How are the selectable segments specified?")
   when (value) {
       5 -> {println("Case 5: Single statement")}
       10 -> {
           println("Case 10: First statement")
           println("Case 10: Second statement - multiple statements in a block")
       }
       20 -> 
           println("Case 20: First statement")
           //println("Case 20: Second statement - multiple statements in a block")
       else -> println("Default case")
   }



   println("\n\n3-Is execution flow through the structure restricted to include just a single selectable segment?")  
   value = 6
    when (value) {
        2, 4, 6 -> println("Matched even number")
        3, 6, 9 -> println("Matched divisible by 3")
        else -> println("No match")
    }



   
   println("\n\n4-How are case values specified?")
   
   val caseValue = 3
   // Literal
   when (caseValue) {
       1 -> println("Matched 1")
       2 -> println("Matched 2")
       3 -> println("Matched 3")
       else -> println("No match")
   }
   
   // Multiple values
   when (caseValue) {
       1, 2, 3 -> println("Matched 1, 2, or 3")
       4, 5, 6 -> println("Matched 4, 5, or 6")
       else -> println("No match")
   }
   
   // Expressions
   when (caseValue) {
       2 + 1 -> println("Matched 3 (2+1)")
       10 - 3 -> println("Matched 7 (10-3)")
       else -> println("No match")
   }
   
   // Variables
   val a = 1
   val b = 3
   when (caseValue) {
       a -> println("Matched a ($a)")
       b -> println("Matched b ($b)")
       else -> println("No match")
   }
    
   // different types not allowed
    /*when (caseValue) {
        3 -> println("Matched integer 3")
        "3" -> println("This would cause a compilation error - cannot compare Int with String")
        else -> println("No match")
    } */  
   
   // Ranges
   when (caseValue) {
       in 1..3 -> println("Matched range 1..3")
       !in 5..8 -> println("Matched not in range 5..8")
       else -> println("No match")
   }

    // conditionals
    when {
        caseValue < 0 -> println("Negative value")
        caseValue == 0 -> println("Zero value")
        caseValue > 0 && caseValue <= 3 -> println("Positive value between 1 and 3")
        caseValue > 3 -> println("Positive value greater than 3")
    }
    
    // functions
    fun isEven(n: Int) = n % 2 == 0
    fun isOdd(n: Int) = n % 2 == 1
    when {
        isEven(caseValue) -> println("$caseValue is even")
        isOdd(caseValue) -> println("$caseValue is odd")
    }
   
   // Type checking
   val anyValue: Any = "Hello"
   when (anyValue) {
       is String -> println("anyValue is a String: $anyValue, and its length is ${anyValue.length}")
       is Int -> println("anyValue is an Int: $anyValue")
       is Boolean -> println("anyValue is a Boolean: $anyValue")
       else -> println("anyValue is of some other type")
   }
   


   println("\n\n5-What is done about unrepresented expression values?")     
   // else is optional
   val unrepValue = 100
    when (unrepValue) {
       10 -> println("Matched 10")
       else -> println("unrepresented value: $unrepValue") 
    }
    when (unrepValue) {
        10 -> println("Matched 10")
    }
   
   // Expression requires an else branch or must be exhaustive
   val resultWithElse = when (unrepValue) {
       10 -> "ten"
       20 -> "twenty"
       else -> "no match" // Required
   }
   println("Result with else: $resultWithElse")
   
   // have to cover all cases
   val color = Color.BLUE
   val colorName = when (color) {
       Color.RED -> "Red"
       else -> "others" 
   }
   println("Color name: $colorName")
}