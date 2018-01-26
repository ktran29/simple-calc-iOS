//
//  ViewController.swift
//  simplecalcios
//
//  Created by Kevin Tran on 1/24/18.
//  Copyright © 2018 Kevin Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var numberString = ""
    var operation = ""
    var count = 0
    var sum = 0
    var storedValue = 0
    var calculated = false
    var operated = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        display.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        let buttonTitle = sender.title(for: .normal)
        
        switch buttonTitle {
        case "0"?, "1"?, "2"?, "3"?, "4"?, "5"?, "6"?, "7"?, "8"?, "9"?:
            if calculated {
                display.text = "0"
                calculated = false
            }
            if display.text! == "0" || operated {
                display.text = buttonTitle!
                operated = false
            } else {
                display.text = display.text! + buttonTitle!
            }
            numberString += buttonTitle!
            
        case "+"?, "-"?, "*"?, "/"?, "%"?:
            storedValue = Int(numberString)!
            numberString = ""
            operation = buttonTitle!
            operated = true
        case "ct"?:
            count += 1
            operation = "ct"
            operated = true
        case "avg"?:
            count += 1
            sum += Int(numberString)!
            operation = "avg"
            operated = true
        case "fact"?:
            var factorial = 1;
            var start = Int(numberString)!
            while start > 0 {
                factorial *= start
                start -= 1
            }
            display.text = String(factorial)
            numberString = ""
            calculated = true
        case "="?:
            let value = calculate(Int(numberString)!)
            display.text = String(value)
            calculated = true
            reset()
        case "."?:
            if !numberString.contains(".") {
                display.text = display.text! + "."
                numberString += "."
            }
            
        case "+/-"?:
            if !numberString.starts(with: "-") {
                numberString = "-" + numberString
                display.text = numberString
            } else {
                let index = numberString.index(numberString.startIndex, offsetBy: 1)
                numberString = String(numberString[index...])
                display.text = numberString
            }
            
        default:
            break
        }
    }
    
    public func calculate(_ newValue: Int) -> Int {
        
        switch operation {
        case "+":
            return storedValue + newValue
        case "-":
            return storedValue - newValue
        case "*":
            return storedValue * newValue
        case "/":
            return storedValue / newValue
        case "%":
            while storedValue >= 0 {
                storedValue -= newValue
            }
            if (storedValue != 0) {
                storedValue += newValue
            }
            return storedValue
        case "avg":
            return count / sum
        case "ct":
            return count
        default:
            return 0
        }
    }
    
    public func reset() -> Void {
        numberString = ""
        operation = ""
        count = 0
        sum = 0
        storedValue = 0
        operated = false
    }

}

