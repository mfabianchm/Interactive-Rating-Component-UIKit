//
//  ViewController.swift
//  Interactive-Rating-Component
//
//  Created by Marcos Fabian Chong Megchun on 14/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    let cardView = UIView()
    let imageContainer = UIView(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
    let starImage = UIImageView()
    let questionLabel = UILabel()
    let descriptionLabel = UILabel()
    let buttonsStack = UIStackView()
    let submitButton = UIButton()
    let errorMessage = UILabel()
    
    let buttonsValues: [String] = ["1", "2", "3", "4", "5"]
    var ratingNumber: String?
    var buttons: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Very-Dark-Blue")
        configureCardView()
        configureStarImage()
        configureLabels()
        self.buttons = createButtons()
        configureButtons()
        configureSubmitButton()
    }
    
    func createButtons () -> [UIButton] {
        var buttonsArray: [UIButton] = []
        buttonsValues.forEach { value in
            let button = UIButton(type: .custom)
            button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
            button.layer.cornerRadius = 0.5 * button.bounds.size.width
            button.clipsToBounds = true
            button.setTitle(value, for: .normal)
            button.setTitleColor(UIColor(named: "Medium-Grey"), for: .normal)
            button.backgroundColor = UIColor(named: "Dark-Grey")
            button.titleLabel?.font =  UIFont(name: "Overpass-Bold", size: 16)
            
            buttonsArray.append(button)
        }
        return buttonsArray
    }
    
    
    func configureCardView() {
        view.addSubview(cardView)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.backgroundColor = UIColor(named: "Dark-Blue")
        cardView.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cardView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    func configureStarImage () {
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        imageContainer.backgroundColor = UIColor(named: "Dark-Grey")
        imageContainer.layer.cornerRadius = imageContainer.frame.width/2
        imageContainer.clipsToBounds = true
        cardView.addSubview(imageContainer)
        starImage.translatesAutoresizingMaskIntoConstraints = false
        starImage.image = UIImage(named: "icon-star")
        starImage.contentMode = .scaleAspectFit
        imageContainer.addSubview(starImage)
        NSLayoutConstraint.activate([
            imageContainer.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            imageContainer.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20),
            imageContainer.widthAnchor.constraint(equalToConstant: 70),
            imageContainer.heightAnchor.constraint(equalToConstant: 70),
            
            starImage.heightAnchor.constraint(equalToConstant: 30),
            starImage.widthAnchor.constraint(equalToConstant: 30),
            starImage.centerXAnchor.constraint(equalTo: imageContainer.centerXAnchor),
            starImage.centerYAnchor.constraint(equalTo: imageContainer.centerYAnchor)
        ])
    }
    
    func configureLabels() {
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        questionLabel.text = "How did we do?"
        descriptionLabel.text = "Please let us know how we did with your support request. All feedback is appreciated to help us improve our offering!"
        
        questionLabel.textColor = .white
        descriptionLabel.textColor = UIColor(named: "Medium-Grey")
        
        questionLabel.font = UIFont(name: "Overpass-Bold", size: 30)
        descriptionLabel.font = UIFont(name: "Overpass-Medium", size: 14)
        
        descriptionLabel.numberOfLines = 3
        
        cardView.addSubview(questionLabel)
        cardView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: imageContainer.bottomAnchor, constant: 20 ),
            questionLabel.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor),
            questionLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            
            descriptionLabel.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 14),
            descriptionLabel.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20)
        ])
    }
    
    @objc func setRatingNumber (sender: UIButton) {
        let title: String = sender.currentTitle!
        self.ratingNumber = title
        
        for btn in buttons {
            if btn == sender {
                btn.backgroundColor = UIColor(named: "Medium-Grey")
                btn.setTitleColor(.white, for: .normal)
            } else {
                btn.backgroundColor = UIColor(named: "Dark-Grey")
                btn.setTitleColor(UIColor(named: "Medium-Grey"), for: .normal)
            }
        }
    }
    
    func configureButtons() {
        buttonsStack.translatesAutoresizingMaskIntoConstraints = false
        buttonsStack.axis = .horizontal
        buttonsStack.spacing = 20
        buttonsStack.distribution = .fillEqually
        buttonsStack.alignment = .fill
        
        cardView.addSubview(buttonsStack)
        
        buttons.forEach{ button in
            button.addTarget(self, action: #selector(setRatingNumber), for: .touchUpInside)
            buttonsStack.addArrangedSubview(button)
        }
        
        
        NSLayoutConstraint.activate([
            buttonsStack.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            buttonsStack.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            buttonsStack.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            buttonsStack.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureSubmitButton() {
        cardView.addSubview(submitButton)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.setTitle("SUBMIT", for: .normal)
        submitButton.backgroundColor = UIColor(named: "Orange")
        submitButton.layer.cornerRadius = 30
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.titleLabel?.font = UIFont(name: "Overpass-Bold", size: 16)
        submitButton.addTextSpacing(2)
        submitButton.addTarget(self, action: #selector(navigateToModal), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            submitButton.topAnchor.constraint(equalTo: buttonsStack.bottomAnchor, constant: 20),
            submitButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            submitButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            submitButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configureErrorMessage() {
        errorMessage.translatesAutoresizingMaskIntoConstraints = false
        errorMessage.text = "Please select a number!"
        errorMessage.textColor = .white
        view.addSubview(errorMessage)
        
        NSLayoutConstraint.activate([
            errorMessage.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 30),
            errorMessage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func navigateToModal() {
        guard let value = self.ratingNumber else {
            DispatchQueue.main.async {
                self.configureErrorMessage()
            }
            return
        }
        self.present(ThanksVC(ratingValue: value), animated: true)
    }

    
}

extension UIButton{
   func addTextSpacing(_ spacing: CGFloat){
       let attributedString = NSMutableAttributedString(string: title(for: .normal) ?? "")
       attributedString.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSRange(location: 0, length: attributedString.string.count))
       self.setAttributedTitle(attributedString, for: .normal)
   }
}

