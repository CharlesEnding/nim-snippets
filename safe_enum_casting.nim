import std/macros

type
  MyEnum = enum me1, me2, me3, meEnd=255
  MaybeMyEnum = distinct uint8

macro enumElementsAsSet(enm: typed): untyped = result = newNimNode(nnkCurly).add(enm.getType[1][1..^1])
const MyEnums = enumElementsAsSet(MyEnum)

var parsedFromBinary: MaybeMyEnum = 8.MaybeMyEnum
if parsedFromBinary.MyEnum in MyEnums: # This will not trigger a range defect.
  echo "Success. Do something."
else:
  echo "Failure. Do something else."
