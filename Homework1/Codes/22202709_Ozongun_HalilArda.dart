import 'package:collection/collection.dart';

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
  // print(arr1[index]);  // Runtime error



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

  var a = [1, 2, 3];
  var b = [4, 5, 6];
  var c = [1, 2, 3];
  
  print("a: $a, b: $b, c: $c");

  print("a == c: ${a == c}"); // false, different objects
  print("identical(a, c): ${identical(a, c)}"); // false, different objects

  var d = a; 
  print("a == d: ${a == d}"); // true, same object
  print("identical(a, d): ${identical(a, d)}"); // true, same object

  Function eq = const ListEquality().equals;
  print("ListEquality: ${eq(a, c)}"); 

  // concatenation
  var ab = a + b;
  print("Concatenation: $ab");

  var concat = [...a, ...b];
  print("Concatenation: $concat"); 

  // Contains
  print("2 in a: ${a.contains(2)}");
  print("10 in a: ${a.contains(10)}");

}