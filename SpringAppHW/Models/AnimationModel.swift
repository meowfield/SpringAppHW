//
//  AnimationModel.swift
//  SpringAppHW
//
//  Created by Данис Гаязов on 22.7.24..
//

import UIKit
import SpringAnimation

enum AnimationParameter: String {
    case preset, curve, force, duration, delay
}

struct Settings {
    private static let badPresets = ["fadeOut", "zoomOut", "fall"]
    
    static var newRandomAnimationSettings: [AnimationParameter: Any] { [
        .force: CGFloat.random(in: 0.1...5),
        .duration: CGFloat.random(in: 0.1...5),
        .delay: CGFloat.random(in: 0.1...0.5),
        .curve: AnimationCurve.allCases.randomElement()?.rawValue ?? "spring",
        .preset: AnimationPreset.allCases.filter {
            !badPresets.contains($0.rawValue)
        }.randomElement()?.rawValue ?? "pop"
    ]
    }
    
}
