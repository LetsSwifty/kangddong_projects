//
//  ExString.swift
//  BookManager
//
//  Created by 강동영 on 2022/05/17.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: Bundle.main, value: "", comment: "")
    }
}
