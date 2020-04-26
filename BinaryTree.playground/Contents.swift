//MARK: - 二叉树
class BinaryTreeNode {
    var value: String?
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?
    
    init(_ value: String?) {
        self.value = value
    }
}
let treeArr = ["A", "B", "D", "G", "#", "#", "H", "#", "#", "#", "C", "E", "#", "I", "#", "#", "F"]
var index = 0
func createTree(_ tree: inout BinaryTreeNode?) {
    guard index < treeArr.count else {
        return
    }
    let value = treeArr[index]
    index += 1
    if value == "#" {
        tree = nil
    } else {
        tree = BinaryTreeNode(value)
        createTree(&tree!.left)
        createTree(&tree!.right)
    }
    
}
var tree: BinaryTreeNode? = BinaryTreeNode("0")

 createTree(&tree)
//题目：遍历二叉树
//1、前序
func forceTraverseTree(_ tree: BinaryTreeNode?) {
    guard tree != nil else {
        return
    }
    print("treeTraverse" + (tree?.value ?? ""))
    forceTraverseTree(tree?.left)
    forceTraverseTree(tree?.right)
}
//2、中序
func middleTraverseTree(_ tree: BinaryTreeNode?) {
    guard tree != nil else {
        return
    }
    middleTraverseTree(tree?.left)
    print("treeTraverse" + (tree?.value ?? ""))
    middleTraverseTree(tree?.right)
}
//3、后续
func backTraverseTree(_ tree: BinaryTreeNode?) {
    guard tree != nil else {
        return
    }
    backTraverseTree(tree?.left)
    print("treeTraverse" + (tree?.value ?? ""))
    backTraverseTree(tree?.right)
}
forceTraverseTree(tree)
print("\n")
middleTraverseTree(tree)
print("\n")
backTraverseTree(tree)
//题目：输入某二叉树的前序遍历和中序遍历的结果，请重建出该二叉树。假设输入的前序遍历和中序遍历的结果中都不含重复的数字。例如输入前序遍历序列{1,2,4,7,3,5,6,8}和中序遍历序列{4,7,2,1,5,3,8,6}，则重建出图2.6所示的二叉树并输出它的头结点。二叉树结点的定义如下：
func constuctTree(pre: [String], mid: [String]) -> BinaryTreeNode? {
    let rootValue = pre.first
    let root = BinaryTreeNode(rootValue)
    if pre.first == pre.last {
        if mid.first == mid.last {
            return root
        }
    }
    //中序遍历找到根节点·
    var leftLength = 0
    while leftLength < mid.count && mid[leftLength] != rootValue {
        leftLength += 1
    }
    guard leftLength < mid.count else {
        print("error222222222")
        return nil
    }
    //构建左子树
    if leftLength > 0 {
        root.left = constuctTree(pre: Array(pre[1...leftLength]), mid: Array(mid[0..<leftLength]))
    }
    //构建右子树
    if leftLength < pre.count {
        root.right = constuctTree(pre: Array(pre[(leftLength + 1)..<pre.count]), mid: Array(mid[(leftLength + 1)..<mid.count]))
    }
    return root
}
let pre = ["1","2","4","7","3","5","6","8"]
let mid = ["4","7","2","1","5","3","8","6"]
let tree2 = constuctTree(pre: pre, mid: mid)
print("\n")
print("\n")
forceTraverseTree(tree2)
print("\n")
print("\n")
middleTraverseTree(tree2)
