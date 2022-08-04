//
//  ExArray.swift
//  Chapter01
//
//  Created by 강동영 on 2022/08/05.
//

import Foundation


extension Array {
    /// 안전하게 index로 데이터 가져오기
    subscript(safe index: Int) -> Element? {
        return self.indices ~= index ? self[index] : nil
    }
}
