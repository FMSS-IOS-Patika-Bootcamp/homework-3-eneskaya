//
//  TodoEntity+CoreDataProperties.swift
//  Homework3-eneskaya
//
//  Created by Enes Kaya on 21.09.2022.
//
//

import Foundation
import CoreData


extension TodoEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoEntity> {
        return NSFetchRequest<TodoEntity>(entityName: "TodoEntity")
    }

    @NSManaged public var todo: String?
    @NSManaged public var isChecked: Bool
    @NSManaged public var img: Data?
    @NSManaged public var created: Date?
}

extension TodoEntity : Identifiable {

}
