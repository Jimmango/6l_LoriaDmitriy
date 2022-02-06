import UIKit

var a = 10
var b = 20

var c = "Привет"
var d = "Всем"

func swapTwoValue<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
    print(a, b)
}

swapTwoValue(&a, &b)

swapTwoValue(&c, &d)

struct IntStack {
    var items: [Int] = []
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() {
        items.removeLast()
    }
}

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.

struct Stack<Element: Comparable> {
    var items: [Element] = []
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    
// 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
    
    mutating func sort() -> [Element] {
        return items.sorted {($0 > $1)}
    }
    mutating func filter(item: Element) -> [Element] {
        return items.filter {$0 == item}
    }
    
// 3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
    
    subscript(index: Int) -> Element? {
        return index < items.count ? items[index] : nil
    }
}

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

var stack = Stack<String>()
stack.push("A")
stack.push("B")
stack.push("C")
stack.push("D")

print(stack.sort())
print(stack.filter(item: "C"))
print(stack[3] ?? "Error")

