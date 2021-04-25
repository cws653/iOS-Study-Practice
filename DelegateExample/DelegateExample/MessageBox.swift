//
//  MessageBoxDelegate.swift
//  DelegateExample
//
//  Created by 최원석 on 2021/04/25.
//

import UIKit

protocol MessageBoxDelegate: class {
    func touchButton()
}

class MessageBox: UIView {

    weak var delegate: MessageBoxDelegate?
    var button: UIButton?

    public override init(frame: CGRect) {
        super.init(frame: frame)

        configure()
    }

    public required init?(coder: NSCoder) {
        super.init(coder:  coder)

        configure()
    }

    func configure() {
        button = UIButton(type:  .system)
        if let button = button {
            button.setTitle("SEND", for: .normal)
            button.sizeToFit()
            button.frame.origin = CGPoint(x: (self.bounds.width - button.bounds.width) * 0.5, y: (self.bounds.height - button.bounds.height) * 0.5)
            button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
            self.addSubview(button)
        }
    }

    @objc func tapButton() {
        delegate?.touchButton()
    }

}
