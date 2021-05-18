//
//  CarouselCollectionTableViewCell.swift
//  tableViewPractice
//
//  Created by JEONGSEOB HONG on 2021/05/18.
//

import UIKit

protocol CarouselCollectionTableViewCellDelegate: AnyObject {
    func carouselCollectionTableViewCell(
        _ tableViewCell: UITableViewCell,
        didSelectWith titleCollectionViewCellViewModel: TitleCollectionViewCellViewModel)
}

struct CarouselCollectionTableViewCellViewModel {
    let titleCollectionViewCellViewModel: [TitleCollectionViewCellViewModel]
}

class CarouselCollectionTableViewCell: UITableViewCell {
    
    static let identifier = "CarouselCollectionTableViewCell"
    
    weak var delegate: CarouselCollectionTableViewCellDelegate?
    
    private var carouselCollectionData: [TitleCollectionViewCellViewModel] = []
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout)
        
        collectionView.register(
            TitleCollectionViewCell.self,
            forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        collectionView.backgroundColor = .systemRed
        return collectionView
    }()
    
    
    // MARK: - life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    // MARK: - configure
    
    func configure(with viewModel: CarouselCollectionTableViewCellViewModel) {
        self.carouselCollectionData = viewModel.titleCollectionViewCellViewModel
        collectionView.reloadData()
    }
    
}

// MARK: - CollectionView - DataSource, Delegate
extension CarouselCollectionTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
        carouselCollectionData.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: TitleCollectionViewCell.identifier,
                for: indexPath) as? TitleCollectionViewCell
        else { fatalError() }
        
        cell.configure(with: carouselCollectionData[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        delegate?.carouselCollectionTableViewCell(
            self,
            didSelectWith: carouselCollectionData[indexPath.row])
    }
}

// MARK: - CollectionView DelegateFlowLayout
extension CarouselCollectionTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size: CGFloat = contentView.frame.size.width / 3
        return CGSize(width: size, height: size)
    }
}
