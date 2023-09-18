//
//  HomeViewController.swift
//  TipForMe
//
//  Created by Văn Khánh Vương on 17/09/2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var todoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    private func naviTodoList() {
        let todoVC = TodoViewController()
        self.navigationController?.pushViewController(todoVC, animated: true)
    }
    
    @IBAction func todolistTapped(_ sender: Any) {
        naviTodoList()
    }
}
