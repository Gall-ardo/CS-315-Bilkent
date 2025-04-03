use std::any::type_name;
use std::convert::TryInto;

fn type_of<T>(_: &T) -> &'static str {
    type_name::<T>()
}

fn print_array(arr: &[i32]) {
    for i in 0..arr.len() {
        print!("{}  ", arr[i]);
    }
    println!(" ");
}

fn main(){
    println!("1: Legal types for subscripts:");
    let arr1 = [1, 2, 3, 4, 5];
    println!("{}", arr1[0]);
    // println!("{}", arr1["0"]); // Compile time error: error[E0277]: the type `[{integer}]` cannot be indexed by `&str`
    //println!("{}", arr1[0.0]); // Compile time error: error[E0277]: the type `[{integer}]` cannot be indexed by `float`
    // println!("{}", arr1[0.0f32]); // Compile time error: error[E0277]: the type `[{integer}]` cannot be indexed by `f32`
    let mut i = 0;
    println!("{}", arr1[i]);
    println!("type: of i: {}", type_of(&i));
    let i2: u32 = 0;
    // println!("{}", arr1[i2]); //Compile time errorL error[E0277]: the type `[{integer}]` cannot be indexed by `u32`




    println!("\n\n2: Range checking in Subscripting expressions: ");
    //println!("{}", arr1[9]);  // compile-time denial -> Don't compile.
    //println!("{}", arr1[-3]); // Compile time error. Negative integers cannot be used to index on a [{integer},5]
    i = 98;
    // println!("{}", arr1[i]); // Run-time error.




    println!("\n\n3: Ragged multidimensional arrays: ");
    let multidimensionalArr = [[1, 2, 3], [4, 5, 6]];
    println!("type: of multidimensionalArr: {}", type_of(&multidimensionalArr));

    //let raggedArr = [[1, 2, 3], [4, 5]]; // Compile time error.
    //println!("type: of raggedArr: {}", type_of(&raggedArr)); 

    // array of vectors
    let arr_of_vec = [vec![1, 2, 3], vec![4, 5, 6]];
    println!("type: of arr_of_vec: {}", type_of(&arr_of_vec));
    
    



    println!("\n\n4: Initialization of arrays: ");
    let mut arr2 = [5, 6, 7, 8, 9]; // Mutable array
    let arr3 = [5, 6, 7, 8, 9]; // Immutable array
    let arr4 = [6; 5];
    print_array(&arr4);
    let arr6: [i32; 5] = [45263, 45263, 45263, 45263, 45263];
    print_array(&arr6);
    let vec = vec![43, 45, 67, 89, 90]; // Vector
    let arr7: [i32; 5] = vec.try_into().unwrap();
    print_array(&arr7);
    



    println!("\n\n5: Array Slices: ");
    let slice = &arr1[1..4]; // 1 to 3

    println!("slice: {:?}", slice);
    println!("type of slice: {}", type_of(&slice));

    let slice2 = &arr1[1..];
    println!("slice2: {:?}", slice2);
    println!("type of slice2: {}", type_of(&slice2));
    // step slicing is not supported



    println!("\n\n6: Allowed Operations: ");

    println!("1. Comparisons (==, !=, <, >, <=, >=)");
    let a1 = [1, 2, 3];
    let a2 = [1, 2, 3];
    let a3 = [1, 2, 4];

    println!("a1 == a2: {}", a1 == a2); // true
    println!("a1 != a3: {}", a1 != a3); // true
    println!("a1 < a3: {}", a1 < a3);   // true (lexicographic)
    println!("a3 > a1: {}", a3 > a1);   // true

    println!("\n2. Memory equality using std::ptr::eq");
    println!("std::ptr::eq(&a1, &a2): {}", std::ptr::eq(&a1, &a2)); // false
    let a4 = &a1;
    println!("std::ptr::eq(&a1, a4): {}", std::ptr::eq(&a1, a4));   // true

    println!("\n3. Bitwise operations on elements");
    let x: i32 = 5; // 0101
    let y: i32 = 3; // 0011
    println!("x & y: {}", x & y);  // 1
    println!("x | y: {}", x | y);  // 7
    println!("x ^ y: {}", x ^ y);  // 6
    println!("!x: {}", !x);        // -6 (bitwise NOT)
    println!("x << 1: {}", x << 1); // 10
    println!("x >> 1: {}", x >> 1); // 2

    
    
}
    