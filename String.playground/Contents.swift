
//MARK: - String
//题目字符串倒序
var reString = "hello my name is lee"
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
    var i = string.endIndex
    var result = ""
    while i > string.startIndex {
        string.formIndex(before: &i)
        result.append(string[i])
    }
    return result
}

let ssss = reString.split(separator: " ").map{invertedString(String($0))}.joined(separator: " ")
print(ssss)
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

//编写一个函数来查找字符串数组中的最长公共前缀。
//
//如果不存在公共前缀，返回空字符串 ""。
//
//示例 1:
//
//输入: ["flower","flow","flight"]
//输出: "fl"
//示例 2:
//
//输入: ["dog","racecar","car"]
//输出: ""
//解释: 输入不存在公共前缀。
//说明:
//
//所有输入只包含小写字母 a-z 。
func longestCommonPrefix(_ strs: [String]) -> String {
    var result = ""
    guard !strs.isEmpty else {
        return result
    }
    for s in strs.first! {
        let temp = result + String(s);
        for i in 1..<strs.count {
            let str = strs[i]
            if !str.hasPrefix(temp) {
                return result
            }
        }
        result.append(s)
    }
    return result
}
var array = ["flower","flow","flight"];
print(longestCommonPrefix(array))

//判断括号配对是否正确

func isValid(_ s: String) -> Bool {
    var result = [Character]()
    for c in s {
        if !result.isEmpty {
            if let p = getPair(result.last), c == p  {
                result.removeLast()
                continue
            }
        }
        result.append(c)
    }
    return result.isEmpty
}

func getPair(_ char: Character?) -> Character? {
    switch char {
    case "(": return ")"
    case "[": return "]"
    case "{": return "}"
    default: return nil
    }
}
