//
//  LoginAccountWireframe.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/07.
//

protocol LoginAccountWireframe: class {
    var vc: LoginAccountViewController? { get set }
    
    func closeWindow()
}

public class LoginAccountWireframeImpl: LoginAccountWireframe {
    var vc: LoginAccountViewController?
    
    func closeWindow() {
        vc?.dismiss(animated: true, completion: nil)
    }
}
