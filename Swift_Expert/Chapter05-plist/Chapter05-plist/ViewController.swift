//
//  ViewController.swift
//  Chapter05-plist
//
//  Created by 강동영 on 2022/09/18.
//

import UIKit

class ViewController: UITableViewController {

    let NAME = "name"
    let GENDER = "gender"
    let MARRIED = "married"
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var married: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    private func setUI() {
        
        let plist = UserDefaults.standard
        
        self.name.text = plist.string(forKey: NAME)
        self.name.sizeToFit()
        self.gender.selectedSegmentIndex = plist.integer(forKey: GENDER)
        self.married.isOn = plist.bool(forKey: MARRIED)
    }
    
    @IBAction func changeGender(_ sender: UISegmentedControl) {
        
        let value = sender.selectedSegmentIndex
        
        let plist = UserDefaults.standard
        plist.set(value, forKey: GENDER)
        print("value = \(value)")
        print("plist = \(plist)")
        plist.synchronize()
        print("plist after = \(plist)")
    }
    
    @IBAction func changeMarried(_ sender: UISwitch) {
        
        let value = sender.isOn
        
        let plist = UserDefaults.standard
        plist.set(value, forKey: MARRIED)
        print("value = \(value)")
        print("plist = \(plist)")
        plist.synchronize()
        print("plist after = \(plist)")
    }
}

extension ViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //return 3
        return super.tableView(tableView, numberOfRowsInSection: section)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return super.numberOfSections(in: tableView)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            let alert = UIAlertController(title: nil, message: "이름을 입력하세요.", preferredStyle: .alert)
            
            // name Label의 텍스트를 placeholder로 설정
            alert.addTextField { $0.text = self.name.text }
            let okAction = UIAlertAction(title: "OK", style: .default) {_ in
                let value = alert.textFields?[0].text
                
                let plist = UserDefaults.standard
                plist.set(value, forKey: self.NAME)
                plist.synchronize()
                self.name.text = value
                self.name.sizeToFit()
            }
            alert.addAction(okAction)
            
            self.present(alert, animated: true)
        }
    }
}

