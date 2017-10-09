import UIKit

class EducationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var whereYouStudiedLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    func prepareCell(with item: Education) {
        whereYouStudiedLabel.text = item.name
        nameLabel.text = item.type
        whereYouStudiedLabel.sizeToFit()
        nameLabel.sizeToFit()
        nameLabel.textColor = UIColor.lightGray
    }
}
