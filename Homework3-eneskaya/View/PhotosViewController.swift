//
//  PhotosViewController.swift
//  Homework3-eneskaya
//
//  Created by Enes Kaya on 25.09.2022.
//

import UIKit
import Kingfisher

class PhotosViewController: UIViewController {
    
  
    

    @IBOutlet weak var collectionView: UICollectionView!
    private let photoCellViewModel = PhotoViewModel()
    private var items: [PhotoCollectionCellViewModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        photoCellViewModel.viewDelegate = self
        photoCellViewModel.didViewLoad()
        
    }
}

private extension PhotosViewController {
    
    
    func setupUI() {
        collectionView.dataSource = self
        collectionView.delegate = self
        registerCell()
    }
    func registerCell() {
        collectionView.register(.init(nibName: "AlbumCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AlbumCollectionViewCell")
    }
}


extension PhotosViewController : AlbumViewModelViewProtocol {
    func didCellItemFetch(_ items: [PhotoCollectionCellViewModel]) {
        self.items = items
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}


extension PhotosViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
        
        cell.imageView.kf.setImage(with: URL(string: items[indexPath.row].image!))
        return cell
    }
    
}


extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 40) / 4 , height: (collectionView.frame.height - 40) / 7 )
        
    }

}


