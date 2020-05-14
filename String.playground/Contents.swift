
//MARK: - String
//题目字符串倒序
var reString = "invertedString"
extension String {
    mutating func inverted(){
        guard count > 1 else {
            return
        }
        var f = startIndex
        var l = index(before: endIndex)
        
        while f < l {
            swapAt(f,l)
            formIndex(after: &f)
            formIndex(before: &l)
        }
    }
    mutating func swapAt(_ i: Index, _ j: Index) {
        guard i != j else {
            return
        }
    
//        let tmp = self[i]
//        self[i] = self[j]
//        self[j] = tmp
    }
}

func invertedString(_ string: String) -> String{
    guard string.count > 1 else {
        return string
    }
    var i = string.index(before: string.endIndex)
    var result = ""
    while i > string.startIndex {
        result.append(string[i])
        string.formIndex(before: &i)
    }
    return result
}

let result = invertedString(reString)
print(result)

//题目： 判断回文

func judgeString(_ string: String) -> Bool{
    guard string.count > 1 else {
        return true
    }
    var f = string.startIndex
    var l = string.index(before: string.endIndex)
    while f < l {
        if string[f] != string[l] {
            return false
        }
        f = string.index(after: f)
        l = string.index(before: l)
    }
    return true
}

var hhui = judgeString("12345321")
