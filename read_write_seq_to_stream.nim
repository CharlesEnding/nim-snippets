import std/streams

type
  Vec3 = array[3, float32]

  # A typical struct you'd find packed in a binary file.
  MyStruct = object
    numVertices: uint32
    vertices: seq[Vec3]

var foo: MyStruct = MyStruct(numVertices: 4, vertices: @[[1'f32, 0, 0], [2'f32, 0, 0], [3'f32, 0, 0], [4'f32, 0, 0]])

# Write
var s = newStringStream("")
s.writeData(foo.numVertices.addr, sizeof(foo.numVertices))
s.writeData(foo.vertices[0].addr, sizeof(Vec3) * foo.vertices.len)

# Read
s.setPosition(0)
var unpacked: MyStruct
unpacked.numVertices = s.readUint32()
unpacked.vertices.setLen(unpacked.numVertices)
discard s.readData(unpacked.vertices[0].addr, unpacked.numVertices.int * sizeof(Vec3))
echo unpacked.vertices

