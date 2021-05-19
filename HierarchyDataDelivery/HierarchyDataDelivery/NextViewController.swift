import UIKit

class NextViewController: UIViewController {

    var dataModel: DataModel?

    @IBOutlet weak var showdataLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()

        showdataLabel.text = dataModel?.textViewContents
    }

}
