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
    println!("1. Legal types for subscripts:");
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

    // Sorting.
    let mut sortableArr = [5, 2, 3, 4, 1];
    println!("Before");
    print_array(&sortableArr);
    sortableArr.sort();
    println!("After sorting:");
    print_array(&sortableArr);

    // Equality Comparison.
    let a1 = [1, 2, 3];
    let a2 = [1, 2, 3];
    let a3 = [4, 5, 6];

    println!("a1 == a2: {}", a1 == a2); // true
    println!("a1 == a3: {}", a1 == a3); // false
    println!("a1 != a3: {}", a1 != a3); // true

    // Comperators.
    println!("a1 < a3: {}", a1 < a3); // true
    println!("a1 > a3: {}", a1 > a3); // false
    println!("a1 <= a3: {}", a1 <= a3); // true
    println!("a1 >= a3: {}", a1 >= a3); // false

    // memory equality.
    println!("a1 == a2: {}", &a1 as *const _ == &a2 as *const _); // false
    println!("a1 == a1: {}", &a1 as *const _ == &a1 as *const _); // true
    
}
    