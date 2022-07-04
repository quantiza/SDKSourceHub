//
//  IGListDemoViewController.swift
//  IGListDemoViewController
//
//  Created by Yang Long on 2021/8/3.
//

import UIKit
import IGListKit

class IGListDemoViewController: UIViewController, ListAdapterDataSource {
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let demos = [
        IGListDemoItem(name: "Tail Loading", controllerClass: LoadMoreViewController.self),
        IGListDemoItem(name: "Working Range", controllerClass: WorkingRangeViewController.self),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "IGListDemos"
        view.addSubview(collectionView)
        collectionView.backgroundColor = .red
        adapter.collectionView = collectionView
        adapter.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
        
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return demos
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return IGListDemoSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
