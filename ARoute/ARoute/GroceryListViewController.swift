//
//  GroceryListViewController.swift
//  ARoute
//
//  Created by Yiwen Zhao on 3/28/23.
//

import UIKit
class GroceryListViewController: UICollectionViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, String>

    var dataSource: DataSource!
    
    override func viewDidLoad () {
        super.viewDidLoad()
        
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        let cellRegistration = UICollectionView.CellRegistration {
            (cell: UICollectionViewListCell, indexPath: IndexPath, itemIdentifier: String) in
            let grocery = Grocery.sampleData[indexPath.item]
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.secondaryText = grocery.type
            contentConfiguration.text = grocery.title
            contentConfiguration.secondaryTextProperties.font = UIFont.preferredFont(
                forTextStyle: .caption1)
            //contentConfiguration.secondaryTextProperties.alignment =
            cell.contentConfiguration = contentConfiguration
        }
        
        dataSource = DataSource(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: String) in
            return collectionView.dequeueConfiguredReusableCell(
                using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(Grocery.sampleData.map { $0.title })
        dataSource.apply(snapshot)

        collectionView.dataSource = dataSource
    }
    private func listLayout() -> UICollectionViewCompositionalLayout {
            var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
            listConfiguration.showsSeparators = true
            listConfiguration.backgroundColor = .clear
            return UICollectionViewCompositionalLayout.list(using: listConfiguration)
        
    }
}
