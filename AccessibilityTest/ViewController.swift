//
//  ViewController.swift
//  AccessibilityTest
//
//  Created by Elina Batyrova on 05.11.2022.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        guard traitCollection.preferredContentSizeCategory != previousTraitCollection?.preferredContentSizeCategory else { return }
        
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let viewModel = LineTableCellViewModel(title: "Общие настройки")
            let cell = tableView.dequeueReusableCell(withIdentifier: "LineTableCell", for: indexPath) as! LineTableCell
            cell.update(model: viewModel)
            return cell
            
        case 1:
            let viewModel = LineTableCellViewModel(title: "Настройки личного кабинета")
            let cell = tableView.dequeueReusableCell(withIdentifier: "LineTableCell", for: indexPath) as! LineTableCell
            cell.update(model: viewModel)
            return cell
            
        case 2:
            let viewModel = LineTableCellViewModel(title: "Пользовательское соглашение")
            let cell = tableView.dequeueReusableCell(withIdentifier: "LineTableCell", for: indexPath) as! LineTableCell
            cell.update(model: viewModel)
            return cell
            
        case 3:
            let viewModel = InformationTableCellViewModel(title: "Запись",
                                                          subtitle: "Окулист",
                                                          dateTitle: "05.11.2022")
            let cell = tableView.dequeueReusableCell(withIdentifier: "InformationTableCell", for: indexPath) as! InformationTableCell
            cell.update(model: viewModel)
            return cell
            
        default:
            break
        }
        
        return UITableViewCell()
    }
}
