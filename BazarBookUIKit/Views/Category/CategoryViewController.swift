import UIKit

class CategoryViewController: UIViewController {
    //    @Inject private var viewModel:HomeViewModel
    
    private let titleLabel:UILabel = {
        let label = UILabel()
        label.text = "Category"
        label.font = .title2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let verticalLayout:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let scrollview:UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        return scrollview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
    }
}

extension CategoryViewController{
    func setup(){
        [titleLabel].forEach{
            verticalLayout.addArrangedSubview($0)
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
            verticalLayout.topAnchor.constraint(equalTo: scrollview.topAnchor),
            verticalLayout.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor),
            verticalLayout.leadingAnchor.constraint(equalTo: scrollview.contentLayoutGuide.leadingAnchor),
            verticalLayout.trailingAnchor.constraint(equalTo: scrollview.contentLayoutGuide.trailingAnchor),
            verticalLayout.widthAnchor.constraint(equalTo: scrollview.frameLayoutGuide.widthAnchor),
            
            
            
            
            
        ])
    }
}
extension CategoryViewController{
    
}
#Preview{
    CategoryViewController()
}
