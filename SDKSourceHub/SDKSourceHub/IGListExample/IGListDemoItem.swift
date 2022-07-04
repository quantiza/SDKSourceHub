//
//  IGListDemoItem.swift
//  IGListDemoItem
//
//  Created by Yang Long on 2021/8/3.
//

import Foundation
import UIKit
import IGListKit

class IGListDemoItem {
    let name: String
    let controllerClass: UIViewController.Type
    let controllerIdentifier: String?
    
    init(name: String, controllerClass: UIViewController.Type, controllerIdentifier: String? = nil) {
        self.name = name
        self.controllerClass = controllerClass
        self.controllerIdentifier = controllerIdentifier
    }
}

extension IGListDemoItem: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return name as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if self === object { return true }
        guard let object = object as? IGListDemoItem else { return false }
        return controllerClass == object.controllerClass && controllerIdentifier == object.controllerIdentifier
    }
}
