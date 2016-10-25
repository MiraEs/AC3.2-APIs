//
//  APIRequestManager.swift
//  FacesterGram
//
//  Created by Louis Tur on 10/21/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

internal class APIRequestManager {
    
    //1. manager instance -- creates a "permanant constant" of a class via manager, instead of making multiple instances of class
    static let manager: APIRequestManager = APIRequestManager()
    //2. private init
    private init() {}
    
    //3. function - escaping helps validData (the data we want) to be used outside of the function
    func getRandomUserData(completion: @escaping ((Data?) -> Void)) {
        
        guard let url = URL(string: "https://randomuser.me/api/") else {return}
        //4. session
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
    
    
   
    
}
