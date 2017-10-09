import UIKit

let sizeNum:CGFloat = 12

let pixString = " фотографий"
let friensString = "друзей"
let subsString = "подписчик"
let groupsString = "групп"
let photoString = "фото"
let videoString = "видео"
let audioString = "аудио"
let giftString = "подарков"
let fileString = "файлов"
let wrapping = "\n"


var wallNibName = "WallTableViewCell"
var wallCellIdentefier = "wallCellIdentefier"

var createNewsIdentefier = "createNewsIdentefier"

var avatar: UIImage = UIImage()
var name: String = ""




let randomNumber = (arc4random_uniform(50) + 1)
let randomNumberForSubs = randomNumber*2+13
let randomNumberForGroups = randomNumber + 11
let randomNumberForPhoto = randomNumber*2
let randomNumberForVideo = randomNumber*4 + 33
let randomNumberForAudio = randomNumber*5 + 19
let randomNumberForGift = randomNumber*2 + 5
let randomNumberForFile = randomNumber*2 + 48

let friendsAttributedString = NSAttributedString(string: String(randomNumber) + wrapping + friensString, attributes: [NSAttributedStringKey.foregroundColor: UIColor.black ])
let subsAttributedString = NSAttributedString(string: String(randomNumberForSubs) +  wrapping + subsString, attributes: [NSAttributedStringKey.foregroundColor: UIColor.black ])
let groupsAttributedString = NSAttributedString(string: String(randomNumberForGroups) +  wrapping + groupsString, attributes: [NSAttributedStringKey.foregroundColor: UIColor.black ])
let photoAttributedString = NSAttributedString(string: String(randomNumberForPhoto) +  wrapping + photoString, attributes: [NSAttributedStringKey.foregroundColor: UIColor.black ])
let videoAttributedString = NSAttributedString(string: String(randomNumberForVideo) +  wrapping + videoString, attributes: [NSAttributedStringKey.foregroundColor: UIColor.black ])
let audioAttributedString = NSAttributedString(string: String(randomNumberForAudio) +  wrapping + audioString, attributes: [NSAttributedStringKey.foregroundColor: UIColor.black ])
let giftAttributedString = NSAttributedString(string: String(randomNumberForGift) +  wrapping + giftString, attributes: [NSAttributedStringKey.foregroundColor: UIColor.black ])
let fileAttributedString = NSAttributedString(string: String(randomNumberForFile) + wrapping + fileString, attributes: [NSAttributedStringKey.foregroundColor: UIColor.black ])


func getRandomName() -> String {
    var names: Array = ["Michael Jackson", "Stephen Hawking", "Justin Bieber", "Justin Timberlake", "Азат Алекбаев"]
    
    let length = names.count
    let randomNameNumber = arc4random_uniform(UInt32(length))
    let randomName = names.remove(at: Int(randomNameNumber))
    return randomName
}

func getRandomOnlineOrNotState() -> String {
    var tempArray: Array = ["online (моб.)" , "заходил 8 минут назад", "заходил 1 год назад", "заходил 1 минуту назад"]
    let length = tempArray.count
    let randomStateNumber = arc4random_uniform(UInt32(length))
    let randomState = tempArray.remove(at: Int(randomStateNumber))
    return randomState
}

func getRandomAgeAndCity() -> String {
    var tempArray: Array = ["100 лет, Набережные Челны", "30 лет, Казань", "19 лет, Казань", "10 лет, Днепропетровск"]
    let length = tempArray.count
    let randomStateNumber = arc4random_uniform(UInt32(length))
    let randomState = tempArray.remove(at: Int(randomStateNumber))
    return randomState
}

class ViewController: UIViewController,ActionButtonProtocol,NewsTransferProtocol,UITableViewDataSource,UITableViewDelegate {
    
    var fromMainToInfoIdentefier = "fromMainToInfo"
    
    var user: User!
    
