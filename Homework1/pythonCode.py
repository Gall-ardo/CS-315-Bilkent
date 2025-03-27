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

print("Legal types for subscripts:")

npArr1 = np.array([1, 2, 3, 4, 5])
print(npArr1[3])
# 64 bit integer
print(npArr1[np.int64(3)])
#print(npArr1[3.2])
#print(npArr1["2"])
#precNum = 3.3
#print(npArr1[precNum])


print("Range checking in subscripting expressions:")
#print(npArr1[5])
print(npArr1[-1])
#print(npArr1[-6])



print("Ragged multidimensional arrays:")
multiDimArr = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
#raggedArr = np.array([[1, 2, 3], [4, 5], [7, 8, 9]])


print("Initialization of array objects:")
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
print(np.random.choice(5, 5))
print(np.random.permutation(5))
print(np.random.shuffle(np.arange(5)))
print(np.random.seed(5))
arr1 = np.array([1, 2, 3, 4, 5])
arr2 = np.array([2])*5
print("Array 1:", arr1)
print("Array 2:", arr2, len(arr2))



print("Array slicing:")
arr3 = arr1[1:4]
print("begin and end given", arr3)
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


print("Operators provided:")

