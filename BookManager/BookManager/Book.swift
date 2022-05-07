//
//  Book.swift
//  BookManager
//
//  Created by 강동영 on 2022/05/04.
//

import Foundation


class BookInfo {
    var thumbnail: String?
    var title: String?
    var description: String?
}

//struct Book: Decodable {
//    let totalCount: Int?
//    let books: [BookInfo]
//    //var isBookmark: Bool?
//}
//
//struct BookInfo: Decodable {
//    let thumbnail: String?
//    let title: String?
//    let description: String?
//}
//
class BookManager {

    static let shared = BookManager()

    private init () {}
    
    var dataset = [
        ("grammar.jpeg", "꼼꼼한 재은씨 문법편", "꼼꼼한 재은씨가 꼼꼼하게 문법에 대해서 알려주는 책이다."),
        ("basic.jpeg", "꼼꼼한 재은씨 기본편", "꼼꼼한 재은씨가 꼼꼼하게 iOS 개발의 기본에 대해서 알려주는 책이다."),
        ("practice.jpeg", "꼼꼼한 재은씨 실전편", "꼼꼼한 재은씨가 꼼꼼하게 iOS 개발의 실전에 대해서 알려주는 책이다.")
    ]

    lazy var list: [BookInfo] = {
        var datalist = [BookInfo]()
        
        for (thumbnail, title, desc) in self.dataset {
            let bookInfo = BookInfo()
            bookInfo.thumbnail = thumbnail
            bookInfo.title = title
            bookInfo.description = desc
            
            datalist.append(bookInfo)
        }
        return datalist
    }()
    
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
