//
//  LabelSectionController.swift
//  LabelSectionController
//
//  Created by Yang Long on 2021/8/4.
//

import IGListKit
import UIKit

class LabelSectionController: ListSectionController {
    private var object: String?
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 55)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: LabelCell.self, for: self, at: index) as? LabelCell else {
            fatalError()
        }
        cell.text = object
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.object = String(describing: object)
    }
}
