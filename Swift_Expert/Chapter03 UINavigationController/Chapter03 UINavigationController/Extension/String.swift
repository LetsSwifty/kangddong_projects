//
//  String.swift
//  Chapter03 UINavigationController
//
//  Created by 강동영 on 2022/08/20.
//

import Foundation

extension String {
    
    var localized: String
    {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main , value: "", comment: "");
    }
}
