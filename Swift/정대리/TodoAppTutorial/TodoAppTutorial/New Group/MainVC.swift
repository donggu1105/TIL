//
//  MainVC.swift
//  TodoAppTutorial
//
//  Created by web_dev on 2023/01/12.
//

import UIKit
import SwiftUI

class MainVC: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    var dummyDataList = ["a", "b", "c", "d", "e"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        self.view.backgroundColor = .systemYellow
        
        self.myTableView.register(TodoCell.uinib, forCellReuseIdentifier: TodoCell.reuseIdentifier)
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
    }
}

extension MainVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyDataList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = myTableView.dequeueReusableCell(withIdentifier: TodoCell.reuseIdentifier, for: indexPath) as? TodoCell else {return UITableViewCell()}
        return cell
    }

}
extension MainVC: UITableViewDelegate {}


extension MainVC {
    private struct VCRepresentable: UIViewControllerRepresentable {
        
        let mainVC: MainVC
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return mainVC
        }
    }
    
    func getRepresentable() -> some View {
        VCRepresentable(mainVC: self)
    }
}

extension UIViewController: StoryBoarded {}

protocol StoryBoarded {
    static func instantiate(_ storyboardName: String?) -> Self
}

extension StoryBoarded {
    static func instantiate(_ storyboardName: String? = nil) -> Self {
        
        let name = storyboardName ?? String(describing: self)
        
        let storyboard = UIStoryboard(name: name, bundle: Bundle.main)
        
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! Self
    }

}

protocol Nibbed {
    static var uinib: UINib { get }
}

extension Nibbed {
    static var uinib: UINib {
        return UINib(nibName: String(describing: Self.self), bundle: nil)
    }
}
protocol ReuseIdentifiable {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifiable {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
extension UITableViewCell: Nibbed {}
extension UITableViewCell: ReuseIdentifiable {}

