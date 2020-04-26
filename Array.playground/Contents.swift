
var array = [10,2,6,9,3,5,7,1]

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
// 快速排序
func quickSort( array: inout [Int], left: Int, right: Int){
    if array.isEmpty || left > right {
        return
    }
    
    var i = left
    var j = right
    let key = array[i]
    while i < j {
        while i < j && array[j] >= key {
            j -= 1
        }
        array[i] = array[j]
        while i < j && array[i] <= key {
            i += 1
        }
        array[j] = array[i]
    }
    array[i] = key;
    quickSort(array: &array, left: left, right: i - 1)
    quickSort(array: &array, left: i + 1, right: right)
}

quickSort(array: &array, left: 0, right: array.count - 1)
print(array)

//题目：在一个二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序。请完成一个函数，输入这样的一个二维数组和一个整数，判断数组中是否含有该整数。

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


