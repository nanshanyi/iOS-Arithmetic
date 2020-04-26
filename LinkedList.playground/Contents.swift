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
