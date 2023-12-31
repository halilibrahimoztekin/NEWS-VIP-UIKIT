//
//  HomeViewController.swift
//  NEWSVIPERUIKIT
//
//  Created by Halil İbrahim Öztekin on 29.06.2023.


import UIKit

protocol HomeDisplayLogic: AnyObject
{
    func displayPrepareCollectionView(articles: [Home.News.Article]?)
    func displayNavigateNewsDetail()
    func displayAlert(title: String?, message: String?, actions: [AlertAction])
}

class HomeViewController: UIViewController, HomeDisplayLogic
{
    var interactor: HomeBusinessLogic?
    var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?
    
    @IBOutlet var collectionView: UICollectionView!
    fileprivate var newsDataSource: NewsDataSource?
    
    
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
    
    
    private func setup()
    {
        let viewController = self
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
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
        fetchNews()
    }
    
    
    func fetchNews(){
        interactor?.fetchNews()
    }
   
    
    func displayNavigateNewsDetail() {
        router?.routeToDetailVC()
    }
    
    func displayPrepareCollectionView(articles: [Home.News.Article]?) {
        if let articles = articles {
            
            DispatchQueue.main.async {
                let datasource = NewsDataSource(collectionView: self.collectionView, array: articles)
                self.newsDataSource = datasource
                
                self.newsDataSource?.collectionItemSelectionHandler = { [weak self] indexPath in
                    
                    self?.interactor?.setSelectArticle(indexPath: indexPath)
                }
                
                self.collectionView.reloadData()
            }
            
        }
    }
    
    func displayAlert(title: String?, message: String?, actions: [AlertAction] = []) {
        AlertManager.showAlert(title: title, message: message,actions: actions)
    }
}
