//
//  Endpoint.swift
//  The Division
//
//  Created by MTMAC16 on 31/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation

class EndpointUrl {
    static var REGISTER: String {
        get {
            return TheDivisionConstant.BASE_URL + "/auth/register"
        }
    }
    
    static var LOGIN: String {
        get {
            return TheDivisionConstant.BASE_URL + "/auth/token"
        }
    }
}
