//
//  ViewController.swift
//  SpringAppHW
//
//  Created by Данис Гаязов on 21.7.24..
//

import UIKit
import SpringAnimation

final class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var animationView: SpringView!
    @IBOutlet weak var triggerButton: SpringButton!
    
    // MARK: - Private Properties
    private var animationSettings: [AnimationParameter: Any] = [:]
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        animationSettings = Settings.newRandomAnimationSettings
        updateSettingsLabel(with: animationSettings)
    }
    
    // MARK: - IB Actions
    @IBAction func startAnimation() {
        applyAnimationSettings(animationSettings)
        updateSettingsLabel(with: animationSettings)
        
        animationSettings = Settings.newRandomAnimationSettings
        triggerButton.setTitle(
            "Run \(animationSettings[AnimationParameter.preset] as? String ?? "")",
            for: .normal
        )
    }
    
    // MARK: - Private Methods
    private func applyAnimationSettings(_ settings:[AnimationParameter : Any]) {
        let preset = animationSettings[.preset] as? String ?? "pop"
        let curve = settings[.curve] as? String ?? "spring"
        let force = settings[.force] as? CGFloat ?? 1
        let duration = settings[.duration]  as? CGFloat ?? 1
        let delay = settings[.delay]  as? CGFloat ?? 1
        
        let animationObjects: [Springable] = [animationView, triggerButton]
        
        for animationObject in animationObjects {
            animationObject.animation = preset
            animationObject.curve = curve
            animationObject.force = force
            animationObject.duration = duration
            animationObject.delay = delay
            animationObject.animate()
        }
    }
    private func updateSettingsLabel(with animation: [AnimationParameter: Any]) {
        settingsLabel.text = """
            preset: \(animation[.preset] ?? "pop")
            curve: \(animation[.curve] ?? "spring")
            force: \(formatValue(animation[.force] as? CGFloat ?? 1))
            duration: \(formatValue(animation[.duration] as? CGFloat ?? 1))
            delay: \(formatValue(animation[.delay] as? CGFloat ?? 1))
            """
    }
}

// MARK: - ViewController
extension ViewController {
    func formatValue(_ value: CGFloat) -> String {
        return String(format: "%.2f", value)
    }
}
