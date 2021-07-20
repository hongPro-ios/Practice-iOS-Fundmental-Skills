//
//  ImageCollectionViewCell.swift
//  CollectionView-Waterfall
//
//  Created by JEONGSEOB HONG on 2021/07/20.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    static let identifier = "ImageCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.clipsToBounds = true // need test
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    func configure(image: UIImage?) {
        imageView.image = image
    }
}
