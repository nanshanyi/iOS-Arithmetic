//斐波那契数列
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
