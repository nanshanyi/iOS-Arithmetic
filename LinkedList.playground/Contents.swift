//MARK: - 链表
class NodeList: Equatable {
    static func == (lhs: NodeList, rhs: NodeList) -> Bool {
        return lhs.value == rhs.value
    }
    
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
//printReverse(nodelist)
//var temp: NodeList? = nodelist
//while temp != nil {
//    print(temp?.value ?? "nil")
//    temp = temp?.next
//}
//
//temp = reverse(node: &nodelist)
//while temp != nil {
//    print(temp?.value ?? "nil")
//    temp = temp?.next
//}
func printNode(_ node: NodeList?){
    var temp = node
    while temp != nil {
        print(temp!.value)
        temp = temp!.next
    }
}

//面试题13：在O（1）时间删除链表结点
func deleteNode(_ nodeHead: inout NodeList?, node: inout NodeList?){
    guard let head = nodeHead , let delNode = node else {
        return
    }
    if delNode.next != nil {
        delNode.value = delNode.next!.value
        delNode.next = delNode.next!.next
    } else if delNode == head {
        nodeHead = nil
    } else {
        var pNode = nodeHead
        while pNode?.next != nil && pNode?.next != delNode {
            pNode = pNode?.next
        }
        pNode?.next = nil
    }
}
var delNode = nodelist?.next

deleteNode(&nodelist, node: &delNode)
printNode(nodelist)


//题目：输入一个链表，输出该链表中倒数第 k 个结点。为了符合大多数人的习惯，本题从1 开始计数，即链表的尾结点是倒数第1 个结点。例如一个链表有6个结点，从头结点开始它们的值依次是1、2、3、4、5、6。这个链表的倒数第3个结点是值为4的结点。
func findKthToTail(_ nodeList: NodeList?, k:Int) -> NodeList? {
    guard nodeList != nil && k > 0 else {
        return nil
    }
    var node = nodeList
    var reNode = nodeList
    var j = 0
    while node?.next != nil {
        node = node?.next
        j += 1
        if j >= k - 1 {
            reNode = reNode?.next
        }
    }
    return reNode
}
/*
相关题目：
1、求链表的中间结点。如果链表中结点总数为奇数，返回中间结点；如果结点总数是偶数，返回中间两个结点的任意一个。为了解决这个问题，我们也可以定义两个指针，同时从链表的头结点出发，一个指针一次走一步，另一个指针一次走两步。当走得快的指针走到链表的末尾时，走得慢的指针正好在链表的中间。
2、判断一个单向链表是否形成了环形结构。和前面的问题一样，定义两个指针，同时从链表的头结点出发，一个指针一次走一步，另一个指针一次走两步。如果走得快的指针追上了走得慢的指针，那么链表就是环形链表；如果走得快的指针走到了链表的末尾（m_pNext指向NULL）都没有追上第一个指针，那么链表就不是环形链表。
举一反三：当我们用一个指针遍历链表不能解决问题的时候，可以尝试用两个指针来遍历链表。可以让其中一个指针遍历的速度快一些（比如一次在链表上走两步），或者让它先在链表上走若干步。
 */

//题目：定义一个函数，输入一个链表的头结点，反转该链表并输出反转后链表的头结点
//递归的方式
func reverse( node: inout NodeList?) -> NodeList? {
    if node == nil || node?.next == nil  {
        return node
    }
    let newHead = reverse(node: &node!.next)
    node?.next?.next = node
    node?.next = nil
    return newHead
}
//非递归
func reversef(node: NodeList?) -> NodeList? {
    guard node != nil && node?.next != nil else {
        return node
    }
    var pre: NodeList? = nil
    var revHead: NodeList? = nil
    var temp = node
    while temp != nil {
        let pNext = temp?.next
        if pNext == nil {
            revHead = temp
        }
        temp?.next = pre
        pre = temp
        temp = pNext
    }
    return revHead
}

var nodelist2: NodeList? = NodeList(1)
nodelist2?.append(2).append(3).append(4).append(5).append(6)
print("==========")
let resu1 = reverse(node: &nodelist2)
printNode(resu1)

//print("\n==========")
//let resu = reversef(node: nodelist2)
//printNode(resu)


//题目：输入两个递增排序的链表，合并这两个链表并使新链表中的结点仍然是按照递增排序的。
func mergeNodeList(lhs: NodeList, rhs: NodeList) -> NodeList {
    var first: NodeList? = lhs.next
    var second: NodeList? = rhs.next
    var result: NodeList? = lhs.value < rhs.value ? lhs : rhs
    let resultHead: NodeList = result!
    
    while first != nil || second != nil {
        if first == nil {
            result?.next = second
            return resultHead
        } else if second == nil{
            result?.next = first
            return resultHead
        }
        if first!.value < second!.value {
            result?.next = first
            first = first?.next
        } else {
            result?.next = second
            second = second?.next
        }
        
        result = result?.next
    }
    return resultHead
}
//递归解法
func mergeNodelist2(lhs: NodeList?, rhs: NodeList?) -> NodeList? {
    if lhs == nil {
        return rhs
    } else if rhs == nil {
        return lhs
    }
    var result: NodeList?
    if lhs!.value < rhs!.value {
        result = lhs
        result?.next = mergeNodelist2(lhs: lhs?.next, rhs: rhs)
    } else {
        result = rhs
        result?.next = mergeNodelist2(lhs: lhs, rhs: rhs?.next)
    }
    return result
}

var nodelist3: NodeList? = NodeList(1)
nodelist3?.append(3).append(5).append(7)
var nodelist4: NodeList? = NodeList(2)
nodelist4?.append(4).append(6).append(8)

var resultList = mergeNodeList(lhs: nodelist3!, rhs: nodelist4!)
printNode(resultList)
print("=======\n")
var nodelist5: NodeList? = NodeList(1)
nodelist3?.append(3).append(5).append(7)
var nodelist6: NodeList? = NodeList(2)
nodelist4?.append(4).append(6).append(8)
var result222 = mergeNodelist2(lhs: nodelist5, rhs: nodelist6)
printNode(result222)

