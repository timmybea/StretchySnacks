//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Tim Beals on 2016-12-08.
//  Copyright © 2016 Tim Beals. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var myNavHeight: NSLayoutConstraint!
    @IBOutlet weak var myNavView: UIView!
    @IBOutlet weak var addButton: UIButton!
    var isNavUp = true
    var stackView: UIStackView!
    var foodArray = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSetup()
        self.makeStackView()
        
        
    }

    @IBAction func plusIconPressed(_ sender: UIButton)
    {
        UIView.animate(withDuration: 2,
                       delay: 0.0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.5,
                       options: UIViewAnimationOptions(rawValue: UInt(0)),
                       animations: {
                        
                        //adjust height of nav bar
                        if(self.isNavUp)
                        {
                            self.myNavHeight.constant = 200.0;
                            let angle = M_PI_4
                            self.addButton.transform = CGAffineTransform(rotationAngle: CGFloat(angle))
                            self.isNavUp = false
                            self.stackView.isHidden = false
                            self.myNavView.bringSubview(toFront: self.addButton)
                        }
                        else
                        {
                            self.myNavHeight.constant = 64.0
                            let angle = 0
                            self.addButton.transform = CGAffineTransform(rotationAngle: CGFloat(angle))
                            self.isNavUp = true
                            self.stackView.isHidden = true
                        }
                        self.view.layoutIfNeeded()
        })
    }
    
    func makeStackView() {
        
        stackView = UIStackView(arrangedSubviews: foodArray)
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.isHidden = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        myNavView.addSubview(stackView)

        stackView.leadingAnchor.constraint(equalTo: myNavView.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: myNavView.trailingAnchor, constant: -10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: myNavView.bottomAnchor, constant: -10).isActive = true
        stackView.topAnchor.constraint(equalTo: myNavView.topAnchor, constant: 20).isActive = true
        

        
        //Set top of table view to bottom of stack view
//        self.tableView.topAnchor.constraint(equalTo: myNavView.bottomAnchor).isActive = true


        
    }
    
    func dataSetup()
    {
        
        
        
        foodArray.append(UIImageView.init(image: (UIImage.init(named: "Oreos")!)))
        foodArray.append(UIImageView.init(image: UIImage.init(named: "PizzaPocket")!))
        foodArray.append(UIImageView.init(image: UIImage.init(named: "Popsicle")!))
        foodArray.append(UIImageView.init(image: UIImage.init(named: "PopTart")!))
        foodArray.append(UIImageView.init(image: UIImage.init(named: "Ramen")!))
    }
    
}

