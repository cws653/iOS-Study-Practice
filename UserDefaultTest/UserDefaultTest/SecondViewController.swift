//
//  SecondViewController.swift
//  UserDefaultTest
//
//  Created by 최원석 on 2021/03/28.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        textField.addTarget(self, action: #selector(changedTextField), for: .allEditingEvents)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        textField.text = UserDefaults.standard.string(forKey: "textFieldText")
    }

    @objc func changedTextField() {
        UserDefaults.standard.set(textField.text, forKey: "textFieldText")
    }
}
