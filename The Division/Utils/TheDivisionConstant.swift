//
//  TheDivisionConstant.swift
//  The Division
//
//  Created by MTMAC16 on 31/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation

enum DeploymentKind {
    case PROD
    case STAG
}

class TheDivisionConstant {
    static var BASE_URL: String {
        if let baseUrl = Bundle.main.infoDictionary![DEPLOYMENT_KIND == .STAG ? "STAG_BASE_URL" : "PROD_BASE_URL"] as? String {
            return baseUrl
        } else {
            return ""
        }
    }
    
    static var DEPLOYMENT_KIND: DeploymentKind = .STAG
}
