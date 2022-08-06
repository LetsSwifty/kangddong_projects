//
//  MemoListVC.swift
//  Chapter01
//
//  Created by 강동영 on 2022/08/02.
//

import UIKit

class MemoListVC: UITableViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let count = self.appDelegate.memoList.count
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let row = self.appDelegate.memoList[safe:indexPath.row] else { return UITableViewCell() }
        let cellId = row.image == nil ? "memoCell" : "memoCellWithImage"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! MemoCell
        
        cell.subject.text = row.title
        cell.contents.text = row.contents
        
        if let image = row.image {
            cell.imageview.image = image
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        if let registDate = row.regdate {
            cell.regDate.text = formatter.string(from: registDate)

        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let row = self.appDelegate.memoList[safe: indexPath.row] else { return }
        
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MemoReadVC") as? MemoReadVC else { return }
        
        vc.param = row
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

