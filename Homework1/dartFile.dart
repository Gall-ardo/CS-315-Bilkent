void main(){
  print("1: Legal types for subscripts");
  List<int> arr1 = [1, 2, 3, 4, 5];
  print(arr1[3]);
  // print(arr1[3.0]);    Compile time error
  // print(arr1["1"]);    Compile time error
  // print(arr1[true]);   Compile time error         
  /*double floatIndex = 2.8;
  print(arr1[floatIndex]); // Compile time error */


  print("\n\n2: Range checking in subscripting expressions:");
  // print(arr1[10]); // Runtime error 
  // print(arr1[-1]); // Runtime error
  int index = 4324;
  // print(arr1[index]); 


  print("\n\n3: Ragged multidimensional arrays:");
  List<List<int>> ragged = [
    [1, 2, 3],
    [4, 5],
    [6, 7, 8, 9]
  ];

  print(ragged);
  print(ragged is List<List<int>>);
  print(ragged[0] is List<int>);       


  print("\n\n4: Initialization of arrays:");
  
  var init1 = [1, "ataturk", 3, true];
  print("init1: $init1");
  var init2 = List.filled(5, null, growable: false);
  print("init2: $init2"); 
  var init3 = List<int>.generate(8, (i) => i *  i); 
  print("init3: $init3");
  var init4 = List.of([5]);
  print("init4: $init4");
  const init5 = [1, 2, 3, 4, 5];
  print("init5: $init5");

  print("\n\n5: Array Slice:");
  arr1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  var slice1 = arr1.sublist(2, 5); // (start,end)
  print("slice1 : $slice1"); 
  var slice2 = arr1.sublist(3); // start
  print("slice2 : $slice2");
  // First N elements
  var slice3 = arr1.take(4).toList();
  print("slice3: $slice3");
  // skip first n elements
  var slice4 = arr1.skip(5).toList();
  print("slice4: $slice4");
  // Filtering
  var slice5 = arr1.where((x) => x > 5).toList();
  print("slice5: $slice5");


  print("\n\n6: Allowed operations:");

  var a1 = [1, 2, 3, 4, 5];
  var a2 = [6, 7, 8, 9, 10];
  var a3 = [5, 4, 3, 2, 1];

  // sorting
  a3 = List.of(a3)..sort();
  print("a3 sorted: $a3"); 

  // equality
  print(a1 == a2);  
  print(a1 == a3); 


  // memory equality using identical()
  print(identical(a1, a3)); 
  print(identical(a1, a1)); 

  // array concatenation
  var concat = [...a1, ...a2];
  print("concatinated: $concat"); 

  // adding constant to elements
  var added = a1.map((x) => x + 1).toList();
  print("added: $added");

  // Elementwise arithmetic operations
  var elementwiseAdd = List.generate(a1.length, (i) => a1[i] + a2[i]);
  print("added: $elementwiseAdd");
    
  // cross product dot product can also be done by List.generate

  // sum, min 
  var sum = a1.reduce((a, b) => a + b);
  print("sum: $sum"); 
  var min = a1.reduce((a, b) => a < b ? a : b);
  print("min: $min");

  // transpose is not supported.

  // append
  var appended = [...a1, ...a2];
  print("appended: $appended");

  // insert a2 to 2nd index of a1
  var inserted = [...a1.sublist(0, 2), ...a2, ...a1.sublist(2)];
  print("inserted: $inserted");

  // delete
  var deleted = a1.where((x) => x != 3).toList();
  print("deleted: $deleted");

  // bitwise operations
  var bitwiseAnd = List.generate(a1.length, (i) => a1[i] & a2[i]);
  print("bitwiseAnd: $bitwiseAnd");

}