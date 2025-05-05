from enum import Enum

def main():
    print("1-What is the form and type of the control expression?")

    # variable
    value = 5
    match value:
        case 1:
            print("Control expression is an integer")
        case "apple":
            print("Control expression is a string")

    # expression
    val1 = 3
    val2 = 4
    match val1 + val2:
        case 7:
            print("Control expression is an integer")
        case "apple":
            print("Control expression is a string")


    # data structure
    match (val1, val2):
        case (1, 2):
            print("Control expression is a tuple")
        case [1, 2]:
            print("Control expression is a list")

    # enum
    class fruit(Enum):
        apple = 1
        banana = 2
    value = fruit.apple
    match value:
        case fruit.apple:
            print("Control expression is an enum")

    class obj:
        def __init__(self,x):
            self.x = x
    l = [1, "apple", (3, 4), [1, 2, 3], {"key": "value"}, range(1, 10), {1, 2, 3}, True, None, obj(3)]

    for val in l:
        print(f"\nTesting value: {val}, type: {type(val)}")
        match val:
            case 1:
                print("Control expression is an integer")
            case "apple":
                print("Control expression is a string")
            case (3, 4):
                print("Control expression is a tuple")
            case [1, 2, 3]:
                print("Control expression is a list")
            case {"key": "value"}:
                print("Control expression is a dictionary")
            case range():
                print("Control expression is a range")
            case True:
                print("Control expression is a boolean")
            case None:
                print("Control expression is None")
    #        case obj(5):
    #            print("Control expression is an object")
            case obj() as o if o.x == 3:
                print("Control expression is an object with x = 3")
            case _:
                print("No match found")





    print("\n\n2-How are the selectable segments specified?")
    value = 5
    match value:
        case 5:
            l.append("Python is love")
            print(l)
            print("Multiple statements in a single case")
        case 10:
            print("Single statement in a case")





    print("\n\n3-Is execution flow through the structure restricted to include just a single selectable segment?")
    value = 6
    match value:
        case 2 | 4 | 6:
            print("Matched even number")
        case 3 | 6 | 9:
            print("Matched divisible by 3")
        case _:
            print("No match")






    print("\n\n4-How are case values specified?")
    value = "hello"
    variable = "variable"
    match value:
        case "hello": # string literal
            print("Matched 'hello'")
        case 32: # integer literal
            print("Matched Isparta")
        case "Mugla" | 48: # different types in a single case
            print("Matched Mugla")
        case (34, 35): # in a data structure
            print("Matched tuple")
        case str() as s if s.isalpha():
            print(f"Matched string: {s}")
        case obj() as o if o.x == 3:
                print("Matched obj with x = 3")
        case _:
            print("No match")





    print("\n\n5-What is done about unrepresented expression values?")
    value = 100
    match value:
        case 10:
            print("Matched 10")
        case _:
            print("No match for the given value")


if __name__ == "__main__":
    main()