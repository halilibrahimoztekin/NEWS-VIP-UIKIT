//
//  DetailPageViewController.swift
//  NEWSVIPERUIKIT
//
//  Created by Halil İbrahim Öztekin on 29.06.2023.


import UIKit

protocol DetailPageDisplayLogic: AnyObject
{
    func displayPrepareCollectionView(articles: [[String : Any]]?)
    func displayAlert(title: String?, message: String?, actions: [AlertAction])
}

class DetailPageViewController: UIViewController, DetailPageDisplayLogic
{
    var interactor: DetailPageBusinessLogic?
    var router: (NSObjectProtocol & DetailPageRoutingLogic & DetailPageDataPassing)?
    
    fileprivate var newsDataSource: NewsDetailDataSource?
    
    @IBOutlet var collectionView: UICollectionView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = DetailPageInteractor()
        let presenter = DetailPagePresenter()
        let router = DetailPageRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        interactor?.loadViews()
    }
    
    func displayPrepareCollectionView(articles: [[String : Any]]?) {
        if let articles = articles {
            
            DispatchQueue.main.async {
                let datasource = NewsDetailDataSource(collectionView: self.collectionView, array: articles)
                
                self.newsDataSource = datasource
                
                self.newsDataSource?.collectionView
                
                self.newsDataSource?.collectionView.reloadData()
            }
            
        }
    }
    
    
    func displayAlert(title: String?, message: String?, actions: [AlertAction] = []) {
        AlertManager.showAlert(title: title, message: message,actions: actions)
    }
    
    @IBAction func viewAllButtonTapped(_ sender: Any) {
    }
    
}