    let wallText1 = "Всем привет, с вами Азат"
    
    let wallText2 = "Не хочу идти в школу"
    
    let wallText3 = "Пошли гулять"
    
    var news:[News] = []
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var myNameLabel: UILabel!
    
    @IBOutlet weak var onlineLabel: UILabel!
    
    @IBOutlet weak var ageCityLabel: UILabel!
    
    @IBOutlet weak var infoButton: UIButton!
    
    
    @IBOutlet weak var friendsButton: UIButton!
    
    @IBOutlet weak var subsButton: UIButton!
    
    @IBOutlet weak var groupsButton: UIButton!
    
    @IBOutlet weak var photoButton: UIButton!
    
    @IBOutlet weak var videoButton: UIButton!
    
    @IBOutlet weak var musicButton: UIButton!
    
    @IBOutlet weak var giftButton: UIButton!
    
    @IBOutlet weak var fileButton: UIButton!
    
    
    @IBOutlet weak var numberOfPhotoLabel: UILabel!
    
    @IBOutlet weak var photoLibraryButton: UIButton!
    
    
    @IBOutlet weak var writingButton: UIButton!
    
    @IBOutlet weak var photoForWallButton: UIButton!
    
    @IBOutlet weak var locationButton: UIButton!
    
    
    @IBOutlet weak var generalImage: UIImageView!

    
    @IBOutlet weak var firstImageInSV: UIImageView!
    
    @IBOutlet weak var secondImageInSV: UIImageView!
    
    @IBOutlet weak var thirdImageInSV: UIImageView!
    
    
    @IBOutlet weak var fourthImageInSV: UIImageView!
    
    
    @IBOutlet weak var scrollViewOnTop: UIScrollView!
    
    @IBOutlet weak var bottomScrollView: UIScrollView!
    
