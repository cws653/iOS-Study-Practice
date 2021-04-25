//
//  ViewController.swift
//  DelegateExample
//
//  Created by 최원석 on 2021/04/25.
//

import UIKit

class ViewController: UIViewController, MessageBoxDelegate {

    var messageBox: MessageBox?

    override func viewDidLoad() {
        super.viewDidLoad()


        messageBox = MessageBox(frame: CGRect(origin: .zero, size: CGSize(width: 300, height: 200)))
        if let messageBox = messageBox {
            messageBox.frame.origin = CGPoint(x: (UIScreen.main.bounds.width - messageBox.bounds.width) * 0.5, y: (UIScreen.main.bounds.height - messageBox.bounds.height) * 0.5)

            messageBox.backgroundColor = .lightGray
            messageBox.delegate = self
            self.view.addSubview(messageBox)
        }
    }

    func touchButton() {
        print("안녕하세요")
    }

}

