//
//  ViewController.swift
//  dizemlianukhinPW1
//
//  Created by Denis Zemlyanukhin on 12.10.2024.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Variables
    @IBOutlet var views: [UIView]!
    @IBOutlet var button: UIButton!
    
    // MARK: - Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonWasPressed(button)
    }
    
    // MARK: - Methods
    @IBAction func buttonWasPressed(_ sender: UIButton) {
        button.isEnabled = false
        for view in views {
            animateView(view: view)
        }
    }
    
    // MARK: - Private methods
    private func getUniqueRandomColors(amount: Int) -> Set<UIColor> {
        var colors = Set<UIColor>()
        while colors.count != amount {
            let randomColor = UIColor.init(red: .random(in: 0...1),
                                           green: .random(in: 0...1),
                                           blue: .random(in: 0...1),
                                           alpha: 1.0)
            colors.insert(randomColor)
        }
        
        return colors
    }
    
    private func changeViewColor(view: UIView) -> Void {
        var color = getUniqueRandomColors(amount: 1)
        view.backgroundColor = color.removeFirst()
    }
    
    private func changeViewCornerRadius(view: UIView) -> Void {
        view.layer.cornerRadius = .random(in: 0...25)
    }
    
    private func animateView(view: UIView) -> Void {

        UIView.animate(withDuration: .random(in: 0...2.5), animations: {
            self.changeViewColor(view: view)
            self.changeViewCornerRadius(view: view)
        },
            completion: { [weak self] _ in
            self?.button.isEnabled = true
            })
    }
    
}

