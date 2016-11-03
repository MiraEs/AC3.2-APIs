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
    //var sortedNationalityKeys: [String]
    //var sortedFieldKeys: [String]
    
    let minResults: Int = 1
    let maxResults: Int = 100
    
    // SwitchCellDicts
    /*var userNationalitySwitchStatus: [UserNationality : Bool] = [
        UserNationality.AU : true, UserNationality.BR: true,
        UserNationality.CA : true, UserNationality.CH : true,
        UserNationality.DE : true, UserNationality.DK : true,
        UserNationality.ES : true, UserNationality.FI : true,
        UserNationality.FR : true, UserNationality.GB : true,
        UserNationality.IE : true, UserNationality.IR : true,
        UserNationality.NL : true, UserNationality.NZ : true,
        UserNationality.TR : true, UserNationality.US : true
    ]
    var userFieldsSwitchStatus: [UserField : Bool] = [
        UserField.gender : true, UserField.name : true,
        UserField.location : true, UserField.email : true,
        UserField.login : true, UserField.id : true,
        UserField.picture : true, UserField.nat : true
    ]
 */
    
    //
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
        switch segmentIndex {
        case 0:
            self.gender = .female
        case 1:
            self.gender = .male
        default:
            self.gender = .both
        }
    }
    
    /*/switch functions
    //This [String] should be the keys for the userNationalitySwitchStatus/userFieldSwitchStatus sorted alphabetically, in ascending order.
    func userNationality(nationality: [UserNationality]) -> [UserNationality] {
        func forward(_ s1: String, _ s2: String) -> Bool {
            return s1 < s2
        }
        nationality.sorted(by: forward)
    }
 */
    
    
    
    //MARK: Delegate functions
    
    //function called from slideCell protocol
    func changedTheSliderTo(value: Int) {
        self.updateNumberOfResults(value)
        
    }
    
    //function called from segmentedCell protocol
    func changeSegmentControl(segmentIndex: Int) {
        self.updateGender(segmentIndex)
    }
    
    //function called from switchCell protocol
    /*
    func selectionDidChange(option: String, value: Bool) {
        return
    }
 */
}

