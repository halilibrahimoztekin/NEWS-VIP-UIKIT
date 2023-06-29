//
//  DetailPageRouter.swift
//  NEWSVIPERUIKIT
//
//  Created by Halil İbrahim Öztekin on 29.06.2023.


import UIKit

@objc protocol DetailPageRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol DetailPageDataPassing
{
  var dataStore: DetailPageDataStore? { get }
}

class DetailPageRouter: NSObject, DetailPageRoutingLogic, DetailPageDataPassing
{
  weak var viewController: DetailPageViewController?
  var dataStore: DetailPageDataStore?
  
  // MARK: Routing
  
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
  
  //func navigateToSomewhere(source: DetailPageViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: DetailPageDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
