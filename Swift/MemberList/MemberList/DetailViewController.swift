//
//  DetailViewController.swift
//  MemberList
//
//  Created by web_dev on 2022/12/20.
//

import UIKit

final class DetailViewController: UIViewController {
    
    private let detailView = DetailView()
    
    var member: Member?
    
    override func loadView() {
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
        setupButtonAction()
    }
    
    func setupData() {
        detailView.member = member

    }
    
    
    func setupButtonAction() {
        detailView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    
    @objc func saveButtonTapped() {
        print(#function)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
