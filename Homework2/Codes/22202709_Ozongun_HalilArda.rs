fn main() {
    println!("1 - What is the form and type of the control expression?");

    // variable
    let value = 5;
    match value {
        1 => println!("Control expression is an integer"),
        5 => println!("Control expression is an integer"),
        _ => (),
    }

    // expression
    let val1 = 3;
    let val2 = 4;
    match val1 + val2 {
        7 => println!("Control expression is an expression"),
        _ => (),
    }

    // literal
    match 10 {
        10 => println!("Control expression is a literal"),
        20 => println!("Control expression is a literal"),
        _ => (),
    }

    // object
    #[derive(PartialEq, Debug)]
    struct Obj {
        x: i32,
    }
    let obj = Obj { x: 4 };
    match obj {
        Obj { x: 3 } => println!("Object with x = 3"),
        Obj { x: 4 } => println!("Object with x = 4"),
        _ => (),
    }

    // Option type
    let some_value: Option<i32> = Some(5);
    match some_value {
        Some(n) => println!("Got a value: {}", n),
        None => println!("Got None"),
    }

    // Match on different types using enums
    println!("\nExample with different types using enums:");
    
    #[derive(Debug)]
    enum Item {
        Integer(i32),
        Text(String),
        Array([i32; 2]),
        Vector(Vec<i32>),
        Map(std::collections::HashMap<String, i32>),
        Boolean(bool),
        Nothing,
        CustomObj(Obj),
    }

    let items = vec![
        Item::Integer(1),
        Item::Text(String::from("apple")),
        Item::Array([3, 4]),
        Item::Vector(vec![1, 2, 3]),
        {
            let mut map = std::collections::HashMap::new();
            map.insert(String::from("key"), 1);
            Item::Map(map)
        },
        Item::Boolean(true),
        Item::Nothing,
        Item::CustomObj(Obj { x: 3 }),
    ];

    for item in items {
        print!("Value: {:?}, Type: ", item);
        match item {
            Item::Integer(n) => println!("Control expression is an integer: {}", n),
            Item::Text(s) => println!("Control expression is a string: {}", s),
            Item::Array(arr) => println!("Control expression is an array length 2: {:?}", arr),
            Item::Vector(vec) => println!("Control expression is a vector: {:?}", vec),
            Item::Map(map) => println!("Control expression is a map: {:?}", map),
            Item::Boolean(b) => println!("Control expression is a boolean: {}", b),
            Item::Nothing => println!("Control expression is Nothing"),
            Item::CustomObj(obj) => {
                if obj.x == 3 {
                    println!("Control expression is an Obj with x = 3")
                } else {
                    println!("Control expression is an Obj")
                }
            }
        }
    }


    
    println!("\n\n2 - How are the selectable segments specified?");
    let value = 5;
    match value {
        5 => println!("Case 5: Single statement"),
        10 => {
            println!("Case 10: Multiple statements");
            println!("You can have more than one line in a case block");
        }
        20 =>{
            println!("Case 20: single statement");
        }
        _ => (),
    }


    println!("\n\n3 - Is execution flow restricted to just a single selectable segment?");
    let value = 6;
    match value {
        2 | 4 | 6 => println!("Matched even number"),
        3 | 6 | 9 => println!("Matched divisible by 3"),
        _ => println!("No match"),
    }



    println!("\n\n4 - How are case values specified?");

    let value = 3;
    // literal values
    match value {
        1 => println!("Matched 1"),
        2 => println!("Matched 2"),
        3 => println!("Matched 3"),
        _ => (),
    }

    // variables
    let three = 2 + 1;
    let seven = 10 - 3;
    match value {
        three => println!("Matched 3"),
        seven => println!("Matched 7"),
        _ => (),
    }

    let strValue = "Hello";
    match strValue {
        "Hello" => println!("Matched Hello"),
        "World" => println!("Matched World"),
        _ => (),
    }

    // different types
    /*let value = 4;
    match value {
        "Hello" => println!("Different types are not allowed"),
        4 => println!("Different types are not allowed"),
        4.0 => println!("Different types are not allowed"),
        _ => (),
    }*/

    // multiple case values using OR patterns
    match value {
        1 | 2 | 3 => println!("Matched 1, 2, or 3"),
        4 | 5 | 6 => println!("Matched 4, 5, or 6"),
        _ => (),
    }

    // Pattern matching with ranges
    for i in 1..10 {
        match i {
            1..=3 => println!("Matched range 1 to 3: {}", i),
            4..=6 => println!("Matched range 4 to 6: {}", i),
            _ => println!("No match for: {}", i),
        }
    }
    
    // Type matching with enums
    #[derive(Debug)]
    enum Value {
        Int(i32),
        Str(String),
        Bool(bool),
    }

    let val = Value::Int(4);
    match val {
        Value::Int(i) => println!("Matched int: {}", i),
        Value::Str(s) => println!("Matched string: {}", s),
        Value::Bool(b) => println!("Matched bool: {}", b),
    }
    
    // expression with variables
    let m: i32 = 2;
    let n: i32 = 3;
    match value {
        x if x == m * n => println!("Matched 6"),
        x if x == m + n => println!("Matched 5"),
        x => println!("Matched other value: {}", x),
    }

    // variables with binding
    let a: i32 = 1;
    let b: i32 = 3;
    match value {
        x if x == a => println!("Matched a"),
        x if x == b => println!("Matched b"),
        _ => (),
    }


    println!("\n\n5 - What is done about unrepresented expression values?");
    let value = 100;
    match value {
        10 => println!("Matched 10"),
        _ => println!("No match for the given value (using wildcard)"),
    }
    match value {
        10 => println!("Matched 10"),
        default_value => println!("No match for value: {}", default_value),
    }
    /*match value {
        10 => println!("Matched 10"), // not compiled
    }*/
}
