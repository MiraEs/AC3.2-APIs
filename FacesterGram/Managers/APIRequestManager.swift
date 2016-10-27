//
//  APIRequestManager.swift
//  FacesterGram
//
//  Created by Louis Tur on 10/21/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

enum UserGender: String {
    case male, female, both
}

enum UserNationality: String {
    case AU, BR, CA, CH, DE, DK, ES, FI, FR, GB, IE, IR, NL, NZ, TR, US, all
}

internal class APIRequestManager {
    
    //1. manager instance -- creates a "permanant constant" of a class via manager, instead of making multiple instances of class
    static let manager: APIRequestManager = APIRequestManager()
    //2. private init
    private init() {}
    
    //3. function - escaping helps validData (the data we want) to be used outside of the function
    func getRandomUserData(completion: @escaping ((Data?) -> Void)) {
        
        guard let url = URL(string: "https://randomuser.me/api/") else {return}
        //4. sessions
        let session = URLSession.init(configuration: .default)
        session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                print("Error encountered!: \(error!)")
            }
            //we got the data
            guard let validData: Data = data else {
                return
            }
            //get data outside of this funciton
            completion(validData) //what is completion? vs. callback
            
            }.resume()
    }
    
    
    //NEW FUNCTIONS: "filters" data based on new parameters (gender, nationality) when running random user (only gets random users based on these parameters)
    
    func getRandom(user: Int, gender: UserGender, nationality: UserNationality, completion: @escaping ((Data?) -> Void)) {
        
        //interpolations in URL string = API specific keys, it's what the API expects to see?
        let newURL: URL = URL(string: "https://randomuser.me/api/=\(user)&gender=\(gender.rawValue)&nat=\(nationality.rawValue)")!
        
        let session = URLSession.init(configuration: .default)
        session.dataTask(with: newURL) { (data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                print("Error encountered!: \(error?.localizedDescription)")
            }
            //we got the data
            guard let validData: Data = data else {
                return
            }
            //get data outside of this funciton
            completion(validData) //what is completion? vs. callback
            
            }.resume()
    }
    
    
    
   
    
}
