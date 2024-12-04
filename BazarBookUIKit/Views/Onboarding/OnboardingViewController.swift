//
//  OnboardingViewController.swift
//  BazarBookUIKit
//
//  Created by yanuar nauval ardian on 06/09/24.
//

import UIKit

class OnboardingViewController: UIPageViewController{
    var pages = [UIViewController]()
    let pagesModels:[OnBoardingModel] = [
       OnBoardingModel(id: 0, imageName: "onboardingFirst", title: "Now reading books will be easier", description: " Discover new worlds, join a vibrant reading community. Start your reading adventure effortlessly with us."),
       OnBoardingModel(id: 1, imageName: "onboardingSecond", title: "Your Bookish Soulmate Awaits", description: "Let us be your guide to the perfect read. Discover books tailored to your tastes for a truly rewarding experience."),
       OnBoardingModel(id: 2, imageName: "onboardingThird", title: "Start Your Adventure", description: "Ready to embark on a quest for inspiration and knowledge? Your adventure begins now. Let's go!")
    ]
    // external controls
    private let signButton = SecondaryButton()
    
    private let continueButton = PrimaryButton()
    
    private let skipButton = UILabel()
    
    private var bottomSection = UIStackView()
    
    private var pageControl = UIPageControl()
    
    let initialPage = 0


    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setup()
        layout()
    }
}

extension OnboardingViewController {
    
    func setup() {
        view.addSubview(bottomSection)
        view.addSubview(skipButton)
    }
    func style () {
       
        signButton.configuration(title: "Sign in")
        //signButton.addTarget(self, action: #selector(skipTapped(_:)), for: .primaryActionTriggered)
        
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        skipButton.text = "skip"
        skipButton.font = .body
        skipButton.textColor = .primary
        skipButton.isUserInteractionEnabled = true
        skipButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(skipTapped)))
        
        continueButton.configuration(title: "Continue")
        continueButton.addTarget(self, action: #selector(nextTapped(_:)), for: .primaryActionTriggered)
        
        pageControl.addTarget(self, action: #selector(pageControlTapped(_:)), for: .valueChanged)
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .systemGray2
        dataSource = self
        delegate = self
        
        pagesModels.forEach{ model in
            pages.append(OnboardingItemViewController(model: model))
        }
        
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = initialPage
        setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
        
        bottomSection = UIStackView(arrangedSubviews: [pageControl,continueButton,signButton])
        bottomSection.spacing = 10
        bottomSection.axis = .vertical
        bottomSection.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            skipButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            skipButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            continueButton.heightAnchor.constraint(equalToConstant: 56),
            signButton.heightAnchor.constraint(equalToConstant: 56),
            bottomSection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomSection.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomSection.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            bottomSection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    
}

// MARK: - DataSource

extension OnboardingViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex == 0 {
            return pages.last               // wrap last
        } else {
            return pages[currentIndex - 1]  // go previous
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]  // go next
        } else {
            return pages.first              // wrap first
        }
    }
}

// MARK: - Delegates

extension OnboardingViewController: UIPageViewControllerDelegate {
    
    // How we keep our pageControl in sync with viewControllers
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
        
        pageControl.currentPage = currentIndex
        
    }
}

// MARK: - Actions

extension OnboardingViewController {
    
    @objc func pageControlTapped(_ sender: UIPageControl) {
        setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
    }
    
    @IBAction func skipTapped(_ sender: UIButton) {
        let lastPageIndex = pages.count - 1
        pageControl.currentPage = lastPageIndex
        goToSpecificPage(index: lastPageIndex, ofViewControllers: pages)
    }
    
    @IBAction func nextTapped(_ sender: UIButton) {
        if pageControl.currentPage < pages.count - 1{
            pageControl.currentPage += 1
        }else{
            pageControl.currentPage = 0
        }
        goToNextPage()
    }
}

// MARK: - Extensions

extension UIPageViewController {
    
    func goToSpecificPage(index:Int,ofViewControllers:[UIViewController]){
        setViewControllers([ofViewControllers[index]], direction: .forward, animated: true)
    }
    
    func goToNextPage(){
        guard let currentPage = viewControllers?[0] else {return}
        guard let nextpage = dataSource?.pageViewController(self, viewControllerAfter: currentPage) else {return}
        setViewControllers([nextpage], direction: .forward, animated: true)
    }
    
}


#Preview{
    OnboardingViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
}
