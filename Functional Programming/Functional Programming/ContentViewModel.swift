import UIKit

class ContentViewModel: ObservableObject {
    func onAppear() {
        let arrayNums = [1, 2, 3, 4, 5]
        let sortedNums = arrayNums.sorted(by: thisNumFirst)
        print(sortedNums)

        let nameArray = [Person(name: "Mark"), Person(name: "John"), Person(name: "Zusy")]
        let sorted = nameArray.sorted {
            $0.name < $1.name
        }
        print(sorted)
        determineHigherValue(valueOne: "Yellow", ValueTwo: "Blue")
        foo(first: Person(name: "hello"))
    }

    func foo<T: Comparable>(first: T) {
        print(first)
    }

    let testing = { (name: String) -> String in
        return "hello"
    }

    func determineHigherValue<T: Comparable>(valueOne: T, ValueTwo: T) {
        let higherValue = valueOne > ValueTwo ? valueOne : ValueTwo
        print("\(higherValue) is the higher value")
    }

    func thisNumFirst(num1: Int, num2: Int) -> Bool {
        if num1 % 2 == 0 {
            return true
        } else {
            return false
        }
    }

    func doubleSmallNumber(closure: (String) -> (String)) {
        for item in 1...20 {
            print(item)
        }
    }
}


struct Person: Comparable {
    static func < (lhs: Person, rhs: Person) -> Bool {
        lhs.name > rhs.name
    }

    let name: String
}
