//MARK: - 链表
class NodeList {
    var value: Int
    var next: NodeList?
    
    init(_ value: Int) {
        self.value = value
    }
    
    func append(_ value: Int) -> NodeList {
        next = NodeList(value)
        return next!
    }
    
}
//链表逆转
func reverse( node: inout NodeList?) -> NodeList? {
    if node == nil || node?.next == nil  {
        return node
    }
    let newHead = reverse(node: &node!.next)
    node?.next?.next = node
    node?.next = nil
    return newHead
    
}

//输入一个链表的头结点，从尾到头反过来打印出每个结点的值。
func printReverse(_ node: NodeList?) {
    guard node != nil else {
        return
    }
    printReverse(node?.next)
    print("ReversePrint\(node?.value ?? 0)")
}

var nodelist: NodeList? = NodeList(1)
nodelist?.append(2).append(3).append(4).append(5)
printReverse(nodelist)
var temp: NodeList? = nodelist
while temp != nil {
    print(temp?.value ?? "nil")
    temp = temp?.next
}

temp = reverse(node: &nodelist)
while temp != nil {
    print(temp?.value ?? "nil")
    temp = temp?.next
}

//MARK: - 二叉树
class BinaryTreeNode {
    var value: String
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?
    
    init(_ value: String) {
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



let array = [10,2,6,9,3,5,7,1]
//MARK: - 冒泡排序
func bubbleSort(_ array: [Int]) -> [Int]{
    var arr = array
    let len = arr.count
    for i in 0..<len {
        for j in 0..<len-1-i {
            if arr[j] > arr[j+1] {
                let tem = arr[j]
                arr[j] = arr[j+1]
                arr[j+1] = tem
            }
        }
    }
    return arr
}

let bubble = bubbleSort(array)

//MARK: - 选择排序
func selecttionSort(_ array: [Int]) -> [Int] {
    var arr = array
    let len = arr.count
    for i in 0..<len {
        var minIndex = i
        for j in i+1..<len {
            if arr[j] < arr[minIndex] {
                minIndex = j
            }
        }
        let temp = arr[i]
        arr[i] = arr[minIndex]
        arr[minIndex] = temp
    }
    return arr
}

let selection = selecttionSort(array)

//MARK: - 插入排序

func insertSort(_ array: [Int]) -> [Int] {
    var arr = array
    let len = array.count
    for i in 1..<len {
        var preIndex = i - 1
        let current = arr[i]
        while preIndex >= 0 && arr[preIndex] > current {
            arr[preIndex + 1] = arr[preIndex]
            preIndex -= 1
        }
        arr[preIndex + 1] = current
    }
    return arr
    
}

//在一个二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序。请完成一个函数，输入这样的一个二维数组和一个整数，判断数组中是否含有该整数。

func find(_ array:[[Int]], rows: Int, columns: Int, number:Int) -> Bool {
    
    guard !array.isEmpty, rows > 0, columns > 0 else {
        return false
    }
    var row = 0
    var column = columns - 1
    var index = 1
    while row < rows, column >= 0 {
        let current = array[row][column]
        print("looptimes\(index)")
        index+=1
        if current == number {
            return true
        } else if current > number {
            column -= 1
        } else {
            row += 1
        }
    }
    return false
}
let finArray = [[1,2, 8,  9],
                [2,4, 9, 12],
                [4,7,10, 13],
                [6,8,11, 15]];

let isFind = find(finArray, rows: 4, columns: 4, number: 7)
let isFind2 = find(finArray, rows: 4, columns: 4, number: 18)

