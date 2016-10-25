//
//  User.swift
//  FacesterGram
//
//  Created by Louis Tur on 10/21/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

internal struct User {
    internal let firstName: String
    internal let lastName: String
    internal let city: String
    internal let state: String
    internal let username: String
    internal let emailAddress: String
    internal let id: [String:String]
    internal let thumbnailURL: String
    
    static func users(from data: Data) -> [User]? {
        do {
            let randomUserJSONData: Any = try JSONSerialization.jsonObject(with: data, options: [])
            
            //casting
            guard let randomUserCasted: [String: AnyObject] = randomUserJSONData as? [String: AnyObject],
                let randomUserArray: [AnyObject] = randomUserCasted["results"] as? [AnyObject] else { return nil }
            
            //parsing data
            var allUsers = [User]()
            randomUserArray.forEach({ userObject in
                guard let userNameDict: [String:Any] = userObject["name"] as? [String:Any],
                    let userFirstName: String = userNameDict["first"] as? String,
                    let userLastName: String = userNameDict["last"] as? String,
                    
                let location: [String:Any] = userObject["location"] as? [String:Any],
                    let userCity: String = location["city"] as? String,
                    let userState: String = location["state"] as? String,
                    let userEmailAddress: String = userObject["email"] as? String,
                    
                    
                    let login: [String:Any] = userObject["login"] as? [String:Any],
                    let userName: String = login["username"] as? String,
                    
                    let picture: [String:Any] = userObject["picture"] as? [String:Any],
                    let userThumbnailURLString: String = picture["thumbnail"] as? String,
                    
                    let userID: [String: String] = userObject["id"] as? [String:String]
                    
                    else { return }
                
                // append to our temp array
                allUsers.append(User(firstName: userFirstName, lastName: userLastName, city: userCity, state: userState, username: userName, emailAddress: userEmailAddress, id: userID, thumbnailURL: userThumbnailURLString))
                
            })
            
            return allUsers
          
        } catch _ as NSError {
            print("error")
        }
        return nil
        
    }
}
