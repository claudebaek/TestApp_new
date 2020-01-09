//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

protocol Shadowy: class { }

extension Shadowy where Self: UITableViewCell {
    
    func shadow() {
        
        contentView.backgroundColor = .white
        contentView.frame =
            contentView.frame.inset(by: UIEdgeInsets(top: 1, left: 16, bottom: 8, right: 16))
        
        //shadow
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.3
        contentView.layer.shadowRadius = 2.0
        contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        contentView.layer.masksToBounds = false
    }
}

class MyViewController : UIViewController {
    override func loadView() {
        
        let tv = UITableView.init(frame: CGRect(x: 150, y: 200, width: 200, height: 20))
        self.view = tv
        tv.delegate = self
        tv.dataSource = self
        
        tv.separatorStyle = .none
    }
}


class DetailTableViewCell: UITableViewCell, Shadowy {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        shadow()
    }
}



extension MyViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = DetailTableViewCell.init(frame: CGRect.init(x: 0, y: 0, width: 200, height: 100))
        let label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 50))
        label.text = "test"
        cell.contentView.addSubview(label)
    
        return cell
    }
}







PlaygroundPage.current.liveView = MyViewController()
