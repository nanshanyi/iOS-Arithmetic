class NodeList {
    var value: Int
    var next: NodeList?
    
    init(_ value: Int) {
        self.value = value
    }
    
    func append(_ value: Int) -> NodeList {
        self.next = NodeList(value)
        return self.next!
    }
    
}

func reverse( node: inout NodeList?) -> NodeList? {
    if node == nil || node?.next == nil  {
        return node
    }
    let newHead = reverse(node: &node!.next)
    node?.next?.next = node
    node?.next = nil
    return newHead
    
}

var nodelist: NodeList? = NodeList(1)
nodelist?.append(2).append(3).append(4).append(5)
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
