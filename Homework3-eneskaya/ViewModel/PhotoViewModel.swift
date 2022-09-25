//
//  PhotoViewModel.swift
//  Homework3-eneskaya
//
//  Created by Enes Kaya on 25.09.2022.
//




import Foundation

//View model for photo tab
protocol PhotosViewModelViewPr: AnyObject {
    func fetchPhoto(_ items: [PhotoCollectionCellViewModel])
}

class PhotoViewModel {
    
    
    weak var photoViewDelegate: PhotosViewModelViewPr?
    private let phModel = photoModel()
    
    
    init() {
        phModel.photoDelegate = self
    }
    
    func didViewLoad() {
        phModel.fetchDataFunc()
    }
    
}


private extension PhotoViewModel {
    
    @discardableResult
    func cellViewModel(_ photos: [Photo]) -> [PhotoCollectionCellViewModel] {
        return photos.map { .init(image: $0.url) }
    }
    
}

extension PhotoViewModel: PhotoModelPr {
    
    func getData(_ isSuccess: Bool) {
        if isSuccess {
            let phts = phModel.photos
            let processPhoto = phts.filter { Photo in Photo.id < 101 }
            let cllViewModel = cellViewModel(processPhoto)
            photoViewDelegate?.fetchPhoto(cllViewModel)
        } else {
        }
    }
}
