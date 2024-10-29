//
//  WishMakerViewController.swift
//  dizemlianukhinPW2
//
//  Created by Denis Zemlyanukhin on 28.10.2024.
//

import UIKit

final class WishMakerViewController: UIViewController {
    // MARK: - Constants
    private enum Constants {
        static let titleFontSize: CGFloat = 32
        static let titleHeight: CGFloat = 30
        
        static let descriptionFontSize: CGFloat = 16
        static let descriptionHeight: CGFloat = 10
        
        static let red: String = "Red"
        static let green: String = "Green"
        static let blue: String = "Blue"
        
        static let minValue: CGFloat = 0
        static let maxValue: CGFloat = 1
        
        static let cornerRadius: CGFloat = 20
        static let bottomAnchor: CGFloat = 40
        static let leadingAnchor: CGFloat = 20
    }
    
    // MARK: - Variables
    var titleView = UILabel()
    var descriptionView = UILabel()
    
    // MARK: - Private variables
    private var redValue: CGFloat = 0
    private var greenValue: CGFloat = 0
    private var blueValue: CGFloat = 0
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Private methods
    private func configureUI() {
        view.backgroundColor = .systemTeal
        
        configureTitle()
        configureDescription()
        configureSliders()
    }
    
    private func configureTitle() {
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.text = "Wish Maker"
        titleView.font = UIFont.boldSystemFont(ofSize: Constants.titleFontSize)
        titleView.textColor = .systemIndigo
        
        view.addSubview(titleView)
        NSLayoutConstraint.activate([
            titleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.leadingAnchor),
            titleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.titleHeight)
        ])
    }
    
    private func configureDescription() {
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        descriptionView.text = "Create a wish and share it with your friends"
        descriptionView.font = UIFont.systemFont(ofSize: Constants.descriptionFontSize)
        descriptionView.textColor = .systemPurple
        
        view.addSubview(descriptionView)
        NSLayoutConstraint.activate([
            descriptionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.leadingAnchor),
            descriptionView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: Constants.descriptionHeight)])
    }
    
    private func configureSliders() {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        view.addSubview(stack)
        stack.layer.cornerRadius = Constants.cornerRadius
        stack.clipsToBounds = true
        
        let sliderRed = CustomSlider(title: Constants.red, min: Constants.minValue, max: Constants.maxValue)
        let sliderGreen = CustomSlider(title: Constants.green, min: Constants.minValue, max: Constants.maxValue)
        let sliderBlue = CustomSlider(title: Constants.blue, min: Constants.minValue, max: Constants.maxValue)
        
        for slider in [sliderRed, sliderBlue, sliderGreen] {
            stack.addArrangedSubview(slider)
        }
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.leadingAnchor),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constants.bottomAnchor)
        ])
        
        sliderRed.valueChanged = { [weak self] value in
                    self?.redValue = CGFloat(value)
                    self?.updateBackgroundColor()
        }
                
        sliderGreen.valueChanged = { [weak self] value in
            self?.greenValue = CGFloat(value)
            self?.updateBackgroundColor()
        }
                
        sliderBlue.valueChanged = { [weak self] value in
            self?.blueValue = CGFloat(value)
            self?.updateBackgroundColor()
        }
    }
    
    private func updateBackgroundColor() {
        view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1)
    }
}
