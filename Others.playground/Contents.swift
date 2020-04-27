//MARK: -  斐波那契数列
//题目：写一个函数，输入n，求斐波那契（Fibonacci）数列的第n项。斐波那契数列的定义如下：
//菜鸡解法， 调用栈指数级增加
//     {       0        n=0
//f(n)={       1        n=1
//     {f(n-1) + f(n-2) n>2
//

func fibonacci1(n: Int) -> Int {
    if n <= 0 {
        return 0
    }

    if n == 1 {
        return 1
    }
    return fibonacci1(n: n - 1) + fibonacci1(n: n - 2)
}
let a = fibonacci1(n: 10)

//高级解法，容易溢出，小心处理
func fibonacci2(n: Int) -> Int{
    if n <= 0 { return 0 }
    if n == 1 { return 1 }
    var fibOne = 1
    var fibTwo = 0
    var fibN = 0
    for _ in 2...n {
        fibN = fibOne + fibTwo
        fibTwo = fibOne
        fibOne = fibN
    }
    return fibN
}
let b = fibonacci2(n: 10)
/*
 相关题目1： 一只青蛙一次可以跳上1 级台阶，也可以跳上2 级。求该青蛙跳上一个n级的台阶总共有多少种跳法。
    把n级台阶时的跳法看成是n的函数，记为f（n）, n>2时 第一次跳1级，后面有f（n-1）种跳法；第一次跳2级，后面有f(n-2)种跳法
 扩展：一只青蛙一次可以跳上 1级台阶，也可以跳上 2级……它也可以跳上 n 级
 f（1）= 1; f（2）= 2；f（3）= 4；f（4）=7  f（n）= 2^n - 1 (此处^表示平方)
 相关题目2：我们可以用 2×1（图2.13 的左边）的小矩形横着或者竖着去覆盖更大的矩形。请问用8个2×1的小矩形无重叠地覆盖一个2×8的大矩形（图2.13的右边），总共有多少种方法？
*/




//MARK: - 二进制，位运算
//题目：请实现一个函数，输入一个整数，输出该数二进制表示中 1 的个数。例如把9表示成二进制是1001，有2位是1。因此如果输入9，该函数输出2。
//一般解法，负数会造成死循环
func numberOf1(n: Int) -> Int {
    var count = 0
    var i = n
    while i > 0 {
        if i & 1 == 1 {
            count += 1
        }
       i = i >> 1
    }
    return count
}
let c = numberOf1(n: 9)
// 二般解法
func number1Count(n: Int) -> Int{
    var count = 0
    var i = 1
    while i > 0 {
        print("i=\(i)  n&i = \(n&i)")
        if (n & i) > 0 {
            count += 1
        }
        i = i << 1
    }
    return count
}
let d = number1Count(n: 19)
let d1 = number1Count(n: 0x80000000)
let d2 = number1Count(n: 0xffffffff)
//高端解法
//把一个整数减去1，再和原整数做与运算，会把该整数最右边一个1变成0。那么一个整数的二进制表示中有多少个1，就可以进行多少次这样的操作
func numberCount(n: Int) -> Int{
    var count = 0
    var i = n
    while i > 0 {
        count += 1
        i = (i - 1) & i
    }
    return count
}

let e = numberCount(n: 19)
let e1 = numberCount(n: 0x80000000)
let e2 = numberCount(n: 0xffffffff)

//●用一条语句判断一个整数是不是2的整数次方。一个整数如果是2的整数次方，那么它的二进制表示中有且只有一位是1，而其他所有位都是0。根据前面的分析，把这个整数减去1之后再和它自己做与运算，这个整数中唯一的1就会变成0。根据前面的分析，把这个整数减去1之后再和它自己做与运算，这个整数中唯一的1就会变成0
func judge(n: Int) -> Bool {
    let i = (n - 1) & n
    return i == 0
}
let f = judge(n: 7)
//● 输入两个整数m和n，计算需要改变m的二进制表示中的多少位才能得到 n。比如 10 的二进制表示为 1010，13 的二进制表示为1101，需要改变1010中的3位才能得到1101。我们可以分为两步解决这个问题：第一步求这两个数的异或，第二步统计异或结果中1的位数。

func judgeMn(m: Int, n: Int) -> Int{
    return numberCount(n: m^n)
}


//题目：实现函数 double Power（double base, int exponent），求 base 的exponent次方。不得使用库函数，同时不需要考虑大数问题。
enum FailError: Error {
    case base0

}

//一般解法

func power(base: Double, exponent: Int) throws -> Double{
    if base == 0.0 && exponent < 0 {
        throw FailError.base0
    }
    
    var temp = 1.0
    let absExp = abs(exponent)
    if exponent == 0 {
        return base == 0 ? 0 : 1
    }
    
    for _ in 1...absExp {
        temp *= base
    }
    
    if exponent > 0 {
        return temp
    } else {
        return 1.0/temp
    }

}
let acccc = 9>>1
//高端解法(只针对UInt 次方)
func power2(base: Double, exponent: UInt) -> Double {
    if exponent == 0 {
        return 1
    }
    if exponent == 1 {
        return base
    }
    var result = power2(base: base, exponent: exponent >> 1)
    result *= result
    if exponent & 1 == 1 {
        result *= base
    }
    return result
}

let ccccc:UInt = 0
let g1 = try? power(base: 0, exponent: 0)
let g2 = try? power(base: 10, exponent: 0)
let g3 = try? power(base: -2, exponent: 0)
let g4 = try? power(base: 10, exponent: 2)
let g5 = try? power(base: -2, exponent: 2)
let g6 = try? power(base: 3, exponent: -1)
let g7 = try? power(base: -2, exponent: -2)
//let g8 = power2(base: 10, exponent: 2)
let g9 = power2(base: -2, exponent: 10)

//题目：输入数字n，按顺序打印出从1最大的n位十进制数。比如输入3，则打印出1、2、3一直到最大的3位数即999。
//分析n 太大会溢出，考虑使用字符串实现

func printToMaxN(n: Int) {
    var array = [0]
    var index = 0
    var wei = 1
    if array.count > 1 {
        
    }

    
}
