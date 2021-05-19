//
//  ViewController.swift
//  SegueDataDelivery
//
//  Created by 최원석 on 2021/05/19.
//

import UIKit

class ViewController: UIViewController {

    var dataModel = DataModel()

    @IBOutlet weak var textView: UITextView!

    @IBAction func inputTextViewContents(_ sender: UIButton) {
        dataModel.textViewContents = textView.text

    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // 2. segue를 이용한 데이터 전달
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController = segue.destination as? NextViewController else { return }

        nextViewController.dataModel = self.dataModel
    }
}

