//
//  SpinnerCell.swift
//  SpinnerCell
//
//  Created by Yang Long on 2021/8/4.
//

import UIKit
import IGListKit

func spinnerSectionController() -> ListSingleSectionController {
    let configureBlock = { (item: Any, cell: UICollectionViewCell) in
        guard let cell = cell as? SpinnerCell else { return }
        cell.activityIndicator.startAnimating()
    }
    
    let sizeBlock = { (item: Any, context: ListCollectionContext?) -> CGSize in
        guard let context = context else { return .zero }
        return CGSize(width: context.containerSize.width, height: 100)
    }
    
    return ListSingleSectionController(cellClass: SpinnerCell.self, configureBlock: configureBlock, sizeBlock: sizeBlock)
}

class SpinnerCell: UICollectionViewCell {
    lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        self.contentView.addSubview(view)
        return view
    }()
    
    override func layoutSubviews() {
        super .layoutSubviews()
        activityIndicator.center = CGPoint(x: bounds.midX, y: bounds.midY)
    }
}
