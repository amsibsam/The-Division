//
//  TeamDataManager.swift
//  The Division
//
//  Created by MTMAC16 on 16/08/18.
//  Copyright © 2018 bism. All rights reserved.
//

import Foundation

class TeamDataManager: TeamDataManagerInputProtocol {
    var interactor: TeamDataManagerOutputProtocol?
    
    func getTeamMember(on team: TeamDivision) {
        switch team {
        case .Acara:
            interactor?.onGetMemberSucceeded(with: generateAcaraMember())
        case .Keamanan:
            interactor?.onGetMemberSucceeded(with: generateKeamananMember())
        case .Perlengkapan:
            interactor?.onGetMemberSucceeded(with: generateTransportationMember())
        case .Transportation:
            interactor?.onGetMemberSucceeded(with: generateTransportationMember())
        }
    }
    
    private func generateTransportationMember() -> [Member]{
        var members: [Member] = []
        
        members.append(Member(name: "Sule", missionCount: 4, avatarURL: URL(string: "https://www.w3schools.com/howto/img_avatar.png")!))
        members.append(Member(name: "Aziz", missionCount: 10, avatarURL: URL(string: "https://www.w3schools.com/howto/img_avatar.png")!))
        members.append(Member(name: "Andre", missionCount: 5, avatarURL: URL(string: "https://www.w3schools.com/howto/img_avatar.png")!))
        members.append(Member(name: "Parto", missionCount: 1, avatarURL: URL(string: "https://www.w3schools.com/howto/img_avatar.png")!))
        members.append(Member(name: "Nunung", missionCount: 0, avatarURL: URL(string: "https://www.w3schools.com/howto/img_avatar.png")!))
        
        return members
    }
    
    private func generateAcaraMember() -> [Member] {
        var members: [Member] = []
        
        members.append(Member(name: "Pasha", missionCount: 10, avatarURL: URL(string: "https://www.w3schools.com/howto/img_avatar.png")!))
        members.append(Member(name: "Enda", missionCount: 3, avatarURL: URL(string: "https://www.w3schools.com/howto/img_avatar.png")!))
        members.append(Member(name: "Onci", missionCount: 4, avatarURL: URL(string: "https://www.w3schools.com/howto/img_avatar.png")!))
        members.append(Member(name: "Rowman", missionCount: 7, avatarURL: URL(string: "https://www.w3schools.com/howto/img_avatar.png")!))
        members.append(Member(name: "Makki", missionCount: 4, avatarURL: URL(string: "https://www.w3schools.com/howto/img_avatar.png")!))
        
        return members
    }
    
    private func generateKeamananMember() -> [Member] {
        var members: [Member] = []
        
        members.append(Member(name: "Dedy", missionCount: 8, avatarURL: URL(string: "https://www.w3schools.com/howto/img_avatar.png")!))
        members.append(Member(name: "Ade", missionCount: 8, avatarURL: URL(string: "https://www.w3schools.com/howto/img_avatar.png")!))
        members.append(Member(name: "Agung", missionCount: 10, avatarURL: URL(string: "https://www.w3schools.com/howto/img_avatar.png")!))
        members.append(Member(name: "Joe", missionCount: 20, avatarURL: URL(string: "https://www.w3schools.com/howto/img_avatar.png")!))
        members.append(Member(name: "Yayan", missionCount: 99999999, avatarURL: URL(string: "https://www.w3schools.com/howto/img_avatar.png")!))
        members.append(Member(name: "Dozen", missionCount: 10, avatarURL: URL(string: "https://www.w3schools.com/howto/img_avatar.png")!))
        
        return members
    }
    
    private func perlengkapanMember() -> [Member] {
        var members: [Member] = []
        
        members.append(Member(name: "Radit", missionCount: 10, avatarURL: URL(string: "https://www.w3schools.com/howto/img_avatar.png")!))
        members.append(Member(name: "Ricis", missionCount: 15, avatarURL: URL(string: "https://www.w3schools.com/howto/img_avatar.png")!))
        members.append(Member(name: "Atta", missionCount: 9, avatarURL: URL(string: "https://www.w3schools.com/howto/img_avatar.png")!))
        
        return members
    }
}

public enum TeamDivision: String {
    case Transportation = "Transportation"
    case Acara = "Acara"
    case Keamanan = "Keamanan"
    case Perlengkapan = "Perlengkapan"
}
