
//MARK: - 链表
class NodeList: Equatable {
    static func == (lhs: NodeList, rhs: NodeList) -> Bool {
        return lhs.value == rhs.value && lhs === rhs
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

//双向链表
class ListNode2: Equatable {
    static func == (lhs: ListNode2, rhs: ListNode2) -> Bool {
        return lhs.value == rhs.value && lhs === rhs
    }
    var key: Int?
    var value: Int?
    var pre: ListNode2?
    var next: ListNode2?
    init() {
        
    }
    
    init(_ key:Int, _ value: Int) {
        self.key = key
        self.value = value
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
    //要删除的节点在中间
    if delNode.next != nil {
        delNode.value = delNode.next!.value
        delNode.next = delNode.next!.next
    } else if delNode == head {
        //只有一个节点
        nodeHead = nil
    } else {
        //要删除的节点是尾结
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
func reverse( node: NodeList?) -> NodeList? {
    if node == nil || node?.next == nil  {
        return node
    }
    let newHead = reverse(node: node?.next)
    node?.next?.next = node
    node?.next = nil
    return newHead
}

//链表反转，非递归处理
func reverse2(node: NodeList?) -> NodeList? {
    guard node != nil && node?.next != nil else {
        return node
    }
    var pre:NodeList? = nil
    var cur:NodeList? = node
    while cur != nil {
        let next = cur?.next
        cur?.next = pre
        pre = cur
        cur = next
    }
    return pre
}
var nodelist2: NodeList? = NodeList(1)
nodelist2?.append(2).append(3).append(4).append(5).append(6)
printNode(nodelist2)
print("==========")
//let resu1 = reverse(node: &nodelist2)
let resu2 = reverse2(node: nodelist2)
printNode(resu2)



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

//题目描述：一个链表，奇数位升序偶数位降序，让链表变成升序的。
//比如：1 8 3 6 5 4 7 2 9，最后输出1 2 3 4 5 6 7 8 9。
func sortNodeList(root: NodeList) -> NodeList? {
    guard root.next != nil else {
        return root
    }
    
    let j = root
    let o = root.next
    var curj:NodeList? = j
    var curo:NodeList? = o
    var temp: NodeList? = root.next?.next
    while temp != nil {
        curj?.next = temp
        curj = curj?.next
        curo?.next = temp?.next
        curo = curo?.next
        temp = temp?.next?.next
    }
    curo?.next = nil
    curj?.next = nil
    guard let ro = reverse(node: o) else { return nil }
    return mergeNodeList(lhs: j, rhs: ro)
}

//LRU(Least Recently Used) 淘汰算法
class LRUCache {
    private var cacheDic: Dictionary<Int, ListNode2> = Dictionary<Int, ListNode2>()
    private var nodeHead: ListNode2 = ListNode2()
    private var nodeTail: ListNode2 = ListNode2()
    public var maxCount = 100
    
    init(max: Int) {
        maxCount = max
        nodeHead.next = nodeTail
        nodeTail.pre = nodeHead
    }
    
    func getCache(key: Int) -> Int {
        if cacheDic[key] == nil {
            return -1
        } else {
            let node = cacheDic[key]!
            addCache(key, node.value!)
            return node.value!
        }
    }
    
    func addCache(_ key:Int, _ value: Int) {
        let cnode = cacheDic[key]
        if cnode != nil {
            cnode?.value = value
            moveToHead(cnode!)
        } else {
            let node = ListNode2(key, value)
            if cacheDic.count >= maxCount {
                guard let last = removeLast()  else { return }
                cacheDic.removeValue(forKey: last.key!)
            }
            cacheDic[key] = node
            addToHead(node)
        }
    }
    
    func addToHead(_ node: ListNode2) {
        node.pre = nodeHead
        node.next = nodeHead.next
        nodeHead.next?.pre = node
        nodeHead.next = node
    }
    
    func moveToHead(_ node: ListNode2) {
        removeNode(node)
        addToHead(node)
    }
    
    func removeNode(_ node: ListNode2) {
        node.pre?.next = node.next
        node.next?.pre = node.pre
    }
    func removeLast() -> ListNode2? {
        guard let node = nodeTail.pre else { return nil }
        removeNode(node)
        return node
    }
    
}
/*
 动态规划之买卖股票的最佳时机
 假设把某股票的价格按照时间先后顺序存储在数组中，请问买卖该股票一次可能获得的最大利润是多少？
 示例 1:

 输入: [7,1,5,3,6,4]
 输出: 5
 解释: 在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
      注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格。
 示例 2:

 输入: [7,6,4,3,1]
 输出: 0
 解释: 在这种情况下, 没有交易完成, 所以最大利润为 0。
 */
func maxProfit(_ prices: [Int]) -> Int {
    guard prices.count >= 1 else {
        return 0
    }
    var dp = [[Int]](repeating: [Int](repeating: 0, count: prices.count), count: 2)
    for i in 0..<prices.count {
        if i == 0 {
            dp[i][0] = 0
            dp[i][1] = -prices[0]
            continue
        }
        dp[i][0] = max(dp[i-1][0], dp[i-1][1] + prices[i])
        dp[i][1] = max(dp[i-1][1], -prices[i])
    }
    return dp[prices.count-1][0]
}
//简化
func maxProfit2(_ prices: [Int]) -> Int {
    guard prices.count >= 1 else {
        return 0
    }
    var dpi0 = 0
    var dpi1 = Int.min
    for i in 0..<prices.count {
        dpi0 = max(dpi0, dpi1 + prices[i])
        dpi1 = max(dpi1, -prices[i])
    }
    return dpi0
}
