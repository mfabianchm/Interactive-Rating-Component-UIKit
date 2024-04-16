//
//  ThanksVC.swift
//  Interactive-Rating-Component
//
//  Created by Marcos Fabian Chong Megchun on 15/04/24.
//

import UIKit

class ThanksVC: UIViewController {
    
    let cardView = UIView()
    let imageView = UIImageView()
    let selectedValueLabel = UILabel()
    let thankyouLabel = UILabel()
    let messageLabel = UILabel()
    
    var ratingValue: String
    
    init(ratingValue: String) {
        self.ratingValue = ratingValue
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Very-Dark-Blue")
        print(ratingValue)
        addSubviews()
        configureCardView()
        configureImage()
        configureSelectedValueLabel()
        configureThankyouLabel()
        configureMessageLabel()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        if let firstVC = presentingViewController as? ViewController {
            DispatchQueue.main.async {
                firstVC.ratingNumber = nil
                firstVC.errorMessage.removeFromSuperview()
            }
        }
        
    }
    
    func addSubviews() {
        cardView.addSubview(imageView)
        cardView.addSubview(imageView)
        cardView.addSubview(selectedValueLabel)
        cardView.addSubview(thankyouLabel)
        cardView.addSubview(messageLabel)
    }
    
    func configureCardView() {
        view.addSubview(cardView)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        cardView.backgroundColor = UIColor(named: "Dark-Blue")
        cardView.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardView.heightAnchor.constraint(equalToConstant: 420),
            cardView.widthAnchor.constraint(equalToConstant: 350)
        ])
    }
    
    func configureImage() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "illustration-thank-you")
        imageView.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20),
            imageView.heightAnchor.constraint(equalToConstant: 180),
            imageView.widthAnchor.constraint(equalToConstant: 180)
        ])
    }
    
    func configureSelectedValueLabel() {
        selectedValueLabel.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(selectedValueLabel)
        
        selectedValueLabel.text = "You selected \(self.ratingValue) out of 5"
        selectedValueLabel.layer.cornerRadius = 20
        selectedValueLabel.backgroundColor = UIColor(named: "Dark-Grey")
        selectedValueLabel.textColor = UIColor(named: "Orange")
        selectedValueLabel.textAlignment = .center
        selectedValueLabel.layer.masksToBounds = true
        selectedValueLabel.font = UIFont(name: "Overpass-Medium", size: 16)
        
        NSLayoutConstraint.activate([
            selectedValueLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            selectedValueLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            selectedValueLabel.widthAnchor.constraint(equalToConstant: 200),
            selectedValueLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureThankyouLabel() {
        cardView.addSubview(thankyouLabel)
        thankyouLabel.translatesAutoresizingMaskIntoConstraints = false
        thankyouLabel.text = "Thank you!"
        thankyouLabel.textColor = .white
        thankyouLabel.font = UIFont(name: "Overpass-Bold", size: 30)
        
        NSLayoutConstraint.activate([
            thankyouLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            thankyouLabel.topAnchor.constraint(equalTo: selectedValueLabel.bottomAnchor, constant: 20),
        ])
    }
    
    func configureMessageLabel() {
        cardView.addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.text = "We aprecciate you taking the time to give a rating. If you ever need more support, don't hesitate to get in touch!"
        messageLabel.textColor = UIColor(named: "Medium-Grey")
        messageLabel.font = UIFont(name: "Overpass-Medium", size: 16)
        messageLabel.numberOfLines = 3
        messageLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            messageLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            messageLabel.topAnchor.constraint(equalTo: thankyouLabel.bottomAnchor, constant: 15),
            messageLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
        ])
    }
    

}
