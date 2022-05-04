//
//  Book.swift
//  BookManager
//
//  Created by 강동영 on 2022/05/04.
//

import Foundation


struct Book: Decodable {
    let totalCount: Int?
    let books: [BookInfo]
    //var isBookmark: Bool?
}

struct BookInfo: Decodable {
    let thumbnail: String?
    let title: String?
    let description: String?
}

class BookManager {
    
    static let shared = BookManager()
    
    func load() -> Data? {
        // 1. 불러올 파일 이름
        let fileNm: String = "BookInfo"
        // 2. 불러올 파일의 확장자명
        let extensionType = "json"
        
        // 3. 파일 위치
        guard let fileLocation = Bundle.main.url(forResource: fileNm, withExtension: extensionType) else { return nil }
        
        
        do {
            // 4. 해당 위치의 파일을 Data로 초기화하기
            let data = try Data(contentsOf: fileLocation)
            return data
        } catch {
            // 5. 잘못된 위치나 불가능한 파일 처리 (오늘은 따로 안하기)
            return nil
        }
    }
}
