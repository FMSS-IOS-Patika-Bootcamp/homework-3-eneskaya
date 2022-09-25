//
//  PhotoViewModel.swift
//  Homework3-eneskaya
//
//  Created by Enes Kaya on 25.09.2022.
//

/*
struct PhotoListViewModel {

    let photoList : [PhotoModel]
    
    func numberOfRowsInSection() -> Int {
        return self.photoList.count
    }
    func photoAtIndex(_ index: Int) -> PhotoViewModel{
        let photo = self.photoList[index]
        return PhotoViewModel(photo: photo)
    }

}

struct PhotoViewModel {
    
    let photo : PhotoModel
    
    var url : String {
        return self.photo.url
    }
}
 */


import Foundation

protocol AlbumViewModelViewProtocol: AnyObject {
    func didCellItemFetch(_ items: [PhotoCollectionCellViewModel])
}

class PhotoViewModel {
    
    // Defining Constants and Variables
    weak var viewDelegate: AlbumViewModelViewProtocol?
    private let model = photoModel()
    
    
    init() {
        model.photoDelegate = self
    }
    
    func didViewLoad() {
        model.fetchDataFunc()
    }
    
}

// Extension for MakeViewBasedModel Function
private extension PhotoViewModel {
    
    @discardableResult
    func makeViewBasedModel(_ photos: [Photo]) -> [PhotoCollectionCellViewModel] {
        return photos.map { .init(image: $0.url) }
    }
    
}

extension PhotoViewModel: PhotoModelPr {
    
    func getData(_ isSuccess: Bool) {
        if isSuccess {
            let photos = model.photos
            let filtered = photos.filter { Photo in Photo.id < 101 }
            let cellModels = makeViewBasedModel(filtered)
            viewDelegate?.didCellItemFetch(cellModels)
        } else {
        }
    }
}
