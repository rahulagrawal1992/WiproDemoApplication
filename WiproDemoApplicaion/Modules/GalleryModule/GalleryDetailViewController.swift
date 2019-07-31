//
//  GalleryDetailViewController.swift
//  WiproDemoApplicaion
//
//  Created by Rahul Agrawal on 29/07/19.
//  Copyright © 2019 Rahul Agrawal. All rights reserved.
//

import UIKit

class GalleryDetailViewController: UIViewController {
    
    
    var row : Record? {
        didSet {
            dataImageView.imageFromUrl(row?.imageHref)
            dataNameLabel.text = row?.title ?? "N/A"
            dataDescriptionLabel.text = row?.descriptionField ?? "N/A"
        }
    }
    
    //configure container view
    private let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        return view
    }()
    
    //configure dataImageView view
    private let dataImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit // image will never be strecthed vertially or horizontally
        imageView.backgroundColor = UIColor.lightGray
        imageView.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        imageView.clipsToBounds = true
        return imageView
    }()
    
    //configure dataNameLabel view
    private let dataNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        return label
    }()
    
    //configure dataDescriptionLabel view
    private let dataDescriptionLabel : UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    static func instance(_ data: Record) -> GalleryDetailViewController {
        let galleryDetailViewController = GalleryDetailViewController(nibName: nil, bundle: nil)
        galleryDetailViewController.row = data
        return galleryDetailViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.setUpConstraint()
    }
    
    
    func setUpConstraint(){
        
        self.view.addSubview(dataImageView)
        containerView.addSubview(dataNameLabel)
        containerView.addSubview(dataDescriptionLabel)
        self.view.addSubview(containerView)
        
        // configure dataImageView constraint
        dataImageView.topAnchor.constraint(equalTo:self.view.layoutMarginsGuide.topAnchor, constant: 40).isActive = true
        dataImageView.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor).isActive = true
        dataImageView.widthAnchor.constraint(equalToConstant:100).isActive = true
        dataImageView.heightAnchor.constraint(equalToConstant:100).isActive = true
        
        // configure containerView constraint
        containerView.topAnchor.constraint(equalTo:self.dataImageView.bottomAnchor, constant:20).isActive = true
        containerView.bottomAnchor.constraint(equalTo:self.view.layoutMarginsGuide.bottomAnchor, constant:-5).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.view.layoutMarginsGuide.leadingAnchor, constant:10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.view.layoutMarginsGuide.trailingAnchor, constant:-10).isActive = true
        
        // configure dataNameLabel constraint
        dataNameLabel.topAnchor.constraint(equalTo:containerView.topAnchor).isActive = true
        dataNameLabel.leadingAnchor.constraint(equalTo:containerView.leadingAnchor).isActive = true
        dataNameLabel.trailingAnchor.constraint(equalTo:containerView.trailingAnchor).isActive = true
        
        // configure dataDescriptionLabel constraint
        dataDescriptionLabel.topAnchor.constraint(equalTo:self.dataNameLabel.bottomAnchor, constant: 5).isActive = true
        dataDescriptionLabel.leadingAnchor.constraint(equalTo:containerView.leadingAnchor).isActive = true
        dataDescriptionLabel.trailingAnchor.constraint(equalTo:containerView.trailingAnchor).isActive = true
        dataDescriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo:containerView.bottomAnchor).isActive = true
    }
    
}
