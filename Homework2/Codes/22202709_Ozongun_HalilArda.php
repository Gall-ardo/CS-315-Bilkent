<?php

class Obj {
    public $x;
    public function __construct($x) {
        $this->x = $x;
    }
}

echo "1-What is the form and type of the control expression?";

// variable
$value = 5;
switch ($value) {
    case 1:
        echo "Control expression is an integer\n";
        break;
    case 5:
        echo "Control expression is an integer with value 5\n";
        break;
}

// expression
$val1 = 3;
$val2 = 4;
switch ($val1 + $val2) {
    case 7:
        echo "Control expression is an expression resulting in 7\n";
        break;
}

// literal
switch (10) {
    case 10:
        echo "Control expression is a literal\n";
        break;
    case 20:
        echo "Control expression is a literal with value 20\n";
        break;
}

// string
switch ("hello") {
    case "hi":
        echo "Control expression is a string 'hi'\n";
        break;
    case "hello":
        echo "Control expression is a string 'hello'\n";
        break;
}


// object not supported directly
$obj = new Obj(4);
switch ($obj->x) {
    case 3:
        echo "Object has x = 3\n";
        break;
    case 4:
        echo "Object has x = 4\n";
        break;
}

// PHP doesn't have built-in type switching, but we can use gettype() for similar behavior
$items = [1, "apple", [3, 4], [1, 2, 3], ["key" => 1], true, NULL, new Obj(3)];

foreach ($items as $item) {
    $type = gettype($item);
    echo "Value: ";
    if ($type == "array") {
        echo json_encode($item);
    } elseif ($type == "object") {
        echo "Object";
    } elseif ($type == "NULL") {
        echo "NULL";
    } else {
        echo $item;
    }
    echo ", Type: $type\t\t";
    
    switch ($type) {
        case "integer":
            echo "Control expression is an integer\n";
            break;
        case "string":
            echo "Control expression is a string\n";
            break;
        case "array":
            if (count($item) == 2 && isset($item[0]) && isset($item[1]) && !isset($item[2])) {
                echo "Control expression is an array length 2\n";
            } elseif (isset($item["key"])) {
                echo "Control expression is an associative array\n";
            } else {
                echo "Control expression is a sequential array\n";
            }
            break;
        case "boolean":
            echo "Control expression is a boolean\n";
            break;
        case "NULL":
            echo "Control expression is NULL\n";
            break;
        case "object":
            if ($item instanceof Obj && $item->x == 3) {
                echo "Control expression is an Obj with x = 3\n";
            } else {
                echo "Control expression is an object\n";
            }
            break;
        default:
            echo "No match found\n";
    }
}



echo "\n\n2-How are the selectable segments specified?\n";
$value = 10;
switch ($value) {
    case 5:
        echo "Case 5: Single statement\n";
        break;
    case 10:
        echo "Case 10: First statement\n";
        echo "Case 10: You can have multiple statements in a case block\n";
        break;
}

// Empty case
$value = 3;
switch ($value) {
    case 3:
        // fall through
    case 4:
        echo "This is case 3 or 4.\n";
        break;
    case 5:
        echo "This is case 5 with statement\n";
        break;
}



echo "\n\n3-Is execution flow through the structure restricted to include just a single selectable segment?\n";

$value = 6;
switch ($value) {
    case 2:
    case 4:
    case 6:
        echo "Matched even number\n";
    case 3:
    case 6: 
    case 9:
        echo "Matched current case or fell through from even number case\n";
    default:
        echo "No match\n";
}

$value = 6;
switch ($value) {
    case 2:
    case 4:
    case 6:
        echo "Matched even number\n";
        break;
    case 3:
    case 6: 
    case 9:
        echo "Matched divisible by 3\n";
        break;
    default:
        echo "No match\n";
}


echo "\n\n4-How are case values specified?\n";
$value = 3;
// Literals
switch ($value) {
    case 2:
        echo "Matched 2\n";
        break;
    case 3:
        echo "Matched 3\n";
        break;
}

// Expressions
switch ($value) {
    case 2 + 1:
        echo "Matched 3 (2+1)\n";
        break;
    case 10 - 3:
        echo "Matched 7 (10-3)\n";
        break;
}

// Variables
$m = 2; $n = 3;
switch ($value) {
    case $m:
        echo "Matched m ($m)\n";
        break;
    case $m * $n:
        echo "Matched m * n ($m * $n)\n";
        break;
}

$value = "3";
switch ($value) {
    case 3:
        echo "Matched integer 3 with string '3' due to type coercion\n";
        break;
    case "3":
        echo "Matched string '3'\n";
        break;
}

// conditionals
$value = 6;
function isEven($num) {return $num % 2 == 0;}
switch ($value) {
    case isEven($value):
        echo "Matched condition (isEven(value))\n";
        break;
    case ($value > 4):
        echo "Matched condition (value > 4)\n";
        break;
    default:
        echo "No match\n";
}


echo "\n\n5-What is done about unrepresented expression values?\n";
$value = 100;
// without default
switch ($value) {
    case 10:
        echo "Matched 10\n";
}

// With default
switch ($value) {
    case 10:
        echo "Matched 10\n";
    default:
        echo "No matching, default case executed\n";
}

?>