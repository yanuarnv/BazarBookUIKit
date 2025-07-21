import UIKit
import Combine

class CategoryViewController: UIViewController {
    @Inject private var viewModel:CategoryViewModel
    
    private let verticalLayout:UIView = {
        let stackView = UIView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let scrollview:UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.showsVerticalScrollIndicator = false
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        return scrollview
    }()
    
    private let categoryGrid:CategoryGridView = {
        let grid = CategoryGridView()
        grid.translatesAutoresizingMaskIntoConstraints = false
        return grid
    }()
    
    private let categoryList:CategoryListView = {
        let widget = CategoryListView()
        widget.translatesAutoresizingMaskIntoConstraints = false
        return widget
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationController()
    }
}

extension CategoryViewController{
    func setup(){
        navigationItem.title = "Category"
        [categoryList,categoryGrid].forEach{
            verticalLayout.addSubview($0)
        }
        scrollview.addSubview(verticalLayout)
        view.addSubview(scrollview)
    }
    
    func setupNavigationController() {
        guard let navigationController = navigationController else { return }
        
        // Configure navigation bar appearance
        navigationController.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        // Ensure navigation bar is visible
        navigationController.setNavigationBarHidden(false, animated: false)
        
        // Configure scroll edge appearance for smooth transitions
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.scrollEdgeAppearance = appearance
        navigationController.navigationBar.compactAppearance = appearance
    }
    
    func layout(){
        NSLayoutConstraint.activate([
            // scrollview
            scrollview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollview.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            // vertical layout
            verticalLayout.topAnchor.constraint(equalTo: scrollview.contentLayoutGuide.topAnchor),
            verticalLayout.bottomAnchor.constraint(equalTo: scrollview.contentLayoutGuide.bottomAnchor),
            verticalLayout.leadingAnchor.constraint(equalTo: scrollview.contentLayoutGuide.leadingAnchor),
            verticalLayout.trailingAnchor.constraint(equalTo: scrollview.contentLayoutGuide.trailingAnchor),
            verticalLayout.widthAnchor.constraint(equalTo: scrollview.frameLayoutGuide.widthAnchor),
            
            categoryList.topAnchor.constraint(equalTo: verticalLayout.topAnchor,constant: 16),
            categoryList.leadingAnchor.constraint(equalTo: verticalLayout.leadingAnchor,constant: 16),
            categoryList.trailingAnchor.constraint(equalTo: verticalLayout.trailingAnchor,constant: -16),
            categoryList.heightAnchor.constraint(equalToConstant: 45),
            
            categoryGrid.leadingAnchor.constraint(equalTo: verticalLayout.leadingAnchor,constant: 16),
            categoryGrid.trailingAnchor.constraint(equalTo: verticalLayout.trailingAnchor,constant: -16),
            categoryGrid.topAnchor.constraint(equalTo: categoryList.bottomAnchor,constant: 40),
            categoryGrid.bottomAnchor.constraint(equalTo: verticalLayout.bottomAnchor)
        ])
    }
}

#Preview{
    PreviewHelper.mainTabbarController()
}
