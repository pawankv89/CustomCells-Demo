# CustomCells-Demo

=========

## CustomCells Demo in Swift 5.

### In this demo show Convert Text File To ArrayList.

------------
Added Some screens here.

![](https://github.com/pawankv89/CustomCells-Demo/blob/master/images/screen_1.png)
![](https://github.com/pawankv89/CustomCells-Demo/blob/master/images/screen_2.png)
![](https://github.com/pawankv89/CustomCells-Demo/blob/master/images/screen_3.png)



## Usage
------------

#### CustomCells Demo

```swift


class MovieCellWitOutXIB: UITableViewCell {

//Identifire
static let identifire: String = "MovieCellWitOutXIB"

var movie : Movie? {
didSet {
titleLabel.text = movie?.name
subtitleLabel.text = movie?.details
wasThisContentHelpfulLabel.text = "Was this content helpful ?"
}
}

private let titleLabel : UILabel = {
let lbl = UILabel()
lbl.textColor = .black
lbl.font = UIFont.boldSystemFont(ofSize: 20)
lbl.textAlignment = .left
lbl.numberOfLines = 0
return lbl
}()

private let subtitleLabel : UILabel = {
let lbl = UILabel()
lbl.textColor = .black
lbl.font = UIFont.systemFont(ofSize: 16)
lbl.textAlignment = .left
lbl.numberOfLines = 0
return lbl
}()

//Was this content helpful ?
private let wasThisContentHelpfulLabel : UILabel = {
let lbl = UILabel()
lbl.textColor = .blue
lbl.font = UIFont.systemFont(ofSize: 16)
lbl.textAlignment = .left
lbl.numberOfLines = 0
return lbl
}()

private let likeButton : UIButton = {
let btn = UIButton(type: .custom)
btn.setImage(#imageLiteral(resourceName: "feedbackLike"), for: .normal)
btn.imageView?.contentMode = .scaleAspectFill
return btn
}()

private let dislikeButton : UIButton = {
let btn = UIButton(type: .custom)
btn.setImage(#imageLiteral(resourceName: "feedbackDisLike"), for: .normal)
btn.imageView?.contentMode = .scaleAspectFill
return btn
}()

override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
super.init(style: style, reuseIdentifier: reuseIdentifier)
addSubview(titleLabel)
addSubview(subtitleLabel)
addSubview(wasThisContentHelpfulLabel)
addSubview(likeButton)
addSubview(dislikeButton)

// Configure the view for the selected state
self.buttonImageViewTintColor(button: likeButton, color: UIColor.blue)
self.buttonImageViewTintColor(button: dislikeButton, color: UIColor.blue)

//Title
titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 15, paddingBottom: 5, paddingRight: 5, width: frame.size.width, height: 0, enableInsets: false)

//Subtitle
subtitleLabel.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 5  , paddingLeft: 15, paddingBottom: 5, paddingRight: 5, width: frame.size.width, height: 0, enableInsets: false)

//Like Button
//likeButton.anchor(top: subtitleLabel.bottomAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5  , paddingLeft: 15, paddingBottom: 5, paddingRight: 45, width: 25, height: 25, enableInsets: false)
//DisLike Button
//dislikeButton.anchor(top: subtitleLabel.bottomAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5  , paddingLeft: 15, paddingBottom: 5, paddingRight: 5, width: 25, height: 25, enableInsets: false)

//Was This Content Help ful Label
wasThisContentHelpfulLabel.anchor(top: subtitleLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 5  , paddingLeft: 15, paddingBottom: 5, paddingRight: 5, width: frame.size.width, height: 0, enableInsets: false)

//Button Stack
let stackView_Button = UIStackView(arrangedSubviews: [likeButton, dislikeButton])
stackView_Button.distribution = .equalSpacing
stackView_Button.axis = .horizontal
stackView_Button.spacing = 10
addSubview(stackView_Button)
stackView_Button.anchor(top: subtitleLabel.bottomAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: 0, height: 0, enableInsets: false)

likeButton.addTarget(self, action: #selector(feedbackLikeButtonTap), for: .touchUpInside)
dislikeButton.addTarget(self, action: #selector(feedbackDisLikeButtonTap), for: .touchUpInside)
}

required init?(coder aDecoder: NSCoder) {
fatalError("init(coder:) has not been implemented")
}

@objc func feedbackLikeButtonTap() {
print("feedbackLikeButtonTap")
}

@objc func feedbackDisLikeButtonTap() {
print("feedbackDisLikeButtonTap")
}

func buttonImageViewTintColor(button: UIButton, color: UIColor) -> Void {

if button.imageView?.image != nil {
let image = button.imageView?.image!.withRenderingMode(.alwaysTemplate)
button.setImage(image, for: .normal)
button.tintColor = color
}
}
}


```


#### CustomCells Demo

```swift

class MovieCell: UITableViewCell {

//Title
@IBOutlet weak var titleLabel: UILabel!
@IBOutlet weak var subtitleLabel: UILabel!

//Button
@IBOutlet weak var likeButton: UIButton!
@IBOutlet weak var dislikeButton: UIButton!

//Identifire
static let identifire: String = "MovieCell"

override func awakeFromNib() {
super.awakeFromNib()
// Initialization code

// Configure the view for the selected state
self.buttonImageViewTintColor(button: likeButton, color: UIColor.blue)
self.buttonImageViewTintColor(button: dislikeButton, color: UIColor.blue)
}

override func setSelected(_ selected: Bool, animated: Bool) {
super.setSelected(selected, animated: animated)

}

func buttonImageViewTintColor(button: UIButton, color: UIColor) -> Void {

if button.imageView?.image != nil {
let image = button.imageView?.image!.withRenderingMode(.alwaysTemplate)
button.setImage(image, for: .normal)
button.tintColor = color
}
}
}

```

#### CustomCells Demo

```swift

class ViewController: UIViewController {

fileprivate let moviesList = MovieDataSource.moviesList()

@IBOutlet weak var tableview: UITableView!

override func viewDidLoad() {
super.viewDidLoad()
// Do any additional setup after loading the view, typically from a nib.

tableview.dataSource = self
tableview.delegate = self
tableview.estimatedRowHeight = 80
tableview.rowHeight = UITableView.automaticDimension

tableview.register(UINib(nibName: MovieCell.identifire, bundle: nil), forCellReuseIdentifier: MovieCell.identifire)

}

// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
// Get the new view controller using segue.destination.
// Pass the selected object to the new view controller.

print("Navigate ViewController:-\(String(describing: segue.identifier))")

}

}


extension ViewController : UITableViewDataSource, UITableViewDelegate {

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
return UITableView.automaticDimension
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
return moviesList.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
let cell = tableview.dequeueReusableCell(withIdentifier: MovieCell.identifire, for: indexPath) as! MovieCell

let movie = moviesList[indexPath.row]
cell.titleLabel.text = movie.name
cell.subtitleLabel.text = movie.details
return cell
}

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

}

}


```

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).

## Change-log

A brief summary of each this release can be found in the [CHANGELOG](CHANGELOG.mdown). 
