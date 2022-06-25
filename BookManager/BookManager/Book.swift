//
//  Book.swift
//  BookManager
//
//  Created by 강동영 on 2022/05/04.
//

import Foundation

struct Book: Decodable {
    var lastBuildDate: String
    var total: Int
    var start: Int
    var display: Int
    var items: [BookSimpleInfo]
}

struct BookSimpleInfo: Decodable {
    var title: String
    var link: String
    var image: String
    var author: String
    var price: String
    var discount: String
    var publisher: String
    var pubdate: String
    var isbn: String
    var description: String
}

class BookModel {
    let NaverClientId = ""
    let NaverClientSecret = ""
    
    func getBookListURLComponent(query: String, complete: @escaping (Book)->()) {
        // URLComponents를 생성하여 query 설정
        var urlComponents = URLComponents(string: "https://openapi.naver.com/v1/search/book.json?")
        let keywordQuery = URLQueryItem(name: "query", value: query)
        
        urlComponents?.queryItems?.append(keywordQuery)
        
        guard let requestURL = urlComponents?.url else { return }
        var request = URLRequest(url: requestURL)
        request.httpMethod = "GET"
        
        //Header
        request.setValue(NaverClientId, forHTTPHeaderField: "X-Naver-Client-Id")
        request.setValue(NaverClientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")
        
        debugPrint(requestURL)
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let jsonResult = try JSONDecoder().decode(Book.self, from: data)
                debugPrint(jsonResult)
                complete(jsonResult)
            }
            catch {
                print(error)
            }
        }
        
        task.resume()
    }
    
    func getBookListURL(query: String, complete: @escaping (Book)->()) {
        
        let urlString = "https://openapi.naver.com/v1/search/book.json?query=\(query)"
        let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        guard let url = URL(string: encodedString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        //Header
        request.setValue(NaverClientId, forHTTPHeaderField: "X-Naver-Client-Id")
        request.setValue(NaverClientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")
        
        debugPrint(url)
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let jsonResult = try JSONDecoder().decode(Book.self, from: data)
                debugPrint(jsonResult)
                complete(jsonResult)
            }
            catch {
                print(error)
            }
        }
        
        task.resume()
    }
}
