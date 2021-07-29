//
//  Storage.swift
//  Navigation
//
//  Created by Komov Kirill on 22.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

struct Posting {
    var autor: String
    var description: String
    var image: String
    var numberOfLikes: Int
    var numberOfviews: Int
}


struct PostingSections {
    var posting: [Posting]
}

struct Posts {
    var example = "Likes"
    
    static let feedModel = [
        PostingSections(
            posting: [
                Posting(autor: "_k_real_", description: "King Kong is better then me! Today is a good day, the best day in my life, the day of the travel, sun, sea", image: "Kirill",  numberOfLikes: 350, numberOfviews: 500),
                Posting(autor: "Erika", description: "Black sea", image: "Erika",  numberOfLikes: 1200, numberOfviews: 1600),
                Posting(autor: "_slim_shevy_", description: "I believe a can fly", image: "Evelina",  numberOfLikes: 600, numberOfviews: 850),
                Posting(autor: "_eldar_ado_", description: "School...soon", image: "Eldar", numberOfLikes: 370, numberOfviews: 500)
                
        
        ])
    ]
}
