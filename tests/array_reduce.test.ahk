group := tester.newGroup("array_reduce(array, callback, initialValue:='IAMNULL')")

names := ["tom", "jerry", "morty", "rick"]
array := [1,2,3,6,4,5]
array2 := [new Person(names[1], 22)
	, new Person(names[2], 51)
	, new Person(names[3], 15)
	, new Person(names[4], 55)]

group.newTest("Add all values of array"
	, Assert.equal(21, array_reduce(array, func("addition"))))

group.newTest("Find maximum value of array"
	, Assert.equal(6, array_reduce(array, func("maximum"))))

group.newTest("Add all values of array to initial value"
	, Assert.equal(41, array_reduce(array, func("addition"), 20)))

group.newTest("Sum a property of all objects"
	, Assert.equal(143, array_reduce(array2, func("objProp_addition").bind("age"), 0)))

group.newTest("Copy a string property of all objects into an array"
	, Assert.arrayEqual(names, array_reduce(array2, func("objProp_arrayPush").bind("name"), [])))