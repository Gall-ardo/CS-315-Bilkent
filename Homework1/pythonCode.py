import numpy as np
print(np.__version__)

'''
What types are legal for subscripts?
Are subscripting expressions in element references range checked?
Are ragged multidimensional arrays allowed?
Can array objects be initialized?
Are any kind of slices supported?
Which operators are provided?
'''

print("1: Legal types for subscripts:")

npArr1 = np.array([1, 2, 3, 4, 5])
print(npArr1[3])
# 64 bit integer
print(npArr1[np.int64(3)])
#print(npArr1[3.2]) # IndexError
#print(npArr1["2"]) # IndexError
#precNum = 3.3
#print(npArr1[precNum]) # IndexError

print("2: Range checking in subscripting expressions:")
#print(npArr1[5]) # IndexError: index out of bounds
print(npArr1[-1])
#print(npArr1[-6]) # IndexError: index out of bounds


print("3: Ragged multidimensional arrays:")
multiDimArr = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
print(multiDimArr)
#raggedArr = np.array([[1, 2, 3], [4, 5], [7, 8, 9]]) # ValueError: The requested array has an inhomogeneous shape.


print("4: Initialization of array objects:")
print(np.zeros(5))
print(np.ones(5))
print(np.empty(5))
print(np.full(5, 5))
print(np.arange(5))
print(np.linspace(0, 10, 5))
print(np.random.rand(5))
print(np.random.randn(5))
print(np.random.randint(5))
print(np.random.random(5))
print("Random choice from array:")
print(np.random.choice(5, 5))
print(np.random.permutation(5))
print(np.random.shuffle(np.arange(5)))
print(np.random.seed(5))
arr1 = np.array([1, 2, 3, 4, 5])
arr2 = np.array([2])*5
print("Array 1:", arr1)
print("Array 2:", arr2, len(arr2))



print("5: Array slicing:")
arr3 = arr1[1:4]
print("begin and end given", arr3)
print(type(arr3))
arr3 = arr1[:2]
print("only end given", arr3)
arr3 = arr1[2:]
print("only begin given", arr3)
arr3 = arr1[:]
print("only colon given", arr3)
arr3 = arr1[1:4:2]
print("Step given", arr3)
arr3 = arr1[::-1]
print("Negative step given", arr3)
arr = [1, 2, 3, 4, 5, 6]
filtered = [x for x in arr if x % 3 > 1]
print("Filtered array:", filtered)


print("6: Operators provided:")
'''
1- Sorting
2- equality. comparisons.
3- memory equality ===
4- array concatenation 
5- adding a constant to all elements opt.
6- array addition/subtraction/multiplication/division/modulus/exponentiation
7- cross product
9- dot product
10- sum, mean, median, std, var, min, max, argmax
11- transpose, reshape, reverse
12- append, insert, delete
13 - bitwise operators  



'''
arr1 = np.array([1, 2, 3, 4, 5, 6, 7, 8, 9])
arr2 = np.array([1, 2, 3, 4, 5, 6, 7, 8, 9])
arr3 = np.array([11, 12, 13, 14, 15, 16, 17, 18, 19])

# Equality:
print("Equality:", arr1 == arr2)
print("Equality:", arr1 == arr3)

# Comparisons:
print("Less than:", arr1 < arr2)
print("Less than:", arr1 < arr3)
print("Greater than:", arr1 > arr2)
print("Greater than:", arr1 > arr3)
print("Less than or equal to:", arr1 <= arr2)
print("Less than or equal to:", arr1 <= arr3)


# Memory equality:
print("Memory equality:", arr1 is arr1)
print("Memory equality:", arr1 is arr2)

# Array concatenation:
arrConcat = np.concatenate((arr1, arr3))
print("Concatenated array:", arrConcat)

# Adding a constant to all elements:
arrAdd = arr1 + 5
print("Array after adding constant:", arrAdd)

# Array operations:
arrAdd = arr1 + arr2
print("Array addition:", arrAdd)
arrSub = arr1 - arr2
print("Array subtraction:", arrSub)
arrMul = arr1 * arr2
print("Array multiplication:", arrMul)
arrDiv = arr1 / arr2
print("Array division:", arrDiv)
arrMod = arr1 % arr2
print("Array modulus:", arrMod)
arrExp = arr1 ** arr2
print("Array exponentiation:", arrExp)
import numpy as np

print("1: Equality and Comparison")
a1 = np.array([1, 2, 3])
a2 = np.array([1, 2, 3])
a3 = np.array([1, 2, 4])

print("a1 == a2:", a1 == a2)         # [ True  True  True ]
print("a1 != a3:", a1 != a3)         # [False False  True]
print("a1 < a3:", a1 < a3)           # [False False  True]
print("a3 > a1:", a3 > a1)           # [False False  True]

print("a1 is a2:", a1 is a2)         # False (different objects)
a4 = a1
print("a1 is a4:", a1 is a4)         # True

print("\n2: Arithmetic operators")
print("a1 + 1:", a1 + 1)             # [2 3 4]
print("a1 + a3:", a1 + a3)           # [2 4 7]
print("a3 - a1:", a3 - a1)           # [0 0 1]
print("a1 * 2:", a1 * 2)             # [2 4 6]
print("a3 / a1:", a3 / a1)           # [1. 1. 1.333...]
print("a3 % /a1:", a3 % a1)           # [0 0 1]
print("a1 ** 2:", a1 ** 2)           # [1 4 9]

print("\n3: Bitwise operators")
b1 = np.array([1, 2, 3])
b2 = np.array([4, 5, 6])
print("b1 & b2:", b1 & b2)           # [0 0 2]
print("b1 | b2:", b1 | b2)           # [5 7 7]
print("~b1:", ~b1)                   # [-2 -3 -4]
print("b1 << 1:", b1 << 1)           # [2 4 6]
print("b2 >> 1:", b2 >> 1)           # [2 2 3]

print("Dot product a1 · a2:", a1 @ a2)  # 1*1 + 2*2 + 3*3 = 14


print("\n5: Contains check")
print("2 in a1:", 2 in a1)           # True
print("10 in a1:", 10 in a1)         # False

print("Reverse:", a1[::-1])







