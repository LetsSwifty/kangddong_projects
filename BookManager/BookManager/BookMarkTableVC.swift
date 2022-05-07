//
//  BookMarkTableVC.swift
//  BookManager
//
//  Created by 강동영 on 2022/05/04.
//

import UIKit

class BookMarkTableVC: UIViewController {

    @IBOutlet weak var bookmarkTable: UITableView!
    
    let model = BookManager.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookmarkTable.delegate = self
        bookmarkTable.dataSource = self
        bookmarkTable.reloadData()
    }
}

// MARK: - Table view data source
extension BookMarkTableVC: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        model.list.forEach {
            if $0.isSelected! {
                count += 1
            }
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = model.list[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "bookmarkListCell") as? BookmarkTableViewCell else { return UITableViewCell() }
        cell.delegate = self
        
        cell.thumbnail?.image = UIImage(named: row.thumbnail!)
        cell.title?.text = row.title
        cell.desc?.text = row.description
        cell.row = indexPath.row
        
        return cell
    }
}

// MARK: Cell Delegate
extension BookMarkTableVC: ToggleBookMark {
    func toggle(row: Int?, isOn: Bool) {
        guard let row = row else { return }
        
        model.list[row].isSelected = isOn
        bookmarkTable.reloadData()
    }
}
