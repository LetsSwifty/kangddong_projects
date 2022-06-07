//
//  BookMarkTableVC.swift
//  BookManager
//
//  Created by 강동영 on 2022/05/04.
//

import UIKit

class BookMarkTableVC: UIViewController {

    @IBOutlet weak var bookmarkTable: UITableView!
    
    var bookMarkList: [BookInfo] = []
    
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
        bookMarkList.forEach {
            if $0.isSelected! {
                count += 1
            }
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = bookMarkList[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "bookmarkListCell") as? BookmarkTableViewCell else { return UITableViewCell() }
        cell.delegate = self
        
        cell.thumbnail?.image = UIImage(named: row.thumbnail!)
        cell.title?.text = row.title
        print(row.title)
        cell.desc?.text = row.description
        cell.bookMarkButton.isSelected = row.isSelected!
        cell.row = indexPath.row
        print(indexPath.row)
        
        return cell
    }
}

// MARK: Cell Delegate: ToggleBookMark
extension BookMarkTableVC: ToggleBookMark {
    func toggle(row: Int?, isOn: Bool) {
        guard let row = row else { return }
        
        let alert = UIAlertController(title: "", message: "Are you sure you want to delete it?".localized, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok".localized, style: .default) { (_) in
            self.bookMarkList.remove(at: row)
            self.bookMarkList[row].isSelected = isOn
            self.bookmarkTable.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel".localized, style: .cancel)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true)

    }
}
