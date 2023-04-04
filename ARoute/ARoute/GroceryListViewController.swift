import UIKit

class GroceryListViewController: UICollectionViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, String>

    var dataSource: DataSource!
    var allItems: [Grocery] = []
    var filteredItems: [Grocery] = []
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()

        let listLayout = self.listLayout()
        collectionView.collectionViewLayout = listLayout

        let cellRegistration = UICollectionView.CellRegistration { (cell: UICollectionViewListCell, indexPath: IndexPath, itemIdentifier: String) in
            let grocery = self.filteredItems[indexPath.item]
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.secondaryText = grocery.type
            contentConfiguration.text = grocery.title
            contentConfiguration.secondaryTextProperties.font = UIFont.preferredFont(forTextStyle: .caption1)
            cell.contentConfiguration = contentConfiguration
        }

        dataSource = DataSource(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: String) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }

        self.allItems = Grocery.sampleData
        self.filteredItems = self.allItems
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(self.filteredItems.map { $0.title })
        dataSource.apply(snapshot)

        collectionView.dataSource = dataSource
        
        configureSearchController()
    }

    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = true
        listConfiguration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
    
    private func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }
}

extension GroceryListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text ?? ""
        if searchText.isEmpty {
            filteredItems = allItems
        } else {
            filteredItems = allItems.filter {
                $0.title.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(filteredItems.map { $0.title })
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        filteredItems = allItems
        
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(filteredItems.map { $0.title })
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}
