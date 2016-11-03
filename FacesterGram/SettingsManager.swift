//
//  SettingsManager.swift
//  FacesterGram
//
//  Created by Ilmira Estil on 10/27/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

enum UserGender: String {
    case male, female, both
}

enum UserNationality: String {
    case AU, BR, CA, CH, DE, DK, ES, FI, FR, GB, IE, IR, NL, NZ, TR, US, all
}

enum UserField: String {
    case gender, name, location, email, login, id, picture, nat, none
}

internal class SettingManager: SliderCellDelegate, SegmentedCellDelegate {
    var results: Int
    var gender: UserGender
    var nationality: UserNationality
    var excluded: UserField
    
    let minResults: Int = 1
    let maxResults: Int = 200
    
    static let manager: SettingManager = SettingManager()
    private init() {
        self.results = 1
        self.gender = .female
        self.nationality = .AU
        self.excluded = .name
    }
    
    //slider function
    func updateNumberOfResults(_ results: Int) {
        if results < minResults {
            self.results =  minResults
        } else if results > maxResults {
            self.results = maxResults
        } else {
            self.results = results
        }
    }
    
    //segmented functions
    func updateGender(_ segmentIndex: Int) {
        switch results {
        case 0:
            self.gender = .both
        case 1:
            self.gender = .male
        default:
            self.gender = .female
        }
    }
    
    //MARK: Delegate functions
    //function called from slideCell protocol
    func changedTheSliderTo(value: Int) {
        self.updateNumberOfResults(value)
    }
    
    //function called from segmentedCell protocol
    func changeSegmentControl(segmentIndex: Int) {
        self.updateGender(segmentIndex)
    }
    
}

