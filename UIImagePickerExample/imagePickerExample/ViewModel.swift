//
//  ViewModel.swift
//  imagePickerExample
//
//  Created by 강동영 on 2022/08/21.
//
/*
 TODO:
 1. CRUD 시 CollectionView Reload
 MVC -> MVVM
 V+C -> V(C) VM(View Logic BL )
 
 View 구독
 ViewModel 방출
 */
protocol ViewModelAvailable {
    
    var reloadSubject: PublishSubject<Void>  { get set }
    
    var imageList: [(image: UIImage, type: String)] { get set }
    
    func converImageToData(image: UIImage?, type: String)
    func deleteImageList(index: Int)
}

import Foundation
import RxSwift

class ViewModel: ViewModelAvailable {
    
    var reloadSubject: PublishSubject<Void> = .init()
    
    var imageList: [(image: UIImage, type: String)] = [(image: UIImage(systemName: "plus")!, type: "ADD")]
    
    func converImageToData(image: UIImage?, type: String) {
        guard let image = image else { return }
        
        var convertImage: Data? = nil
        
        switch type {
        case "png":
            convertImage = image.pngData()
        case "jpeg":
            convertImage = image.jpegData(compressionQuality: 1)
        default:
            NSLog("Unknown img Type", "%@")
            return
        }
    
        if let imageData = convertImage {
            if imageData.count > 10485760 {
                let resizeImage = image.resizeImage(newWidth: 300)
                
                switch type {
                case "png":
                    convertImage = resizeImage.pngData()
                case "jpeg":
                    convertImage = resizeImage.jpegData(compressionQuality: 1)
                default:
                    NSLog("Unknown img Type", "%@")
                    return
                }
            }
        }
        
        let bcf = ByteCountFormatter()
        bcf.allowedUnits = [.useMB]
        bcf.countStyle = .file
        let string = bcf.string(fromByteCount: Int64(convertImage!.count))
        NSLog("convertImage count = \(string)", "%@")
        
        insertImageList(image: image)
        
        //reloadCollectionViewPublish.onNext(())
        
    }
    

    
    private func insertImageList(image: UIImage) {
        self.imageList.insert((image: image, type: "IMG"), at: imageList.count - 1)
        
        if imageList.count == 4 {
            self.imageList.removeLast()
        }
        reloadSubject.onNext(())
        //imageCollectionView.reloadData()
    }
    
    func deleteImageList(index: Int) {
        
        self.imageList.remove(at: index)
        
        reloadSubject.onNext(())
        
        if imageList.count == 0 {
            self.imageList.append((image: UIImage(systemName: "plus")!, type: "ADD"))
        }
    }
}
