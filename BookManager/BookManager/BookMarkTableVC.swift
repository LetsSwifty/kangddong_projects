//
//  BookMarkTableVC.swift
//  BookManager
//
//  Created by 강동영 on 2022/05/04.
//

import UIKit

class BookMarkTableVC: UIViewController {

    @IBOutlet weak var bookmarkTable: UITableView!
    
    let bManager = BookManager.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookmarkTable.delegate = self
        bookmarkTable.dataSource = self
        bookmarkTable.reloadData()
    }
}

extension BookMarkTableVC: UITableViewDataSource, UITableViewDelegate {
    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bManager.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = bManager.list[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "bookmarkListCell") as? BookmarkTableViewCell else { return UITableViewCell() }
        
        cell.thumbnail?.image = UIImage(named: row.thumbnail!)
        cell.title?.text = row.title
        cell.desc?.text = row.description
        
        return cell
    }
}
