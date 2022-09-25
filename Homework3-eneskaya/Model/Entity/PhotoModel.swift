



import Foundation


struct PhotoCollectionCellViewModel {
    
    var image: String?
}


struct Photo: Decodable {
    
    var albumId : Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}
