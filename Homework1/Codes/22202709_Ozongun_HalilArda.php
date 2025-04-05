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



echo "\n\n3: Ragged multidimensional arrays: ". "\n";
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


echo "\n\n6: Allowed Operations:\n";

$a = array(1, 2, 3);
$b = array(4, 5, 6);
$c = array(1, 2, 3);

echo "a: ";
print_r($a);
echo "b: ";
print_r($b);
echo "c: ";
print_r($c);

echo "\nCompare contents:\n";
echo "a == b: ";
if ($a == $b) {
    echo "true\n";
} else {
    echo "false\n";
}

echo "a == c: ";
if ($a == $c) {
    echo "true\n";
} else {
    echo "false\n";
}

echo "a != c: ";
if ($a != $c) {
    echo "true\n";
} else {
    echo "false\n";
}

echo "a < c: ";
if ($a < $c) {
    echo "true\n";
} else {
    echo "false\n";
}

echo "a <= c: ";
if ($a <= $c) {
    echo "true\n";
} else {
    echo "false\n";
}

echo "\nCompare references (identity):\n";
echo "a === c: ";
if ($a === $c) {
    echo "true\n";
} else {
    echo "false\n";
}

$d = $a;
echo "a === d: ";
if ($a === $d) {
    echo "true\n";
} else {
    echo "false\n";
}

$e = [2 => 3, 0 => 1, 1 => 2];
echo "a == e (same values, different keys): ";
if ($a == $e) {
    echo "true\n";
} else {
    echo "false\n";
}

echo "a === e (different keys/order): ";
if ($a === $e) {
    echo "true\n";
} else {
    echo "false\n";
}

echo "\nConcatenation:\n";
$sameKeyDiffVal = $a + $b;
echo "a + b:\n";
print_r($sameKeyDiffVal);

$d = array(6 => 7, 8 => 9, 10 => 11);
echo "d: ";
print_r($d);

$diffKey = $a + $d;
echo "a + d:\n";
print_r($diffKey);

echo "\nContains:\n";
echo "in_array(2, a): ";
if (in_array(2, $a)) {
    echo "true\n";
} else {
    echo "false\n";
}

echo "in_array(10, a): ";
if (in_array(10, $a)) {
    echo "true\n";
} else {
    echo "false\n";
}

?>
