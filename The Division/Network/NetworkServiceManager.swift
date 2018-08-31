//
//  NetworkServiceManager.swift
//  The Division
//
//  Created by MTMAC16 on 31/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation
import Alamofire

class NetworkServiceManager: NetworkService {
    var delegate: NetworkServiceDelegate?
    
    //MARK: Authentication
    func register(name: String, password: String, passwordConfirmation: String, email: String) {
        let params: Parameters = [
            "name": name,
            "password": password,
            "password_confirmation": passwordConfirmation,
            "email": email
        ]
        
        Alamofire.request(EndpointUrl.REGISTER, method: .post, parameters: params).responseJSON { (response) in
            print("register response \(response)")
            self.validateResponse(response: response, onSuccess: { (value) in
                print("register value \(value)")
                self.delegate?.onRegisterSuccess?()
            }, onError: { (error) in
                
            })
        }
    }
    
    func login(username: String, password: String) {
        let params: Parameters = [
            "username": username,
            "password": password
        ]
        
        Alamofire.request(EndpointUrl.LOGIN, method: .post, parameters: params).responseJSON { (response) in
            print("login response \(response)")
            self.validateResponse(response: response, onSuccess: { (value) in
                if let accessToken = value["access_token"] as? String {
                    self.delegate?.onLoginSuccess?(accessToken: accessToken)
                } else {
                    self.delegate?.onError(with: "access token not found")
                }
            }, onError: { (error) in
                
            })
        }
    }
    
    private func validateResponse(response: DataResponse<Any>, onSuccess: ([String: Any]) -> Void, onError: (String) -> Void) {
        switch response.result {
        case .success(let value):
            if let jsonValue = value as? [String: Any] {
                onSuccess(jsonValue)
            } else {
                onError("response is not dictionary")
            }
            
        case .failure(let error):
            onError(error.localizedDescription)
        }
    }
}
