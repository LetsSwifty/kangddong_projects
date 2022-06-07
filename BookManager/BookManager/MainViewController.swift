//
//  MainViewController.swift
//  BookManager
//
//  Created by 강동영 on 2022/05/02.
//

import UIKit

class MainViewController: UITableViewController {

    let model = BookManager()
    var bookMarkList: [BookInfo] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bookMarkList = model.list
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }
    
    @IBAction func moveBookMark(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "BookMarkTableVC") as? BookMarkTableVC else { return }
        vc.bookMarkList = bookMarkList
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookMarkList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = bookMarkList[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "bookListCell") as? BookTableViewCell else { return UITableViewCell() }
        cell.delegate = self
        
        cell.thumbnailImageView.image = UIImage(named: row.thumbnail!)
        cell.titleLabel.text = row.title
        cell.descLabel.text = row.description
        cell.bookMarkButton.isSelected = row.isSelected!
        cell.row = indexPath.row
        
        return cell
    }

}

// MARK: Cell Delegate: ToggleBookMark
extension MainViewController: ToggleBookMark {
    func toggle(row: Int?, isOn: Bool) {
        guard let row = row else { return }
        
        bookMarkList[row].isSelected = isOn
        
    }
}

