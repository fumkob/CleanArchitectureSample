//
//  Nib.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/05.
//

import UIKit

public protocol NibType {
    associatedtype View
    var nib: UINib { get }
    var bundle: Bundle { get }
    var name: String { get }
}

public struct Nib<T: UIView>: NibType {
    public typealias View = T
    public let nib: UINib
    public let bundle: Bundle
    public let name: String
    
    public init() {
        let type: AnyClass = View.classForCoder()
        bundle = Bundle(for: type)
        name = String(describing: type).components(separatedBy: ".").last!
        nib = UINib(nibName: name, bundle: bundle)
    }
    
    public func view() -> T {
        guard let setView = nib.instantiate(withOwner: nil, options: nil).first as? T else {
            fatalError("Unexpected error in Nib")
        }
        return setView
    }
}
