import UIKit

class CategoryViewController: UIViewController {
    let vm  = HomeViewModel(service: BookApiServiceImpl())
    
    let button:PrimaryButton = {
        let btn = PrimaryButton()
        btn.configuration(title: "click me")
        return btn
    }()
    
    let text:UILabel = {
        let text = UILabel()
        text.text = "hello world"
        text.font = .systemFont(ofSize: 20)
        text.textColor = .black
        return text
    }()
    
    let colum:UIStackView = {
        let colum = UIStackView()
        colum.axis = .vertical
        return colum
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Category"
        setup()
        layout()
    }
}

extension CategoryViewController{
    func setup(){
        colum.addArrangedSubview(text)
        colum.addArrangedSubview(button)
        view.addSubview(colum)
        
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
        [colum,text,button].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func layout(){
        NSLayoutConstraint.activate([
            colum.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            colum.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}
extension CategoryViewController{
    @objc func buttonClicked(){
        Task{
            do{
                try await vm.getBooks()
            }catch{
                print(error)
            }
        }
    }
}
#Preview{
    CategoryViewController()
}
