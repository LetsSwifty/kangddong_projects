//
//  UserManager.swift
//  Chapter05-plist
//
//  Created by 강동영 on 2022/09/20.
//

import Foundation

class UserManager {
    
    let plist = UserDefaults.standard
    
    
    func setValue() {
        
        plist.set("Rx", forKey: CommonType.NAME)
        plist.set(24, forKey: CommonType.AGE)
        plist.set("남", forKey: CommonType.SEX)
        
        plist.synchronize()
    }
    
    func fetch() {
        
        let name = plist.string(forKey: CommonType.NAME)
        let age = plist.integer(forKey: CommonType.AGE)
        let sex = plist.object(forKey: CommonType.SEX) as? NSString
        
        print("name, age, sex")
        print(name, age, sex)
    }
    
}

class CommonType {
    
    static let WISH: String = "소원"
    static let JOB: String = "직업"
    static let SEX: String = "성별"
    static let ISMARRIED: String = "결혼유무"
    static let NATIONAL: String = "국적"
    static let AGE: String = "나이"
    static let NAME: String = "이름"
}
