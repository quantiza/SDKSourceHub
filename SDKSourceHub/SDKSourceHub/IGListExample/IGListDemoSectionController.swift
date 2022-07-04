//
//  IGListDemoSectionController.swift
//  IGListDemoSectionController
//
//  Created by Yang Long on 2021/8/3.
//

import Foundation
import IGListKit


class LabelSectionController2: ListSectionController {
    
    private var object: String?
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 55)
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext!.dequeueReusableCell(of: MyCell.self, for: self, at: index) as? MyCell else { fatalError() }
        cell.text = object
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.object = object as? String
    }
}

class IGListDemoSectionController: ListSectionController {
    private var object: IGListDemoItem?

    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 55)
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: LabelCell.self, for: self, at: index) as? LabelCell else { fatalError() }
        cell.text = object?.name
        return cell
    }

    override func didUpdate(to object: Any) {
        self.object = object as? IGListDemoItem
    }

    override func didSelectItem(at index: Int) {
        if let controller = object?.controllerClass.init() {
            controller.title = object?.name
            viewController?.navigationController?.pushViewController(controller, animated: true)
        }
    }
}
