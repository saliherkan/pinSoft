//
//  StoryboardInstantiate.swift
//  PinSoftApp
//
//  Created by Piksel on 19.12.2021.
//

import UIKit

enum Storyboard: String {
    case main = "Main"
    
}

protocol Instantiatable {
    static var storyboard: Storyboard { get }
    static func instantiate() -> Self
}

extension Instantiatable where Self: UIViewController {
    static func instantiate() -> Self {
        // swiftlint:disable force_cast
        UIStoryboard(storyboard).instantiateViewController(withIdentifier: String(describing: Self.self)) as! Self
    }
}

extension UIStoryboard {
    convenience init(_ storyboard: Storyboard) {
        self.init(name: storyboard.rawValue, bundle: nil)
    }
}
