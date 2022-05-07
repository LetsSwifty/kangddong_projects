//
//  MainViewController.swift
//  BookManager
//
//  Created by 강동영 on 2022/05/02.
//

import UIKit

class MainViewController: UITableViewController {

    let model = BookManager.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
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
        return model.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = model.list[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "bookListCell") as? BookTableViewCell else { return UITableViewCell() }
        cell.delegate = self
        
        cell.thumbnailImageView.image = UIImage(named: row.thumbnail!)
        cell.titleLabel.text = row.title
        cell.descLabel.text = row.description
        cell.row = indexPath.row
        
        return cell
    }

}

// MARK: Cell Delegate
extension MainViewController: ToggleBookMark {
    func toggle(row: Int?, isOn: Bool) {
        guard let row = row else { return }
        
        model.list[row].isSelected = isOn     
        
    }
}

