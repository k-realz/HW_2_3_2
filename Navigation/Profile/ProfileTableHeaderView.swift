//
//  ProfileTableHederView.swift
//  Navigation
//
//  Created by Komov Kirill on 22.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileTableHeaderView: UITableViewHeaderFooterView {
    
    private var statusText: String?
    
    
    private let spaceView: UIView = {
        let spaceView = UIView()
        spaceView.translatesAutoresizingMaskIntoConstraints = false
        return spaceView
        }()
    
    private let userName: UILabel = {
        let userName = UILabel()
        userName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        userName.text = "Microphone Checker"
        userName.textAlignment = .center
        userName.textColor = .black
        userName.translatesAutoresizingMaskIntoConstraints = false
        return userName
        }()
    
    private let newStatus: UITextField = {
        let newStatus = UITextField()
        newStatus.layer.borderWidth = 1
        newStatus.layer.borderColor = UIColor.black.cgColor
        newStatus.backgroundColor = .white
        newStatus.layer.cornerRadius = 12
        newStatus.addTarget(self, action: #selector(statusTextChange), for: .editingChanged)
        newStatus.leftViewMode = .always
        newStatus.translatesAutoresizingMaskIntoConstraints = false
        return newStatus
        }()
    
    private let currentStatus: UILabel = {
        let currentStatus = UILabel()
        currentStatus.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        currentStatus.text = "Hi! My name is...."
        currentStatus.textColor = .gray
        currentStatus.textAlignment = .center
        currentStatus.translatesAutoresizingMaskIntoConstraints = false
        return currentStatus
        }()
    
    private let actionButton: UIButton = {
     let actionButton = UIButton()
     actionButton.layer.shadowRadius = 4
     actionButton.layer.shadowColor = UIColor.black.cgColor
     actionButton.layer.shadowOffset = CGSize(width: 4, height: 4)
     actionButton.layer.shadowOpacity = 0.7
     actionButton.layer.cornerRadius = 4
     actionButton.clipsToBounds = false
     actionButton.backgroundColor = .systemBlue
     actionButton.setTitleColor(.white, for: .normal)
     actionButton.setTitle("Set status", for: .normal)
     actionButton.translatesAutoresizingMaskIntoConstraints = false
    
     actionButton.addTarget(self, action: #selector(actionButtonPressed), for: .touchUpInside)
    return actionButton
    }()
    
    private let avatar: UIImageView = {
        let avatar = UIImageView()
        avatar.contentMode = .scaleAspectFill
        avatar.image = #imageLiteral(resourceName: "ava")
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = UIColor.white.cgColor

        avatar.translatesAutoresizingMaskIntoConstraints = false
        return avatar
    }()
    
    
    @objc private func actionButtonPressed() {
        currentStatus.text = statusText
        print(currentStatus.text ?? "no status")
    }
    
    @objc private func statusTextChange(_ newStatus: UITextField) {
           statusText = String(newStatus.text!)
           print(statusText ?? " ")
    }
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupViews()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        avatar.layer.cornerRadius = 100 / 2
        avatar.clipsToBounds = true
        
    }
    
    
    fileprivate func setupViews() {
        contentView.addSubview(userName)
        contentView.addSubview(newStatus)
        contentView.addSubview(currentStatus)
        contentView.addSubview(actionButton)
        contentView.addSubview(avatar)
        
        //newStatus.leftView = spaceView
        //contentView.addSubview(spaceView)
        

    let constraints = [
                
        avatar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
        avatar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
        avatar.heightAnchor.constraint(equalToConstant: 100),
        avatar.widthAnchor.constraint(equalToConstant: 100),
        
        userName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 26),
        userName.leadingAnchor.constraint(equalTo: avatar.leadingAnchor, constant: 120),
        
        currentStatus.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 26),
        currentStatus.leadingAnchor.constraint(equalTo: userName.leadingAnchor),
        
        newStatus.topAnchor.constraint(equalTo: currentStatus.bottomAnchor, constant: 10),
        newStatus.leadingAnchor.constraint(equalTo: currentStatus.leadingAnchor),
        newStatus.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        newStatus.heightAnchor.constraint(equalToConstant: 40),
        
        actionButton.topAnchor.constraint(equalTo: newStatus.bottomAnchor, constant: 10),
        actionButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
        actionButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        
        
        
        /*
                //spaceView.topAnchor.constraint(equalTo: newStatus.topAnchor, constant: 8),
                //spaceView.leadingAnchor.constraint(equalTo: newStatus.leadingAnchor, constant: 10),
                //spaceView.widthAnchor.constraint(equalToConstant: 20),
                //spaceView.bottomAnchor.constraint(equalTo: newStatus.bottomAnchor),
                
                
        */
            ]
            
            NSLayoutConstraint.activate(constraints)
        }
 
}
    
