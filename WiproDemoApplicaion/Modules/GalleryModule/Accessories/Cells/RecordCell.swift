//
//  RecordCell.swift
//  WiproDemoApp
//
//  Created by Rahul Agrawal on 15/07/19.
//  Copyright © 2019 Rahul Agrawal. All rights reserved.
//

import UIKit

class RecordCell: UITableViewCell {
   
    var row : Record? {
        didSet {
            dataImageView.imageFromUrl(row?.imageHref)
            dataNameLabel.text = row?.title
            dataDescriptionLabel.text = row?.descriptionField
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
        imageView.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        imageView.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        imageView.clipsToBounds = true
        return imageView
    }()
    
    //configure dataNameLabel view
    private let dataNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textAlignment = .left
        return label
    }()
    
    //configure dataDescriptionLabel view
    private let dataDescriptionLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        label.font = UIFont.systemFont(ofSize: 11)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(dataImageView)
        containerView.addSubview(dataNameLabel)
        containerView.addSubview(dataDescriptionLabel)
        self.contentView.addSubview(containerView)
        
        // configure dataImageView constraint
        dataImageView.topAnchor.constraint(equalTo:self.contentView.topAnchor).isActive = true
        dataImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        dataImageView.widthAnchor.constraint(equalToConstant:70).isActive = true
        dataImageView.heightAnchor.constraint(equalToConstant:70).isActive = true
       
       // dataImageView.widthAnchor.constraint(equalTo: dataImageView.heightAnchor,
           //                                  multiplier: 0.5)
    dataImageView.bottomAnchor.constraint(equalTo:self.contentView.bottomAnchor).isActive = true
       
        
        // configure containerView constraint
        containerView.topAnchor.constraint(equalTo:self.contentView.topAnchor, constant:5).isActive = true
        containerView.bottomAnchor.constraint(equalTo:self.contentView.bottomAnchor, constant:5).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.dataImageView.trailingAnchor, constant:10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
        
        // configure dataNameLabel constraint
        dataNameLabel.topAnchor.constraint(equalTo:containerView.topAnchor).isActive = true
        dataNameLabel.leadingAnchor.constraint(equalTo:containerView.leadingAnchor).isActive = true
        dataNameLabel.trailingAnchor.constraint(equalTo:containerView.trailingAnchor).isActive = true
        
        // configure dataDescriptionLabel constraint
        dataDescriptionLabel.topAnchor.constraint(equalTo:self.dataNameLabel.bottomAnchor).isActive = true
        dataDescriptionLabel.leadingAnchor.constraint(equalTo:containerView.leadingAnchor).isActive = true
        dataDescriptionLabel.trailingAnchor.constraint(equalTo:containerView.trailingAnchor).isActive = true
        dataDescriptionLabel.bottomAnchor.constraint(equalTo:containerView.bottomAnchor).isActive = true
        
        // Disable tableview selection
        self.selectionStyle = .none
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
