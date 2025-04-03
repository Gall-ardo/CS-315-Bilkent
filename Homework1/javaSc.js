    console.log("1: Legal types for subscripts: ");
    let arr1 = [1, 2, 3, 4, 5];
    console.log(arr1[3]);
    let id = 3;
    console.log(arr1[id]);
    console.log(arr1["1"]);
    console.log(arr1[1.0]);
    console.log(arr1[[1]]);

    console.log(arr1[true]); 
    console.log(arr1["ataturk"]);


    console.log("\n\n2: Range checking in element references:");
    console.log(arr1[10]);
    console.log(arr1[-1]);


    console.log("\n\n3: Ragged multidimensional arrays:");
    let ragged = [
        [1, 2, 3],
        [4, 5],
        [6, 7, 8, 9]
    ];
    console.log(ragged);
    console.log(Array.isArray(ragged));
    console.log(Array.isArray(ragged[0]));



    console.log("\n\n4: Initialization of arrays:");
    let init1 = [1, 2, 3, "ataturk", true];
    console.log(init1);

    let init2 = Array(5); // one parameter -> 5 length with empty items.
    console.log(init2);

    let init3 = Array(3, 4, 5); // parameters are list 
    console.log(init3);

    let init4 = Array.of(5); // creates [5]
    console.log(init4);

    let init5 = Array.from("ataturk"); // from iterable object
    console.log(init5);

    let init6 = Array.from({ length: 3 }, (_, i) => i + 1); // 
    console.log(init6);

    let init7 = new Uint32Array(5);
    console.log(init7);


    console.log("\n\n5: Array Slice:");
    arr1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    let slice = arr1.slice(1, 3); // (begin, end)
    console.log(slice); 
    let slice2 = arr1.slice(3); // (begin)
    console.log(slice2);
    let slice3 = arr1.slice(-3); // (begin)
    console.log(slice3); 
    let slice4 = arr1.slice(3, -2); // (begin, end)
    console.log(slice4);
    let slice5 = arr1.slice(-3, -1); // (begin, end)
    console.log(slice5);

    // using a filter function
    let filtered = arr1.filter((item) => item > 5);
    console.log("Filtered values (item > 5):", filtered);

    

    console.log("\n\n6: Allowed operators:");
    // JS arrays support: [], length, push, pop, shift, unshift, slice, splice, concat, etc.
    console.log("arr1.length =", arr1.length);
    console.log("arr1 includes 5?", arr1.includes(5));
    console.log("arr1 index of 7:", arr1.indexOf(7));
    console.log("arr1 joined:", arr1.join("-"));
    arr1.push(11);
    console.log("After push(11):", arr1);
    arr1.pop();
    console.log("After pop():", arr1);
