//
//  String.swift
//  Chapter03
//
//  Created by 강동영 on 2022/08/17.
//

import Foundation


extension String {
    
    var localized: String
    {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main , value: "", comment: "");
    }
}
