
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

