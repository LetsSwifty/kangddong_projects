//
//  ViewController.swift
//  Chapter06-DB
//
//  Created by Rx on 2022/09/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var db: OpaquePointer? = nil //SQLite 연결 정보를 담을 객체
        var stmt: OpaquePointer? = nil // 컴파일된 SQL을 담을 객체
        
        let fileMgr = FileManager()
        // 문서 디렉토리의 경우 무조건 첫 번쨰 값이므로, first 사용해도 무관
        let docPathURL = fileMgr.urls(for: .documentDirectory, in: .userDomainMask).first!
        let dbPath = try! docPathURL.appendingPathComponent("db.sqlite").path
        
        if fileMgr.fileExists(atPath: dbPath) == false {
            let dbSource = Bundle.main.path(forResource: "db", ofType: "sqlite")
            try! fileMgr.copyItem(atPath: dbSource!, toPath: dbPath)
        }
        let sql = "CREATE TABLE IF NOT EXISTS sequence (num INTEGER)" // sequence라는 이름의 테이블을 정의해라
        
        // sqlite3 <-> db 연결, db 객체 생성
        if sqlite3_open(dbPath, &db) == SQLITE_OK {
            // SQL 구문 전달 준비, stmt 객체 생성
            if sqlite3_prepare(db, sql, -1, &stmt, nil) == SQLITE_OK {
                if sqlite3_step(stmt) == SQLITE_DONE {
                    print("Create Table Success !")
                }// SQL 구문 객체 -> DB전달
                sqlite3_finalize(stmt) // SQL 구문 객체 삭제, stmt 해제
            } else {
                print("Prepare Statement Fail")
            }
            
            sqlite3_close(db) // DB 연결 종료, db 객체 해제
        } else {
            print("Database Connect Fail")
            return
        }
        
    }


}

