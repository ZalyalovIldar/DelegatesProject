
import UIKit

var subs = [Subscriber]()

let random = Int(arc4random_uniform(50) + 1)
let nibName = "SubsTableViewCell"
let subsNib = UINib(nibName: nibName, bundle: nil)


let  subsCellIdentefier = "subsCellIdentefier"

struct Subscriber {
    var avatar = UIImage()
    var name = ""
    var onlineStatus = UIImage()
    
}

class SubsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 0..<random {
            let subscriber = Subscriber(avatar: UIImage(named: "Image\(arc4random_uniform(4) + 1).png")!, name: getRandomName(), onlineStatus: UIImage(named: "status\(arc4random_uniform(3) + 1).png")!)
            subs.append(subscriber)
            
            tableView.register(subsNib, forCellReuseIdentifier: subsCellIdentefier)
            
            
        }
        
        
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Int(randomNumberForSubs)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: subsCellIdentefier, for: indexPath) as! SubsTableViewCell
        let model = subs[indexPath.row]
        
        cell.prepareCell(with: model)
        
        
        return cell
    }

}
