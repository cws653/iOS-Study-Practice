import UIKit

class ViewController: UIViewController {

    var dataModel = DataModel()

    @IBOutlet weak var textView: UITextView!

    @IBAction func inputTextViewContents(_ sender: UIButton) {
        dataModel.textViewContents = textView.text

    }

    // 1. 하이라키를 이용한 데이터 전달
    @IBAction func moveToNextViewController(_ sender: UIButton) {
        guard let nextViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NextViewController") as? NextViewController else { return }

        nextViewController.dataModel = self.dataModel
        navigationController?.pushViewController(nextViewController, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}


