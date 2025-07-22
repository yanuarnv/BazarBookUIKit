//
//  SeachViewController.swift
//  BazarBookUIKit
//
//  Created by yanuar nauval ardian on 22/07/25.
//

import UIKit


class SearchListViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationSetup()
        setup()
        layout()
    }
    
    let searchBar: UISearchController = UISearchController()
    
    private var listview:SearchListView = {
        let searchlist = SearchListView()
        searchlist.translatesAutoresizingMaskIntoConstraints = false
        return searchlist
    }()
    
}

extension SearchListViewController {
    private func navigationSetup() {
        guard let nav = navigationController else { return }
        navigationItem.title = "Search"
        nav.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        navigationItem.searchController = searchBar
    }
    
    func setup(){
        view.addSubview(listview)
    }
    
    func layout(){
        NSLayoutConstraint.activate([
            listview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            listview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            listview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            listview.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
}


#Preview{
    PreviewHelper.searchViewController()
}

