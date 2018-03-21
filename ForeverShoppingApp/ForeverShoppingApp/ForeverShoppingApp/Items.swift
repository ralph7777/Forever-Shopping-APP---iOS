//
//  Items.swift
//  ForeverShoppingApp
//
//  Created by Ralph on 3/7/18.
//  Copyright © 2018 Ralph. All rights reserved.
//

import Foundation


//Global variables:

//Welcome page pass-in variable
var isWoman: Bool = true

//Home page pass-in variable
var categoryIndex:Int = 0
//Index can be 0, 1, 2, three categories

////item List and item Detail page variables
let girlTop = [
    Item(name : "Tie-Dye Graphic Hoodie", price : "49.95", picture : "0000",description : "A cozy fleece sweatshirt featuring a hood with drawstrings, tie-dye print, logo graphic applique, pouch pocket and ribbed trim."),
    Item(name : "Must-Have Easy Tank", price : "14.95", picture : "0001",description : "A soft, drapey tank designed with a strappy V neckline, racerback, logo plaque at left hip and curved hem, Easy Fit."),
    Item(name : "Must-Have Crop T-Shirt", price : "16.95", picture : "0002",description : "A slim, but comfortable cropped tee with lettuce edges and crewneck, Slim Fit."),
]

let girlBottom = [
    Item(name : "Stretch Super Skinny Jeans", price : "49.50", picture : "0100",description : "Khaki pants in our signature slim fit with our skinniest leg opening, featuring stretch denim, faux pockets at front and iconic back pocket embroidery."),
    Item(name : "Stretch Boot Jeans", price : "49.50", picture : "0101",description : "Designed with a slim fit through the thigh and a wider hem below the ankle. Featuring a medium wash, fading and whiskering, five-pocket styling and iconic back pocket embroidery."),
    Item(name : "High-Rise Fleece Leggings", price : "29.95", picture : "0102",description : "Designed with Hollister's original graphic logo, the Iconic Logo Collection takes you back to our roots with applique and embroidery graphic techniques. These cozy fleece leggings feature our iconic logo embroidered at left hip, a drawstring waist and ribbed cuffs."),
]

let girlAcc = [
    Item(name : "Tie-Dye Backpack", price : "34.95", picture : "0200",description : "Great for when you're on-the-go, with a spacious main compartment and small zip-front compartment for additional storage. Featuring a top handle, two adjustable shoulder straps, allover tie-dye pattern and logo patch at front."),
    Item(name : "Lo Sneaker", price : "29.95", picture : "0201",description : "Beach-going, boardwalking, adventuring, etc. Wear the Hollister Lo wherever life takes you. This comfortable, goes-with-everything sneaker features a lace-up design, simple canvas upper and rubber sole. Part of Hollister's all-new, online-exclusive shoe collection for both guys and girls."),
    Item(name : "Logo Flip Flops", price : "9.95", picture : "0202",description : "Comfortable, wear-with-everything, rubber flip flops featuring logo graphics."),
]

let guyTop = [
    Item(name : "Hooded Denim Jacket", price : "99.95", picture : "1000",description : "A denim body with chest utility pockets, rips, fading and side welt pockets. Featuring a fleece hood with drawstrings and fleece sleeves with ribbed cuffs."),
    Item(name : "Stretch Pique Polo", price : "24.95", picture : "1001",description : "A comfortable polo made with supersoft cotton and Hollister Epic Flex stretch, featuring contrast interior placket and icon at left chest, Classic Fit."),
    Item(name : "Stretch Poplin Shirt", price : "39.95", picture : "1002",description : "A soft poplin shirt made with Hollister Epic Flex stretch, allover check pattern, pocket and icon at left chest and curved hem, Slim Fit."),
]

let guyBottom = [
    Item(name : "Epic Flex Skinny Jeans", price : "59.95", picture : "1100",description : "Designed with a skinny fit through the hip and thigh with a 12.75” leg opening, these ripped jeans are made with Hollister Epic Flex stretch for comfort, fading and five-pocket styling."),
    Item(name : "Epic Flex Boot Jeans", price : "49.95", picture : "1101",description : "Designed with a relaxed fit through the hip and thigh with a 17.25” leg opening, featuring light wash denim made with Hollister Epic Flex stretch, fading and whiskering, five-pocket styling and iconic back pocket embroidery."),
    Item(name : "Fleece Jogger Pants", price : "39.95", picture : "1102",description : "Comfortable joggers made with supersoft fleece fabric, logo detail down the side of each leg and ribbed cuffs."),
]

let guyAcc = [
    Item(name : "Sunski Dipsea Sunglasses", price : "55.00", picture : "1200",description : "Sunski Sunglasses, designed in California. Cool, classic, and inspired by the beach, each pair features Polarized lenses, certified UVA/B/400 protection, hand-polished polycarbonate frames, five-spoke durable hinges, a microfiber bag, and a carrying case. Sunksi Sunglasses donates a portion of their revenue to Save The Waves and Leave No Trace."),
    Item(name : "Logo Twill Dad Hat", price : "19.95", picture : "1201",description : "Designed with buttery soft twill fabric, logo embroidery at front and adjustable strap back closure."),
    Item(name : "D-Ring Belt", price : "19.95", picture : "1202",description : "A casual, textured belt designed with an embroidered icon and double D-ring buckle closure."),
]


//Signup page pass-in variable
//Indicate if logged in
var loggedIn: Bool = false
//Indicate the userName after log in
var userLName: String = "testLName"
var userFName: String = "testFName"
var userEmail: String = ""

//Global, Cart page pass-in variable
//Total price of items in cart
var totalPrice:Float = 0

//Global, cart items:
//var cart = [["item1","1.00"],["item2","2.00"]]
var cart : [Item] = []

//Checkout Page pass-in variable
//Indicate if been checked out
var isCheckedOut:Bool = false

//Global, accounts info:
//var cart = [["item1","1.00"],["item2","2.00"]]
var users : [User] = [
    User(firstName: "Ralph", lastName: "Zhang", email: "ralph@depaul.edu", password: "ralph"),
    User(firstName: "Iris", lastName: "Tan", email: "iris@depaul.edu", password: "iris")
]


class Item {
    var name : String
    var price : String
    var picture : String
    var description : String
    
    init(name : String, price : String, picture : String, description : String){
        self.name = name
        self.price = price
        self.picture = picture
        self.description = description
    }
}

class User {
    var lastName: String
    var firstName: String
    var email: String
    var password: String

    init(firstName: String, lastName: String, email: String, password: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
    }
}

