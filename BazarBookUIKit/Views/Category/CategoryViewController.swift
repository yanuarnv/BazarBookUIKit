import UIKit

class CategoryViewController: UIViewController {
    //    @Inject private var viewModel:HomeViewModel
    
    private let titleLabel:UILabel = {
        let label = UILabel()
        label.text = "Category"
        label.font = .title1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
    
    private let line:UIView = {
        let line = UIView()
        line.backgroundColor = .gray
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
    }
}

extension CategoryViewController{
    func setup(){
        navigationItem.title = "Category"
        scrollview.delegate = self
        [titleLabel,line,categoryList,categoryGrid].forEach{
            verticalLayout.addSubview($0)
        }
        scrollview.addSubview(verticalLayout)
        view.addSubview(scrollview)
    }
    
    func layout(){
        NSLayoutConstraint.activate([
            // scrollview
            scrollview.topAnchor.constraint(equalTo: view.topAnchor),
            scrollview.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            // vertical layout
            verticalLayout.topAnchor.constraint(equalTo: scrollview.contentLayoutGuide.topAnchor),
            verticalLayout.bottomAnchor.constraint(equalTo: scrollview.contentLayoutGuide.bottomAnchor),
            verticalLayout.leadingAnchor.constraint(equalTo: scrollview.contentLayoutGuide.leadingAnchor),
            verticalLayout.trailingAnchor.constraint(equalTo: scrollview.contentLayoutGuide.trailingAnchor),
            verticalLayout.widthAnchor.constraint(equalTo: scrollview.frameLayoutGuide.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: verticalLayout.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: verticalLayout.leadingAnchor,constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: verticalLayout.trailingAnchor,constant: 16),
            
            line.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 12),
            line.leadingAnchor.constraint(equalTo: verticalLayout.leadingAnchor,constant: 16),
            line.trailingAnchor.constraint(equalTo: verticalLayout.trailingAnchor,constant: -16),
            line.heightAnchor.constraint(equalToConstant: 1.3/UIScreen.main.scale),
            
            
            categoryList.topAnchor.constraint(equalTo: line.bottomAnchor,constant: 16),
            categoryList.leadingAnchor.constraint(equalTo: verticalLayout.leadingAnchor,constant: 16),
            categoryList.trailingAnchor.constraint(equalTo: verticalLayout.trailingAnchor,constant: -16),
            categoryList.heightAnchor.constraint(equalToConstant: 45),
            
            categoryGrid.leadingAnchor.constraint(equalTo: verticalLayout.leadingAnchor,constant: 16),
            categoryGrid.trailingAnchor.constraint(equalTo: verticalLayout.trailingAnchor,constant: -16),
            categoryGrid.topAnchor.constraint(equalTo: categoryList.bottomAnchor,constant: 40),
            categoryGrid.bottomAnchor.constraint(equalTo: verticalLayout.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
extension CategoryViewController:UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY < -56 {
            navigationController?.setNavigationBarHidden(true, animated: true)
        }else{
            
            navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }
    
}
#Preview{
    CategoryViewController()
}
