//
//  ViewController.swift
//  ExCheckNumber
//
//  Created by 김종권 on 2023/09/10.
//

import UIKit
import Benchmark

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("123".isNumberByCharacterSet) // true
        print("123.456".isNumberByCharacterSet) // false
        print("123".isNumberByRegularExpression) // true
        print("123.456".isNumberByRegularExpression) // fales
        
        let countOfLoop = 10000000
        
        benchmark("isNumberByCharacterSet") {
            (1...countOfLoop).forEach { _ in
                let value1 = "123".isNumberByCharacterSet
                let value2 = "123.456".isNumberByCharacterSet
            }
        }
        
        benchmark("isNumberByRegularExpression") {
            (1...countOfLoop).forEach { _ in
                let value1 = "123".isNumberByRegularExpression
                let value2 = "123.456".isNumberByRegularExpression
            }
        }
        
        Benchmark.main()
    }
}

extension String {
    var isNumberByCharacterSet: Bool {
        let digitsCharacters = CharacterSet(charactersIn: "0123456789")
        return CharacterSet(charactersIn: self).isSubset(of: digitsCharacters)
    }
    
    var isNumberByRegularExpression: Bool {
        range(
            of: "^[0-9]*$",
            options: .regularExpression
        ) != nil
    }
}
