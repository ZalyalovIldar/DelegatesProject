import UIKit

class GiftsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var giftsLabel: UILabel!
    
    func prepareCell(with item: CoreModelOfGifts) {
        giftsLabel.text = String(item.numberOfPresets)
        giftsLabel.sizeToFit()
    }
}
