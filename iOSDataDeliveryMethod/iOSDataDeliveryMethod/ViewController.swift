//
//  ViewController.swift
//  iOSDataDeliveryMethod
//
//  Created by 최원석 on 2021/05/17.
//

import UIKit

protocol DeliveryDataProtocol: class {

    func deliveryData(_ data: String)

}

class ViewController: UIViewController, DeliveryDataProtocol {

    var dataModel = DataModel()
    let dataSingletonClass = DataSingleTonClass.shared

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textViewContentsInputButton: UIButton!
    @IBOutlet weak var nextViewButton: UIButton!

    @IBAction func inputTextViewContents(_ sender: UIButton) {
        dataModel.textViewContents = textView.text

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        //        NotificationCenter.default.addObserver(self, selector: #selector(test1(_:)), name: Notification.Name("test"), object: nil)

    }

    // 1. 하이라키를 이용한 데이터 전달
    //    @IBAction func moveToNextViewController(_ sender: UIButton) {
    //        guard let nextViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "NextViewController") as? NextViewController else { return }
    //
    //        nextViewController.dataModel = self.dataModel
    //        navigationController?.pushViewController(nextViewController, animated: true)
    //    }

    // 2. segue를 이용한 데이터 전달
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        guard let nextViewController = segue.destination as? NextViewController else { return }
    //
    //        nextViewController.dataModel = self.dataModel
    //    }

    // 3. 싱글턴패턴
    //    @IBAction func moveToNextViewController(_ sender: UIButton) {
    //        guard let nextViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "NextViewController") as? NextViewController else { return }
    //
    //        dataSingletonClass.textViewContents = self.dataModel.textViewContents
    //        navigationController?.pushViewController(nextViewController, animated: true)
    //    }

    // 4. NotificationCenter
    //    @objc func test1(_ notification: Notification) {
    //
    //        textView.text = notification.userInfo?["data"] as! String
    //    }

    //    5. delegate
    @IBAction func moveToNextViewController(_ sender: UIButton) {
        guard let nextViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "NextViewController") as? NextViewController else { return }

        nextViewController.delegate = self
        navigationController?.pushViewController(nextViewController, animated: true)
    }

    func deliveryData(_ data: String) {
        textView.text = data
    }
}
