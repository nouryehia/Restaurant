/* MenuItem.swift
 Restaurant
 Lets user place an order from a menu obtained from a local server.
 --------------------------------------------------------------------------
 OpenRestaurant (included in project file) MUST BE RUNNING FOR APP TO WORK.
 --------------------------------------------------------------------------
 Created by Nour Yehia on 9/5/18.
 Copyright © 2018 Nour Yehia. All rights reserved. */

import Foundation

// ADD COMMENTS!!!!!!
struct MenuItem: Codable {
    
    var id: Int
    var name: String
    var description: String
    var price: Double
    var category: String
    var imageURL: URL
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case price
        case category
        case imageURL = "image_url"
    }
}

struct MenuItems: Codable {
    let items: [MenuItem]
}
