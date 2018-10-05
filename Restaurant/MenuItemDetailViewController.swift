/* MenuItemDetailViewController.swift
 Restaurant
 Lets user place an order from a menu obtained from a local server.
 --------------------------------------------------------------------------
 OpenRestaurant (included in project file) MUST BE RUNNING FOR APP TO WORK.
 --------------------------------------------------------------------------
 Created by Nour Yehia on 9/5/18.
 Copyright © 2018 Nour Yehia. All rights reserved. */

import UIKit

// ADD COMMENTS!!!!!!
class MenuItemDetailViewController: UIViewController {
    
    var menuItem: MenuItem!
    var delegate: AddToOrderDelegate?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        setupDelegate()
    }
    
    func updateUI(){
        titleLabel.text = menuItem.name
        priceLabel.text = String(format: "$%.2f", menuItem.price)
        descriptionLabel.text = menuItem.description
        MenuController.shared.fetchImage(url: menuItem.imageURL) { (image) in
            guard let image = image else { return }
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }
    
    func setupDelegate(){
        if let navigationController = tabBarController?.viewControllers?.last as? UINavigationController, let orderTableViewController = navigationController.viewControllers.first as? OrderTableViewController {
            delegate = orderTableViewController
        }
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.button.transform = CGAffineTransform(scaleX: 2.5, y: 2.5)
            self.button.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
        delegate?.added(menuItem: menuItem)
    }
}
