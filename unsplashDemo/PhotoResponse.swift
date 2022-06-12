//
//  PhotoResponse.swift
//  unsplashDemo
//
//  Created by 강동영 on 2022/06/05.
//

import Foundation

struct APIResponse: Codable {
    let total: Int
    let total_pages: Int
    let results: [Result]
}

struct Result: Codable {
    let id: String
    let urls: URLS
}

struct URLS: Codable {
    let regular: String
}
