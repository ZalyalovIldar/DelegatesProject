//
//  File.swift
//  VkProfileAzat
//
//  Created by Азат Алекбаев on 01.10.17.
//  Copyright © 2017 Азат Алекбаев. All rights reserved.
//

import Foundation
enum CoreSections {
    case status
    case mainInfo
    case contacts
    case career
    case education
    case gifts
    case threeButtons
}
protocol CoreVariables {
    var sectionType: CoreSections{get}
    var sectionName: String {get}
    var rowCount: Int {get}
}
struct CoreModelOfContacts: CoreVariables {
    var sectionType: CoreSections {
        return .contacts
    }
    var sectionName: String {
        return "Контакты"
    }
    var contacts: [Contacts]
    
    var rowCount: Int {
        return contacts.count
    }
    
}

struct CoreModelOfMainInfo: CoreVariables {
    var sectionType: CoreSections {
        return .mainInfo
    }
    var mainInfo:[MainInfo]
    
    var rowCount: Int {
        return mainInfo.count
    }
    
    var sectionName: String {
        return " "
        
    }
    
}
struct CoreModelOfCareer: CoreVariables {
    var companyName: String
    var location: String
    var position: String
    
    var sectionType: CoreSections {
        return .career
    }
    
    var sectionName: String {
        return "Карьера"
    }
    var rowCount: Int {
        return 1
    }
}
struct CoreModelOfEducation: CoreVariables {
    var sectionType: CoreSections {
        return .education
    }
    
    var sectionName: String {
        return "Образование"
    }
    var educationArray:[Education]
    
    var rowCount: Int {
        return educationArray.count
    }
}
struct CoreModelofThreeButtons: CoreVariables {
    var sectionType: CoreSections {
        return .threeButtons
    }
    
    var sectionName: String {
        return " "
    }
    var threeButtons:[ThreeButtons]
    
    var rowCount: Int {
        return threeButtons.count
    }
}
struct CoreModelOfGifts: CoreVariables {
    var sectionType: CoreSections {
        return .gifts
    }
    var sectionName: String {
        return "Подарки"
    }
    
    var rowCount: Int {
        return 1
    }
    var numberOfPresets = randomNumberForGift
}
struct CoreModelOfStatus: CoreVariables {
    var sectionType: CoreSections {
        return .status
    }
    
    var sectionName: String {
        return " "
    }
    
    var rowCount: Int {
        return 1
    }
    var status: String
}
