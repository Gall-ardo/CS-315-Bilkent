class OBJ {
  int x;
  OBJ(this.x);
}

void main() {
  print("1 - What is the form and type of the control expression?");

  // variable
  int value = 5;
  switch (value) {
    case 1:
      print("Control expression is an integer");
      break;
    case 5:
      print("Control expression is an integer");
      break;
  }

  // expression
  int val1 = 3;
  int val2 = 4;
  switch (val1 + val2) {
    case 7:
      print("Control expression is an expression resulting in 7");
      break;
    default:
      break;
  }

  // literal
  switch (10) {
    case 10:
      print("Control expression is a literal");
      break;
    case 20:
      print("Control expression is a literal");
      break;
  }

  // string
  String fruit = "apple";
  switch (fruit) {
    case "banana":
      print("Control expression is a string: banana");
      break;
    case "apple":
      print("Control expression is a string: apple");
      break;
    default:
      print("Unknown fruit");
  }
  
  // object
  var obj = OBJ(5);
  switch (obj.x) {
    case 1:
      print("Control expression is an object property: 1");
      break;
    case 5:
      print("Control expression is an object property: 5");
      break;
    default:
      print("Unknown object property value: ${obj.x}");
  }

  // list
  var expList = [1, 2, 3];
  switch (expList) {
    case [1, 2, 3]:
      print("Control expression is a list: $expList");
      break;
    case [4, 5, 6]:
      print("Control expression is a list: $expList");
      break;
    default:
      print("Unknown list: $expList");
  }


  print("\n\n2 - How are the selectable segments specified?");
  value = 12;
  switch (value) {
    case 5:
      print("Case 5: Single statement");
      break;
    case 10:
      print("Case 10: First statement");
      print("Case 10: Second statement");
      break;
    case 12:
    case 15:{
      print("Case 15: First statement");
      print("Case 15: Second statement");
      break;
    }
    default:
      break;
  }


  print("\n\n3 - Is execution flow restricted to just a single selectable segment?");
  var l = [0, 1, 2, 4];
  for (var item in l) {
    print("Switching on item: $item");
    switch (item) {
      case 0:
        break;
      case 1:
      case 2:
        print("case 2");
      case 4:
        print("case 4");
        break;
      case 8:
        print("case 8");
        break;
      default:
        print("Default case");
    }
  }



  print("\n\n4 - How are case values specified?");

  value = 3;
  // literal
  switch (value) {
    case 1:
      print("Matched 1");
    case 2:
      print("Matched 2");
  }

  // Multiple cases
  print("\nMultiple case values:");
  switch (value) {
    case 1:
    case 2:
    case 3:
      print("Matched 1, 2, or 3");
    default:
      print("No match");
  }

  String player = "Barella";
  switch (player) {
    case "Barella":
      print("Player is Barella");
      break;
    case "Hakan":
      print("Player is Hakan");
      break;
    default:
      print("Unknown player");
  }

  int caseValue = 2;
  const int caseValue2 = 3;
  switch (value) {
    /*case caseValue: 
      print("Matched variable case value: $caseValue");
      break;*/ // Error
    case caseValue2:
      print("Matched constant case value: $caseValue2");
      break;
  }

  // object 
  var obj1 = OBJ(2);
  switch (obj1.x) {
    case 1:
      print("Matched object property value: ${obj1.x}");
      break;
    case 2:
      print("Matched object property value: ${obj1.x}");
      break;
    default:
      print("No match for object property value: ${obj1.x}");
  }

  // list
  var list = [1, 2, 3];
  switch (list) {
    case [1, 2, 3]:
      print("Matched list: $list");
      break;
    case [4, 5, 6]:
      print("Matched another list: $list");
      break;
    default:
      print("No match for list: $list");
  }




  print("\n\n5 - What is done about unrepresented expression values?");
  value = 100;
  
  // Without default case
  switch (value) {
    case 10:
      print("Matched 10");
  }
  // With default case
  switch (value) {
    case 10:
      print("Matched 10");
    default:
      print("No match for the given value: $value");
  }
}
