//
//  PhotosViewController.swift
//  Homework3-eneskaya
//
//  Created by Enes Kaya on 25.09.2022.
//

import UIKit
import Kingfisher


//Photo view controller
class PhotosViewController: UIViewController{
    
  
    

    @IBOutlet weak var collectionView: UICollectionView!
    private let photoCellViewModel = PhotoViewModel()
    private var imageArr: [PhotoCollectionCellViewModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        photoCellViewModel.photoViewDelegate = self
        photoCellViewModel.didViewLoad()
        
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 40) / 3 , height: (collectionView.frame.height - 40) / 5)
        
    }

}



extension PhotosViewController : PhotosViewModelViewPr {
    func fetchPhoto(_ items: [PhotoCollectionCellViewModel]) {
        self.imageArr = items
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}


extension PhotosViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
        
        cell.imageView.kf.setImage(with: URL(string: imageArr[indexPath.row].image!))
        return cell
    }
    
}




