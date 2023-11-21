//
//  WishMakerController.swift
//  dperednyaPW2
//
//  Created by Danil Perednja on 21.11.2023.
//

import UIKit

final class WishMakerViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        configureUI()
    }
    
    let heading = UILabel()
    
    
    private func configureUI() {
        view.backgroundColor = .systemPink
        
        configureTitle()
        configureDescription()
        configureSliders()
    }
    
    private func configureTitle() {
        // make it a private field titleView above viewDidLoad()
        heading.translatesAutoresizingMaskIntoConstraints = false
        heading.text = "WishMaker"
        heading.font = UIFont.systemFont(ofSize: 32, weight: UIFont.Weight.bold)
        heading.textColor = .white
        
        view.addSubview(heading)
        NSLayoutConstraint.activate([
            heading.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            heading.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            heading.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30)
        ])
    }
    
    private func configureDescription() {
        let description = UILabel() // make it a private field titleView above viewDidLoad()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.text = "This description describes the WishMaker app"
        description.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.regular)
        description.textColor = .white
        
        view.addSubview(description)
        NSLayoutConstraint.activate([
            description.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            description.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            description.topAnchor.constraint(equalTo: heading.bottomAnchor, constant: 20)
        ])
    }
    
    private func configureSliders() {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        view.addSubview(stack)
        stack.layer.cornerRadius = 20
        stack.clipsToBounds = true
        
        let sliderRed = CustomSlider(title: "Red", min: 0, max: 255)
        let sliderBlue = CustomSlider(title: "Blue", min: 0, max: 255)
        let sliderGreen = CustomSlider(title: "Green", min: 0, max: 255)
        
        for slider in [sliderRed, sliderBlue, sliderGreen] {
            stack.addArrangedSubview(slider)
        }
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])
        
        
        sliderRed.valueChanged = { [weak self] value in
            let newColor = UIColor(
                red: CGFloat(sliderRed.slider.value / 255),
                green: CGFloat(sliderGreen.slider.value / 255),
                blue: CGFloat(sliderBlue.slider.value / 255),
                alpha: CGFloat(1.0)
            )
            self?.view.backgroundColor = newColor
        }
        
        sliderGreen.valueChanged = { [weak self] value in
            let newColor = UIColor(
                red: CGFloat(sliderRed.slider.value / 255),
                green: CGFloat(sliderGreen.slider.value / 255),
                blue: CGFloat(sliderBlue.slider.value / 255),
                alpha: CGFloat(1.0)
            )
            self?.view.backgroundColor = newColor
        }
        
        sliderBlue.valueChanged = { [weak self] value in
            let newColor = UIColor(
                red: CGFloat(sliderRed.slider.value / 255),
                green: CGFloat(sliderGreen.slider.value / 255),
                blue: CGFloat(sliderBlue.slider.value / 255),
                alpha: CGFloat(1.0)
            )
            self?.view.backgroundColor = newColor
        }
    }
}


