//
//  GalleryDetailViewController.swift
//  WiproDemoApplicaion
//
//  Created by Rahul Agrawal on 29/07/19.
//  Copyright © 2019 Rahul Agrawal. All rights reserved.
//

import UIKit

class GalleryDetailViewController: UIViewController {
    
    //Loading data into view
    var row : Record? {
        didSet {
            profileImageView.imageFromUrl(row?.imageHref)
            titleLabel.text = row?.title ?? "N/A"
            detailLabel.text = row?.descriptionField ?? "N/A"
        }
    }
    
    //configure profileImageView view
    private let profileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        imageView.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        imageView.layer.cornerRadius = 60
        imageView.clipsToBounds = true
        return imageView
    }()
    
    //configure titleLabel view
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    //configure detailLabel view
    private let detailLabel : UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    //for navigation
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
    
    //configure constraints
    func setUpConstraint(){
        
        self.view.addSubview(profileImageView)
        self.view.addSubview(titleLabel)
        self.view.addSubview(detailLabel)
        
        // configure dataImageView constraint
        profileImageView.topAnchor.constraint(equalTo:self.view.layoutMarginsGuide.topAnchor, constant: 30).isActive = true
        profileImageView.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant:120).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant:120).isActive = true
    
        // configure titleLabel constraint
        titleLabel.topAnchor.constraint(equalTo:profileImageView.bottomAnchor, constant: 10).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.view.layoutMarginsGuide.centerXAnchor).isActive = true

        // configure detailLabel constraint
        detailLabel.topAnchor.constraint(equalTo:self.titleLabel.bottomAnchor, constant: 5).isActive = true
        detailLabel.leadingAnchor.constraint(equalTo:self.view.layoutMarginsGuide.leadingAnchor).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo:self.view.layoutMarginsGuide.trailingAnchor).isActive = true
        detailLabel.bottomAnchor.constraint(lessThanOrEqualTo:self.view.layoutMarginsGuide.bottomAnchor).isActive = true
    }
    
}
