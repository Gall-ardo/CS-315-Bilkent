<?php

echo "1: Legal types for subscripts:\n";

$arr1 = array(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
echo $arr1[3] . "\n";
$index = 3;
echo $arr1[$index] . "\n";
echo $arr1["a"] . "\n"; # Warning: Undefine array key "a"
echo $arr1["3"] . "\n";

echo $arr1[3.8] . "\n"; // Deprecated: Implicit conversion from float 3.8 to int loses precision on line 19
$boolIndex = true;
echo $arr1[$boolIndex] . "\n"; // true => 1
$indArr = array(4);
# echo $arr1[$indArr] . "\n"; // Fatal error: Uncaught TypeError: Cannot access offset of type array on array 
print_r($arr1);



echo "\n\n2: Range checking in element references:\n";
// echo $arr1[10]; // Warning: Undefined offset
// echo $arr1[-1]; // Warning: Undefined offset
$idx = 9;
// echo $arr1[$idx] . "\n"; // Warning: Undefined offset



echo "\n\n 3: Ragged multidimensional arrays: ". "\n";
$ragged = array(
    array(1, 2, 3),
    array(4, 5),
    array(6, 7, 8, 9)
);
print_r($ragged);



echo "\n\n4: Initialization of arrays: \n";

$standartInit = array(1, 3, 2);
$assocInit = array(0 => 1, 2 => 2, 1 => 3);
$shortSyntax = [1, 2, 3, 4, 5];
$defaultInit = array_fill(2, 5, 0); # start from 2. length 5. fill all with 0
$rangeInit = range(7, 5); # 7 to 5
print_r($defaultInit);
print_r($rangeInit);

echo "Arrays are ";
if ($standartInit == $assocInit) {
    echo "equal.\n";
} else {
    echo "not equal.\n";
}



echo "\n\n5: Array Slice: \n";

$slice = array_slice($arr1, 1, 2); // (begin, length)
echo "Slice from index 1, length 2:\n";
print_r($slice);

$slice = array_slice($arr1, 1); // (begin)
echo "Slice from index 1 to end:\n";
print_r($slice);

$slice = array_slice($arr1, 0, 2);
echo "Slice from beginning, length 2:\n";
print_r($slice);

$slice = array_slice($arr1, -4, 2); # start from -4th index, length = 2
echo "Slice from -4:\n";
print_r($slice);



echo "\n\n6: Aloowed Operations: \n";

$a1 = array(1, 2, 3, 4, 5);
$a2 = array(5, 4, 3, 2, 1);
$a3 = array(6, 7, 8, 9, 10);

# sorting
sort($a2);
echo "Sorted Array 2:\n";
print_r($a2);

# equality
if ($a1 == $a2) {
    echo "Arrays are equal.\n";
} else {
    echo "Arrays are not equal.\n";
}

# comparison
if ($a1 < $a3) {
    echo "Array 1 is less than Array 3.\n";
} else {
    echo "Array 1 is not less than Array 3.\n";
}

# Strict comparison: compares values + keys + order
if ($a1 === $a2) {
    echo "Arrays are strictly equal.\n";
} else {
    echo "Arrays are not strictly equal.\n";
}

# concatenation
$a4 = $a1 + $a2;
echo "Concatenation of Array 1 and Array 2:\n";
print_r($a4);
$differentValue = $a3 + $a1;
echo "Concatenation of Array 1 and Array 3:\n";
print_r($differentValue);
$newMap = array(6 => 7, 8 => 9, 10 => 11);
# concat new map to array 1
$a5 = $a1 + $newMap;
echo "Concatenation of Array 1 and new map:\n";
print_r($a5);

$concated = array_merge($a1, $a2);
echo "Concatenation of Array 1 and Array 2 using array_merge:\n";
print_r($concated);

echo "\nSum: " . array_sum($a1) . "\n";
echo "Count: " . count($a1) . "\n";
echo "Max: " . max($a1) . "\n";
echo "Min: " . min($a1) . "\n";

?>
