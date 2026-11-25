//
//  main.swift
//  Persec2026Interview
//
//  Created by night on 25/11/2569 BE.
//

import Foundation

// valid parentheses
// reference: https://derekhskim.medium.com/leetcode-in-swift-valid-parentheses-fc45cd544677
public func question1(_ input: String) -> Bool {
    if input.count % 2 != 0 {
        return false
    }
    
    var stack: [Character] = []
    
    for char in input {
        switch char {
        case "(", "[", "{":
            stack.append(char)
        case ")":
            guard stack.popLast() == "(" else { return false }
        case "]":
            guard stack.popLast() == "[" else { return false }
        case "}":
            guard stack.popLast() == "{" else { return false }
        default:
            return false
        }
    }
    
    return stack.isEmpty
}

public func question2(_ input: [String]) -> [String]  {
    return input.sorted {
        $0.localizedStandardCompare($1) == .orderedAscending
    }
}

// auto complete
public func question3(search: String
                      , items: [String]
                      , maxResult: Int) -> [String] {
    let filterItems = items.filter { $0.localizedCaseInsensitiveContains(search) }
    
    let sortedItems = filterItems.sorted { first, second in
        
        let options: String.CompareOptions = [.anchored, .caseInsensitive]
        let rangeFirst = first.range(of: search, options: options)
        let rangeSecond = second.range(of: search, options: options)
        
        if rangeFirst != rangeSecond {
            return true
        } else {
            return false
        }
    }
    
    let results = Array(sortedItems.prefix(maxResult))
    
    return results
}

// roman
// ai: https://claude.ai/share/d645fe7c-1718-4b1e-8227-424da4f35e25
// reference:
// https://dev.to/harshpdev/swift-program-to-convert-an-integer-to-a-roman-numeral-a-classic-leetcode-problem-integer-to-33l9
// https://medium.com/@AlexanderObregon/solving-the-roman-to-integer-problem-on-leetcode-swift-solutions-walkthrough-6a56dd701aac

enum Roman: String, CaseIterable {
    case M, CM, D, CD, C, XC, L, XL, X, IX, V, IV, I

    var value: Int {
        switch self {
        case .M:  return 1000
        case .CM: return 900
        case .D:  return 500
        case .CD: return 400
        case .C:  return 100
        case .XC: return 90
        case .L:  return 50
        case .XL: return 40
        case .X:  return 10
        case .IX: return 9
        case .V:  return 5
        case .IV: return 4
        case .I:  return 1
        }
    }
}

public func question4IntToRoman(_ number: Int) -> String {
    var value = number
    var result = ""
    
    for roman  in Roman.allCases {
        while value >= roman.value {
            result += roman.rawValue
            value -= roman.value
        }
    }
    
    return result
}


public func question4RomanToInt(_ romanText: String) -> Int {
    var rest = Substring(romanText)
    var result = 0
    
    for roman in Roman.allCases {
        while rest.hasPrefix(roman.rawValue) {
            result += roman.value
            rest = rest.dropFirst(roman.rawValue.count)
        }
    }
    return result
}

public func question5(_ number: Int) -> Int {
    let result = String(number).sorted(by: >)
    return Int(String(result)) ?? number
}

// tribonacci
public func question6(items: [Int], amount: Int) -> [Int] {
    var result = items
    
    while result.count < amount {
        let nextValue = result.suffix(3).reduce(0, +)
        result.append(nextValue)
    }
    
    return result
}
