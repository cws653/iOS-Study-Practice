//
//  NextViewController.swift
//  iOSDataDeliveryMethod
//
//  Created by 최원석 on 2021/05/17.
//

import UIKit



class NextViewController: UIViewController {

    weak var delegate: DeliveryDataProtocol?
    var dataModel: DataModel?
    let dataSingletonClass = DataSingleTonClass.shared

    @IBOutlet weak var showdataLabel: UILabel!

    @IBAction func preButtonAction(_ sender: Any) {
        delegate?.deliveryData("오늘 하루도 힘내세요!!")
        self.navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        //        showdataLabel.text = dataModel?.textViewContents
        //        showdataLabel.text = dataSingletonClass.textViewContents
//        NotificationCenter.default.post(name: Notification.Name("test"), object: nil, userInfo: ["data": "테스트 성공했습니다."])

    }
}
