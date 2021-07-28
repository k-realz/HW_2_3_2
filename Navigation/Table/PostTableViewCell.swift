//
//  FlowTableViewCell.swift
//  Navigation
//
//  Created by Komov Kirill on 22.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

final class PostTableViewCell: UITableViewCell {
    
    var posting: Posting? {
        didSet {
            autorLable.text = posting?.autor
            descriptionLable.text = posting?.description
            likesLable.text = "Likes:" + String(posting!.numberOfLikes)
            viewsLable.text = "Views:" + String(posting!.numberOfviews)
            postImageView.image = UIImage(named: posting!.image)
            //postImageView.image = posting?.image
        }
    }
    
    private let autorLable: UILabel = {
        let autorLable = UILabel()
        autorLable.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        autorLable.textColor = .black
        autorLable.numberOfLines = 2
        autorLable.translatesAutoresizingMaskIntoConstraints = false
        return autorLable
    }()
    
    private let descriptionLable: UILabel = {
        let descriptionLable = UILabel()
        descriptionLable.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        descriptionLable.textColor = .systemGray
        descriptionLable.numberOfLines = 0
        descriptionLable.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLable
    }()
    
    private let likesLable: UILabel = {
        let likesLable = UILabel()
        likesLable.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        likesLable.textColor = .black
        likesLable.translatesAutoresizingMaskIntoConstraints = false
        return likesLable
    }()
    
    private let viewsLable: UILabel = {
        let viewsLable = UILabel()
        viewsLable.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        viewsLable.textColor = .black
        viewsLable.translatesAutoresizingMaskIntoConstraints = false
        return viewsLable
    }()
    
    private let postImageView: UIImageView = {
        let postImageView = UIImageView()
        postImageView.contentMode = .scaleAspectFit
        postImageView.backgroundColor = .black
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        return postImageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
       // setupViews()
    }
    
}

private extension PostTableViewCell {
    func setupViews() {
        contentView.addSubview(autorLable)
        contentView.addSubview(descriptionLable)
        contentView.addSubview(likesLable)
        contentView.addSubview(viewsLable)
        contentView.addSubview(postImageView)
        
        let constraints = [
            autorLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            autorLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            autorLable.heightAnchor.constraint(equalToConstant: 30),

            
            postImageView.topAnchor.constraint(equalTo: autorLable.bottomAnchor, constant: 10),
            postImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.heightAnchor.constraint(equalToConstant: 350),
            
            descriptionLable.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 10),
            descriptionLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            descriptionLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            descriptionLable.heightAnchor.constraint(equalToConstant: 60),

            likesLable.topAnchor.constraint(equalTo: descriptionLable.bottomAnchor, constant: 10),
            likesLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            likesLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            viewsLable.topAnchor.constraint(equalTo: descriptionLable.bottomAnchor, constant: 10),
            viewsLable.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            viewsLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
        ]
        
        NSLayoutConstraint.activate(constraints)
        
    }
}
