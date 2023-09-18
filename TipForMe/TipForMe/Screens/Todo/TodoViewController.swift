//
//  TodoViewController.swift
//  TipForMe
//
//  Created by Văn Khánh Vương on 17/09/2023.
//

import UIKit

class TodoViewController: UIViewController {
    
    @IBOutlet weak var taskTableView: UITableView!
    
    private var taskViewModel = TaskViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }
    
    private func setupUI() { }
    
    private func setupData() {
        taskViewModel.delegate = self
        
        taskTableView.register(cellType: TaskCell.self)
        taskTableView.delegate = self
        taskTableView.dataSource = self
    }
    
    private func naviDetailTask(viewTask: Bool) {
        let detailVC = DetailTaskViewController()
        detailVC.openTask = viewTask
        detailVC.modalPresentationStyle = .custom
        detailVC.transitioningDelegate = self
        self.present(detailVC, animated: true, completion: nil)
    }
    
    private func setupContextMenu(index: IndexPath) -> UIMenu {
        let open = UIAction(
            title: "Open",
            image: UIImage(systemName: "info.circle"),
            identifier: nil,
            discoverabilityTitle: nil,
            state: .off
        ) { _ in
            self.naviDetailTask(viewTask: true)
        }
        
        let edit = UIAction(
            title: "Edit",
            image: UIImage(systemName: "pencil"),
            identifier: nil,
            discoverabilityTitle: nil,
            state: .off
        ) { _ in
            self.naviDetailTask(viewTask: false)
        }
        
        let checkmark = UIAction(
            title: self.taskViewModel.arrTask[index.row].isCompletion ? "Incomplete" : "Complete",
            image: UIImage(systemName: self.taskViewModel.arrTask[index.row].isCompletion ? "circle" : "checkmark.circle"),
            identifier: nil,
            discoverabilityTitle: nil,
            state: .off
        ) { _ in
            self.taskViewModel.checkDone(index: index)
        }
        
        let delete = UIAction(
            title: "Delete",
            image: UIImage(systemName: "trash"),
            identifier: nil,
            discoverabilityTitle: nil,
            state: .off
        ) { _ in
            self.taskViewModel.deleteTask(id: self.taskViewModel.arrTask[index.row].taskId)
        }
        
        return UIMenu(
            title: "",
            image: nil,
            identifier: nil,
            options: UIMenu.Options.displayInline,
            children: [open, checkmark, edit, delete]
        )
    }
}

extension TodoViewController: UITableViewDelegate { }

extension TodoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let config = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            return self.setupContextMenu(index: indexPath)
        }
        return config
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskViewModel.arrTask.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: TaskCell.self, for: indexPath)
        cell.configCell(task: taskViewModel.arrTask[indexPath.row])
        cell.index = indexPath
        cell.delegate = self
        
        return cell
    }
}

extension TodoViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
}

extension TodoViewController: TaskViewModelEvents {
    func reloadListData() {
        self.taskTableView.reloadData()
    }
    
    func reloadOneRow(index: IndexPath) {
        self.taskTableView.reloadRows(at: [index], with: .fade)
    }
}

extension TodoViewController: TaskCellEvents {
    func checkTask(index: IndexPath) {
        self.taskViewModel.checkDone(index: index)
    }
}

