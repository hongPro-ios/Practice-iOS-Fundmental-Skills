//
//  ViewController.swift
//  CollectionView-Waterfall
//
//  Created by JEONGSEOB HONG on 2021/07/20.
//

import UIKit
import CHTCollectionViewWaterfallLayout

struct Model {
    let imageName: String
    let height: CGFloat
}

class WaterFallLayoutCollectionView: UIViewController {
    
    private var models = [Model]()
    
    private let collectionView: UICollectionView = {
        let layout = CHTCollectionViewWaterfallLayout()
        layout.itemRenderDirection = .leftToRight
        layout.columnCount = 2
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ImageCollectionViewCell.self,
                                forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitImage()
        
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    func setupInitImage() {
        let images = Array(1...9).map { "image\($0)" }
        models = images.compactMap {
            return Model.init(
                imageName: $0,
                height: CGFloat.random(in: 200...400))
        }
    }
}

extension WaterFallLayoutCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        models.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as? ImageCollectionViewCell else { fatalError() }
        cell.configure(image: UIImage(named: models[indexPath.row].imageName))
        return cell
    }
}

extension WaterFallLayoutCollectionView: CHTCollectionViewDelegateWaterfallLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width / 2,
                      height: models[indexPath.row].height)
    }
}
