//
//  HomeRouter.swift
//  NEWSVIPERUIKIT
//
//  Created by Halil İbrahim Öztekin on 29.06.2023.


import UIKit

@objc protocol HomeRoutingLogic
{
    func routeToDetailVC()
}

protocol HomeDataPassing
{
  var dataStore: HomeDataStore? { get }
}

class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing
{
  weak var viewController: HomeViewController?
  var dataStore: HomeDataStore?
  
  // MARK: Routing
    
    func routeToDetailVC() {
        let destinationVC = DetailPageViewController.instantiateFromStoryboard()
        var destinationDS = destinationVC.router!.dataStore!
        passDataToSomewhere(source: dataStore!, destination: &destinationDS)
        navigateToSomewhere(source: viewController!, destination: destinationVC)
    }
  
    func passDataToSomewhere(source: HomeDataStore, destination: inout DetailPageDataStore){
        destination.selectedArticle = source.selectedArticle
    }
    
    func navigateToSomewhere(source: HomeViewController, destination: DetailPageViewController) {
        source.show(destination, sender: nil)
    }
    
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: HomeViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: HomeDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
