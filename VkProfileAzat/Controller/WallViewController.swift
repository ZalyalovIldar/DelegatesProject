import UIKit

class WallViewController: UIViewController,UITextViewDelegate {
    
    var newsTransferDelegate: NewsTransferProtocol?
    

    @IBOutlet weak var wallTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wallTextView.delegate = self
    }
    //    MARK: - Done Button Pressed
    @IBAction func doneButtonPressed(_ sender: Any) {
        guard let generalText = wallTextView.text else {return}
        let news = News(wallText: generalText, likeNumber: "0", commentNumber: "0", repostNumber: "0", dataString: "9 окт 2017")
        newsTransferDelegate?.createNews(with: news)
        navigationController?.popToRootViewController(animated: true)
        }
    
}
