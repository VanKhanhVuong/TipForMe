//
//  TaskCell.swift
//  TipForMe
//
//  Created by Văn Khánh Vương on 18/09/2023.
//

import UIKit

protocol TaskCellEvents: AnyObject {
    func checkTask(index: IndexPath)
}

class TaskCell: UITableViewCell {
    
    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    
    weak var delegate: TaskCellEvents?
    
    var index: IndexPath = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        self.selectionStyle = .none
        
        iconLabel.layer.cornerRadius = 15
        iconLabel.layer.masksToBounds = true
        iconLabel.textColor = .white
        iconLabel.textAlignment = .center
        checkButton.tintColor = .black
        
    }
    
    func configCell(task: Task) {
        iconLabel.text = task.taskIcon
        iconLabel.backgroundColor = UIColor(named: task.tintColor)
        //        dateLabel.text = task.date.timeIntervalSince1970.description
        
        
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: task.taskTitle)
        let attributeStringDetail: NSMutableAttributedString = NSMutableAttributedString(string: task.taskDetail)
        
        if task.isCompletion {
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
            
            
            attributeStringDetail.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeStringDetail.length))
            
            checkButton.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            
        } else {
            checkButton.setImage(UIImage(systemName: "circle"), for: .normal)
        }
        
        titleLabel.attributedText = attributeString
        detailLabel.attributedText = attributeStringDetail
    }
    
    @IBAction func checkTapped(_ sender: Any) {
        self.delegate?.checkTask(index: self.index)
    }
}
