import numpy as np
def main():
    print(np.__version__)


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
    print(np.random.choice(5, 5))
    print(np.random.permutation(5))
    print(np.random.shuffle(np.arange(5)))
    print(np.random.seed(5))
    a = np.array([1, 2, 3, 4, 5])
    c = np.array([2])*5
    print("Array 1:", a)
    print("Array 2:", c, len(c))



    print("5: Array slicing:")
    b = a[1:4]
    print("begin and end given", b)
    print(type(b))
    b = a[:2]
    print("only end given", b)
    b = a[2:]
    print("only begin given", b)
    b = a[:]
    print("only colon given", b)
    b = a[1:4:2]
    print("Step given", b)
    b = a[::-1]
    print("Negative step given", b)
    arr = [1, 2, 3, 4, 5, 6]
    filtered = [x for x in arr if x % 3 > 1]
    print("Filtered array:", filtered)



    print("\n\n6: Operators provided:")
    a = np.array([1, 2, 3, 4, 5, 6, 7, 8, 9])
    b = np.array([11, 12, 13, 14, 15, 16, 17, 18, 19])
    c = np.array([1, 2, 3, 4, 5, 6, 7, 8, 9])
    print("Array a:", a)
    print("Array b:", b)
    print("Array c:", c)

    print("Equality Checking:")
    print("a == c:", a == c)
    print("a == b:", a == b)

    print("Comparison:")
    print(" a < c:", a < c)
    print(" a < b:", a < b)
    print(" a > c:", a > c)
    print(" a <= c:", a <= c)

    print("Memory equality:")
    print("a is c:", a is c)
    print("a is a:", a is a) 
    d = a
    print("a is d:", a is d)

    print("Adding constant = 10000 to all elements:", a + 10000)

    print("Element-wise operations using a and c arrays:")
    print("a + c:", a + c)       
    print("a - c:", a - c) 
    print("a * c:", a * c)
    print("a / c:", a / c)
    print("a % c:", a % c)
    print("a ** c:", a ** c)
    print("a // c:", a // c)

    print("Bitwise operations using a and c arrays:")
    print("a & c:", a & c)
    print("a | c:", a | c)
    print("a ^ c:", a ^ c)
    print("~a:", ~a) 
    print("a << 2:", a << 2) 
    print("a >> 2:", a >> 2) 

    print("Dot product of a and c:", a @ c) 

    print("Contains check")
    print("2 in a:", 2 in a)
    print("10 in a:", 10 in a)         

    print("Reversing an array (a) ", a[::-1]) 

if __name__ == "__main__":
    main()