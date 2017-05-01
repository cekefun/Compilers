class Node:
	data = None
	parent = None
	children = []
	def __init__(self):
		self.data = None
		self.parent = None
		self.children = []

	def toDot(self,freeNumber,file):
		ownNumber = freeNumber
		freeNumber += 1
		for child in self.children:
			file.write(str(freeNumber)+"[label = \""+str(child.data) + "\"];")
			file.write(str(ownNumber) + "--" + str(freeNumber) + ";")
			freeNumber = child.toDot(freeNumber,file)
		return freeNumber

	def addChild(self,child):
		self.children.append(child)


class Tree:
	root = None
	def __init__(self):
		root = None
		
	def toDot(self,filename):
		f = open(filename,'w')
		f.write("graph{")
		f.write("0 [label = \""+str(self.root.data) + "\"];")
		self.root.toDot(0,f)
		f.write("}")
