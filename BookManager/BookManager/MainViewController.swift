//
//  MainViewController.swift
//  BookManager
//
//  Created by 강동영 on 2022/05/02.
//

import UIKit

class MainViewController: UITableViewController {

    let bManager = BookManager.shared
    
    private var bookInfoData: (totalCount: Int, books: [BookInfo]) = (0,[])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.tableView.estimatedRowHeight = 90
        //self.tableView.rowHeight = UITableView.automaticDimension
        //loadBookInfo()
        
    }
    
    @IBAction func moveBookMark(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "BookMarkTableVC") as? BookMarkTableVC else { return }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
//    private func loadBookInfo() {
//        guard
//            let jsonData = BookManager.shared.load(),
//            let dictData = try? JSONDecoder().decode(Book.self, from: jsonData)
//        else { return }
//
//        print("결과 \(dictData)")
//    }
//
//    private func updateBookInfo(_ responseData: Book) {
//        guard let data = responseData else { return }
//        bookInfoData.totalCount = data.totalCount
//        bookInfoData.books = data.books
//    }

    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bManager.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = bManager.list[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "bookListCell") as? BookTableViewCell else { return UITableViewCell() }
        
        cell.thumbnailImageView.image = UIImage(named: row.thumbnail!)
        cell.titleLabel?.text = row.title
        cell.descLabel?.text = row.description
        
        return cell
    }

}

