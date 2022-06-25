//
//  MainViewController.swift
//  BookManager
//
//  Created by 강동영 on 2022/05/02.
//

import UIKit

class MainViewController: UITableViewController {

    let model = BookModel()
    
    var bookList: [BookSimpleInfo] = []
    var bookMarkList: [BookSimpleInfo] = []
    var status = [Bool]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestBookList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    func requestBookList() {
        model.getBookListURL(query: "클린코드") { dict in
            self.bookList = dict.items
            self.initStatus()
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func initStatus() {
        status = [Bool](repeating: false, count: bookList.count)
        
    }
    
    @IBAction func moveBookMark(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "BookMarkTableVC") as? BookMarkTableVC else { return }
        vc.bookMarkList = bookMarkList
        vc.status = status
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = bookList[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "bookListCell") as? BookTableViewCell else { return UITableViewCell() }
        cell.delegate = self
        cell.setData(item)
        cell.bookMarkButton.isSelected = status[indexPath.row]
        cell.row = indexPath.row
        
        return cell
    }

}

// MARK: Cell Delegate: ToggleBookMark
extension MainViewController: ToggleBookMark {
    func toggle(row: Int?, isOn: Bool) {
        guard let row = row else { return }
        print(row, isOn)
        
        switch status[row] {
        case true:
            print("Exist")
        case false:
            bookMarkList.append(bookList[row])
            status[row] = isOn
        }
        
    }
}

