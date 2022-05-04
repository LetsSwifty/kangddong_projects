//
//  MainViewController.swift
//  BookManager
//
//  Created by 강동영 on 2022/05/02.
//

import UIKit

class MainViewController: UITableViewController {

    private var bookInfoData: (totalCount: Int, books: [BookInfo]) = (0,[])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadBookInfo()
        
    }
    
    private func loadBookInfo() {
        guard
            let jsonData = BookManager.shared.load(),
            let dictData = try? JSONDecoder().decode(Book.self, from: jsonData)
        else { return }
        
        print("결과 \(dictData)")
    }
    
    private func updateBookInfo(_ responseData: Book) {
        guard let data = responseData else { return }
        bookInfoData.totalCount = data.totalCount
        bookInfoData.books = data.books
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

}

