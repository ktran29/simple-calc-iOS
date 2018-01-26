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
    
    var expressionString = ""
    
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
            display.text = display.text! + buttonTitle!
            expressionString += buttonTitle!
            
        case "+"?:
            break
        case "-"?:
            break
        case "*"?:
            break
        case "/"?:
            break
        case "%"?:
            break
        case "ct"?:
            break
        case "avg"?:
            break
        case "fact"?:
            break
        case "="?:
            break
        default:
            break
        }
    }

}

