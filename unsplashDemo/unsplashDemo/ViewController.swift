//
//  ViewController.swift
//  unsplashDemo
//
//  Created by 강동영 on 2022/05/30.
//
/*
 TODO:
 MVC, 통신, API모델, Resource 별로 나누기
 */
import UIKit

class ViewController: UIViewController {

    let client_id = ""
    @IBOutlet weak var collectionView: UICollectionView!
    
    var response: (totalPages: Int, results: [Result]) = (0, [])
    var isLoadingData: Bool = false
    var pages: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configCollectionView()
        fetchPhotos(query: "sky", pages: pages)
    }


    func configCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: view.frame.size.width/2, height: view.frame.size.width/2)
        collectionView.collectionViewLayout = layout
    }
    
    func fetchPhotos(query: String, pages: Int) {
        let urlString = "https://api.unsplash.com/search/photos?page=\(pages)&per_page=30&query=\(query)&client_id=\(client_id)"
        
        guard let url = URL(string: urlString) else {
            return
        }
        debugPrint(url)
        isLoadingData = true
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let jsonResult = try JSONDecoder().decode(APIResponse.self, from: data)
                DispatchQueue.main.async {
                    self?.processingData(dict: jsonResult)
                    debugPrint(self?.response)
                }
            }
            catch {
                print(error)
            }
            self?.isLoadingData = false
        }
        
        task.resume()
    }
    
    func processingData(dict: APIResponse) {
        
        let isLoadMore = response.results.count > 0
        let newList: [Result] = dict.results
        
        switch isLoadMore {
        case true:
            // 더보기 -> insert
            let startIndex = self.response.results.count
            let endIndex = startIndex + newList.count
            // insert할 Range
            let loadedRange = (startIndex..<endIndex).map {
                IndexPath(row: $0, section: 0)
            }
            response.results.append(contentsOf: newList)
            collectionView.insertItems(at: loadedRange)
            break
        case false:
            response.results = newList
            collectionView?.reloadData()
        }
        
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return response.results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let imageURLString = response.results[indexPath.row].urls.regular
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as? PhotoCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: imageURLString)
        
        return cell
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        //Bottom Refresh
        
        if scrollView == collectionView{
            
            if ((scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height)
            {
                if !isLoadingData{
                    
                    guard response.results.count > 0 else { return }
                    pages += 1
                    
                    self.fetchPhotos(query: "sky", pages: pages)
                }
            }
        }
    }
}

