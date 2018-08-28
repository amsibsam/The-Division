//
//  NoteProtocols.swift
//  The Division
//
//  Created MTMAC16 on 28/08/18.
//  Copyright © 2018 bism. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol NoteWireframeProtocol: class {

}
//MARK: Presenter -
protocol NotePresenterProtocol: class {

    var interactor: NoteInteractorInputProtocol? { get set }
}

//MARK: Interactor -
protocol NoteInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
}

protocol NoteInteractorInputProtocol: class {

    var presenter: NoteInteractorOutputProtocol?  { get set }

    /* Presenter -> Interactor */
}

//MARK: View -
protocol NoteViewProtocol: class {

    var presenter: NotePresenterProtocol?  { get set }

    /* Presenter -> ViewController */
}
