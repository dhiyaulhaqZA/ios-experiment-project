//
//  EPButton.swift
//  ExperimentProject
//
//  Created by Dhiya Ulhaq Zulha Alamsyah on 07/12/20.
//

import UIKit

public class EPButton: BaseButton, ButtonDecorator {
    override func configure() {
        super.configure()
        buttonState.decorator = self
        setStyle(with: buttonState.selectedStyle, state: .normal)
    }
    
    public func setStyleFill(state: UIControl.State) {
        switch state {
        case .disabled:
            backgroundColor = .black40
            setTitleColor(.white, for: .normal)
        case .highlighted:
            if self.state == .selected {
                backgroundColor = .blue40
                setTitleColor(.white, for: .normal)
            } else {
                backgroundColor = .green40
                setTitleColor(.white, for: .normal)
            }
        case .selected:
            backgroundColor = .blue60
            setTitleColor(.white, for: .normal)
        default:
            backgroundColor = .green60
            setTitleColor(.white, for: .normal)
        }
    }
    
    public func setStyleGhost(state: UIControl.State) {
        switch state {
        case .disabled:
            backgroundColor = .black40
            setTitleColor(.black40, for: .normal)
        case .highlighted:
            backgroundColor = .white
            setTitleColor(.green40, for: .normal)
            layer.borderColor = UIColor.green40.cgColor
            layer.masksToBounds = true
            layer.borderWidth = 1.0
        default:
            backgroundColor = .white
            setTitleColor(.green60, for: .normal)
            layer.borderColor = UIColor.green60.cgColor
            layer.masksToBounds = true
            layer.borderWidth = 1.0
        }
    }
    
    public func setStyleNude(state: UIControl.State) {
        switch state {
        case .disabled:
            setTitleColor(.black40, for: .normal)
        case .highlighted:
            setTitleColor(.green40, for: .normal)
        default:
            setTitleColor(.green60, for: .normal)
        }
    }
}
