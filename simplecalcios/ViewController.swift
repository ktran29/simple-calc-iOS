//
//  ViewController.swift
//  simplecalcios
//
//  Created by Kevin Tran on 1/24/18.
//  Copyright © 2018 Kevin Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

class Calculator {
    
    public func add(lhs: Int, rhs: Int) -> Int {
        return lhs + rhs
    }
    
    public func add(_ args:[Int]) -> Int {
        let size = args.count - 1
        var sum = 0
        for num in 0...size {
            sum += args[num]
        }
        return sum
    }
    
    public func add(lhs: (Int, Int), rhs: (Int, Int)) -> (Int, Int) {
        return (lhs.0 + rhs.0, lhs.1 + rhs.1)
    }
    
    public func add(lhs: [String: Int], rhs: [String: Int]) -> [String: Int] {
        let x = lhs["x"]! + rhs["x"]!
        let y = lhs["y"]! + rhs["y"]!
        return ["x": x, "y": y]
    }
    
    public func subtract(lhs: Int, rhs: Int) -> Int {
        return lhs - rhs
    }
    
    public func subtract(lhs: (Int, Int), rhs: (Int, Int)) -> (Int, Int) {
        return (lhs.0 - rhs.0, lhs.1 - rhs.1)
    }
    
    public func subtract(lhs: [String: Int], rhs: [String: Int]) -> [String: Int] {
        let x = lhs["x"]! - rhs["x"]!
        let y = lhs["y"]! - rhs["y"]!
        return ["x": x, "y": y]
    }
    
    public func multiply(lhs: Int, rhs: Int) -> Int {
        return lhs * rhs
    }
    
    public func multiply(_ args:[Int]) -> Int {
        let size = args.count - 1
        var sum = 1
        for num in 0...size {
            sum *= args[num]
        }
        return sum
    }
    
    public func divide(lhs: Int, rhs: Int) -> Int {
        return lhs / rhs
    }
    
    public func count(_ args:[Int]) -> Int {
        return args.count
    }
    
    public func avg(_ args:[Int]) -> Int{
        let size = args.count
        var sum = 0
        for num in 0...size - 1 {
            sum += args[num]
        }
        return sum / size
    }
    
    public func mathOp(lhs: Int, rhs: Int, op: (Int, Int) -> Int) -> Int {
        return op(lhs, rhs)
    }
    
    public func mathOp(args:[Int], beg: Int, op: (Int, Int) -> Int) -> Int {
        var sum = beg
        let size = args.count - 1
        for num in 0...size {
            sum = op(sum, args[num])
        }
        return sum
    }
}