    @IBOutlet weak var mainTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workingWithImages()
        workingWithScrollViews()
        workingWithButtons()
        workingWithLabels()
        registerNib()
        createMainUser()
        createWallNews()
        
    }
    //    MARK: creating wall news
    func createWallNews() {
        let wallNews1 = News(wallText: wallText1, likeNumber: "10", commentNumber: "20", repostNumber: "30", dataString: "18 июл 2017 ")
        let wallNews2 = News(wallText: wallText2, likeNumber: "1", commentNumber: "100", repostNumber: "110", dataString: "2 фев 1998")
        let wallNews3 = News(wallText: wallText3, likeNumber: "", commentNumber: "1000", repostNumber: "1", dataString: "19 сен 2018")
        news.append(wallNews1)
        news.append(wallNews2)
        news.append(wallNews3)
        
    }
    //    MARK: ActionButtonProtocol
    func didPressedExtraButton() {
        let alertController = UIAlertController(title: nil, message: nil , preferredStyle: .actionSheet)
        let editButton = UIAlertAction(title: "Редактировать профиль", style: .default, handler: nil)
        let copyLinkButton = UIAlertAction(title: "Скопировать ссылку", style: .default, handler: nil)
        let shareButton = UIAlertAction(title: "Поделиться...", style: .default, handler: nil)
        let cancelButton = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alertController.addAction(editButton)
        alertController.addAction(copyLinkButton)
        alertController.addAction(shareButton)
        alertController.addAction(cancelButton)
        present(alertController, animated: true, completion: nil)
    }
    func createMainUser() {
        myNameLabel.text = getRandomName()
        onlineLabel.text = getRandomOnlineOrNotState()
        onlineLabel.textColor = UIColor.lightGray
        ageCityLabel.text = getRandomAgeAndCity()
        ageCityLabel.textColor = UIColor.lightGray
        generalImage.image = UIImage(named: "Image\(arc4random_uniform(4) + 1).png")
        generalImage.layer.borderWidth=1.0
        generalImage.layer.masksToBounds = false
        generalImage.layer.borderColor = UIColor.white.cgColor
        generalImage.layer.cornerRadius = generalImage.frame.size.height/2
        generalImage.clipsToBounds = true
    }

    
    func workingWithLabels() {
        numberOfPhotoLabel.text = String(randomNumberForPhoto) + pixString
        numberOfPhotoLabel.textColor = UIColor.lightGray
    }
    
    func workingWithScrollViews() {
        scrollViewOnTop.layer.borderWidth = 0.5
        scrollViewOnTop.layer.borderColor = UIColor.lightGray.cgColor
        
        bottomScrollView.layer.borderWidth = 0.5
        bottomScrollView.layer.borderColor = UIColor.white.cgColor
    }
    func workingWithImages() {
        
        firstImageInSV.image = UIImage(named: "Image\(arc4random_uniform(4) + 1).png")

        secondImageInSV.image = UIImage(named: "Image\(arc4random_uniform(4) + 1).png")

        thirdImageInSV.image = UIImage(named: "Image\(arc4random_uniform(4) + 1).png")

        fourthImageInSV.image = UIImage(named: "Image\(arc4random_uniform(4) + 1).png")
        

    }
    //    MARK: NewsTransfeerProtocol
    func createNews(with someNews: News) {
        news.append(someNews)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        }
    //    MARK:- workingWithButtons function
    func workingWithButtons() {
        
        friendsButton.setAttributedTitle(friendsAttributedString, for: .normal)
        friendsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: sizeNum)
        friendsButton.titleLabel?.textAlignment = NSTextAlignment.center
        
        subsButton.setAttributedTitle(subsAttributedString, for: .normal)
        subsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: sizeNum)
        subsButton.titleLabel?.textAlignment = NSTextAlignment.center
        
        groupsButton.setAttributedTitle(groupsAttributedString, for: .normal)
        groupsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: sizeNum)
        groupsButton.titleLabel?.textAlignment = NSTextAlignment.center
        
        photoButton.setAttributedTitle(photoAttributedString, for: .normal)
        photoButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: sizeNum)
        photoButton.titleLabel?.textAlignment = NSTextAlignment.center
        
        videoButton.setAttributedTitle(videoAttributedString, for: .normal)
        videoButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: sizeNum)
        videoButton.titleLabel?.textAlignment = NSTextAlignment.center
        
        musicButton.setAttributedTitle(audioAttributedString, for: .normal)
        musicButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: sizeNum)
        musicButton.titleLabel?.textAlignment = NSTextAlignment.center
        
        giftButton.setAttributedTitle(giftAttributedString, for: .normal)
        giftButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: sizeNum)
        giftButton.titleLabel?.textAlignment = NSTextAlignment.center
        
        fileButton.setAttributedTitle(fileAttributedString, for: .normal)
        fileButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: sizeNum)
        fileButton.titleLabel?.textAlignment = NSTextAlignment.center
        
    }
    func registerNib() {
        let wallNib = UINib(nibName: wallNibName, bundle: nil)
        mainTableView.register(wallNib, forCellReuseIdentifier: wallCellIdentefier)
    }
    
    // MARK: extra options button action
    @IBAction func extraOptionsButtomPressed(_ sender: Any) {
        didPressedExtraButton()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == fromMainToInfoIdentefier{
        let destinationVC = segue.destination as! InfoTableViewController
        destinationVC.delegate = self
        } else {
            if segue.identifier ==  createNewsIdentefier {
                let wallDestinationVC = segue.destination as! WallViewController
                wallDestinationVC.newsTransferDelegate = self
            }
        }
    }
    
        // MARK:- working with table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: wallCellIdentefier, for: indexPath) as! WallTableViewCell
        avatar = generalImage.image!
        name = myNameLabel.text!
        
        
        let user = User(avatar: avatar , name: name, ageAndeCity: "")
        
        cell.prepareCell(with: news[indexPath.row],and: user)
        return cell
    }
   
}
