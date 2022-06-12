//
//  Storage.swift
//  BookManager
//
//  Created by 강동영 on 2022/05/05.
//

import Foundation

public class Storage {
    
    private init() { }
    
    enum Directory {
        case documents
        case cash
        
        var url: URL {
            let path: FileManager.SearchPathDirectory
            switch self {
            case .documents:
                path = .documentDirectory
            case .cash:
                path = .cachesDirectory
            }
            return FileManager.default.urls(for: path, in: .userDomainMask).first!
        }
    }
    
    static func store<T: Encodable>(_ obj: T, to directory: Directory, as fileName: String) {
        let url = directory.url.appendingPathComponent(fileName, isDirectory: false)
        print("---> save to here: \(url)")
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        do {
            let data = try encoder.encode(obj)
            if FileManager.default.fileExists(atPath: url.path) {
                try FileManager.default.removeItem(at: url)
            }
            FileManager.default.createFile(atPath: url.path, contents: data, attributes: nil)
        } catch let error {
            print("---> Failed to store msg: \(error.localizedDescription)")
        }
    }
    
    static func retrive<T: Decodable>(_ fileName: String, from directory: Directory, as type: T.Type) -> T? {
        let url = directory.url.appendingPathComponent(fileName, isDirectory: false)
        guard FileManager.default.fileExists(atPath: url.path) else { return nil }
        guard let data = FileManager.default.contents(atPath: url.path) else { return nil}
        
        let decoder = JSONDecoder()
        
        do {
            let model = try decoder.decode(type, from: data)
            return model
        } catch let error {
            print("---> Failed to decode msg: \(error.localizedDescription)")
            return nil
        }
    }
}
