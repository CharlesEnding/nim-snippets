import json

type
  AccessorId = int
  Scene = object
    nodes: seq[AccessorId]
  
  Node = object
    mesh: AccessorId
  
  Mesh = object
    id: int

  GltfFile = object
    scenes: seq[Scene]
    nodes:  seq[Node]
    meshes: seq[Mesh]

var file: GltfFile = GltfFile()
var root: Scene = Scene()

file.nodes.add Node(mesh: 0)
file.nodes.add Node(mesh: 1)
root.nodes.add 0
root.nodes.add 1
file.scenes.add(root)

file.meshes.add Mesh(id: 0)
file.meshes.add Mesh(id: 1)

echo %*file
