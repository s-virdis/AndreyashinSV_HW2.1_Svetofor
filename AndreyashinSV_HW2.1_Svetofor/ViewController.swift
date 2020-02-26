//
//  ViewController.swift
//  AndreyashinSV_HW2.1_Svetofor
//
//  Created by lastbyte on 24.02.2020.
//  Copyright © 2020 lastbyte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Red:    UIView!
    @IBOutlet weak var Yellow: UIView!
    @IBOutlet weak var Green:  UIView!
    enum STATE {
        case RED
        case Yellow
        case Green
    }

    var CurrentState: STATE = STATE.RED
    var NextState:    STATE?
    @IBOutlet weak var Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Button.setTitle("START", for: .normal)

        Red.layer.cornerRadius    = Red.bounds.size.width / 2
        Yellow.layer.cornerRadius = Yellow.bounds.size.width / 2
        Green.layer.cornerRadius  = Green.bounds.size.width / 2

        deactiveSignal(signal: Red)
        deactiveSignal(signal: Yellow)
        deactiveSignal(signal: Green)

    }


    func activeSignal(signal: UIView){
        signal.alpha = 1
    }
    
    func deactiveSignal(signal: UIView){
        signal.alpha = 0.3
    }
    
    func ChangeSignal() {

        switch CurrentState {
            case STATE.RED:
                deactiveSignal(signal: Green)
                activeSignal(signal: Red)
                CurrentState = STATE.Yellow
            case STATE.Yellow:
                deactiveSignal(signal: Red)
                activeSignal(signal: Yellow)
                CurrentState = STATE.Green
            case STATE.Green:
                deactiveSignal(signal: Yellow)
                activeSignal(signal: Green)
                CurrentState = STATE.RED
        }

    }


    @IBAction func ClickButton(_ sender: UIButton) {
        Button.setTitle("NEXT", for: .normal)
        ChangeSignal()
    }
}
