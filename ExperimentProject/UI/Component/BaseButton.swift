//
//  BaseButton.swift
//  ExperimentProject
//
//  Created by Dhiya Ulhaq Zulha Alamsyah on 07/12/20.
//

import UIKit

open class BaseButton: UIButton {
    var buttonState = ButtonState()
    
    open override var isHighlighted: Bool {
        get {
            return super.isHighlighted
        }
        set {
            if newValue {
                setStyle(with: buttonState.selectedStyle, state: .highlighted)
            } else if !isSelected {
                setStyle(with: buttonState.selectedStyle, state: .normal)
            }
            super.isHighlighted = newValue
        }
    }
    
    open override var isSelected: Bool {
        get {
            return super.isSelected
        }
        set {
            if newValue {
                setStyle(with: buttonState.selectedStyle, state: .selected)
            } else {
                setStyle(with: buttonState.selectedStyle, state: .normal)
            }
            super.isSelected = newValue
        }
    }
    
    open override var isEnabled: Bool {
        get {
            return super.isEnabled
        }
        set {
            if newValue {
                setStyle(with: buttonState.selectedStyle, state: .normal)
            } else {
                setStyle(with: buttonState.selectedStyle, state: .disabled)
            }
            super.isEnabled = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.addTarget(self, action: #selector(onClickListener), for: .touchUpInside)
    }
    
    @objc func onClickListener() {
        buttonState.onClick?()
    }
    
    func setTitle(_ title: String) {
        setTitle(title, for: .normal)
    }
}
extension BaseButton: ButtonBehavior {
    public func setStyle(with style: ButtonStyle, state: UIControl.State) {
        buttonState.selectedStyle = style
        switch style {
        case .fill:
            buttonState.decorator?.setStyleFill(state: state)
        case .ghost:
            buttonState.decorator?.setStyleGhost(state: state)
        case .nude:
            buttonState.decorator?.setStyleNude(state: state)
        }
    }
    
    public func onClick(callback: @escaping (() -> Void)) {
        buttonState.onClick = callback
    }
}

public enum ButtonStyle {
    case fill, ghost, nude
}

public protocol ButtonDecorator {
    func setStyleFill(state: UIControl.State)
    func setStyleGhost(state: UIControl.State)
    func setStyleNude(state: UIControl.State)
}

public protocol ButtonBehavior {
    func onClick(callback: @escaping (() -> Void))
    func setStyle(with style: ButtonStyle, state: UIControl.State)
}

open class ButtonState {
    required public init() {}
    open var onClick: (() -> Void)?
    open var selectedStyle: ButtonStyle = .fill
    open var decorator: ButtonDecorator? = nil
}
