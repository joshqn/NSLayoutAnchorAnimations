//
//  ViewController.swift
//  NSLayoutAnchorAnimations
//
//  Created by Joshua Kuehn on 5/20/16.
//  Copyright © 2016 Joshua Kuehn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let view1 = UIView()
  
  var activeConstraints = [NSLayoutConstraint]() {
    willSet {
      NSLayoutConstraint.deactivateConstraints(activeConstraints)
    }
    didSet {
      NSLayoutConstraint.activateConstraints(activeConstraints)
    }
  }
  
  var startingConstraints = [NSLayoutConstraint]()
  var centerConstraints = [NSLayoutConstraint]()
  var leftConstraints = [NSLayoutConstraint]()
  var rightConstraints = [NSLayoutConstraint]()
  var center = UIButton(type: .System)
  var bottomLeft = UIButton(type: .System)
  var bottomRight = UIButton(type: .System)

  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.addSubview(center)
    center.translatesAutoresizingMaskIntoConstraints = false
    center.setTitle("Center", forState: .Normal)
    center.addTarget(self, action: #selector(centerPressed), forControlEvents: .TouchUpInside)
    center.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor).active = true
    center.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
    
    self.view.addSubview(bottomLeft)
    bottomLeft.translatesAutoresizingMaskIntoConstraints = false
    bottomLeft.setTitle("Bottom Left", forState: .Normal)
    bottomLeft.addTarget(self, action: #selector(leftPressed), forControlEvents: .TouchUpInside)
    bottomLeft.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor).active = true
    bottomLeft.leadingAnchor.constraintEqualToAnchor(self.view.layoutMarginsGuide.leadingAnchor).active = true
    
    self.view.addSubview(bottomRight)
    bottomRight.translatesAutoresizingMaskIntoConstraints = false
    bottomRight.setTitle("Bottom Right", forState: .Normal)
    bottomRight.addTarget(self, action: #selector(rightPressed), forControlEvents: .TouchUpInside)
    bottomRight.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor).active = true
    bottomRight.trailingAnchor.constraintEqualToAnchor(self.view.layoutMarginsGuide.trailingAnchor).active = true
    
    self.view.addSubview(view1)
    view1.backgroundColor = UIColor.redColor()
    view1.translatesAutoresizingMaskIntoConstraints = false
    
    view1.heightAnchor.constraintEqualToConstant(200).active = true
    view1.widthAnchor.constraintEqualToConstant(200).active = true
    
    startingConstraints = [
      view1.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor),
      view1.topAnchor.constraintEqualToAnchor(self.view.bottomAnchor)
    ]
    
    centerConstraints = [
      view1.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor),
      view1.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor)
    ]
    
    leftConstraints = [
      view1.leadingAnchor.constraintEqualToAnchor(self.view.layoutMarginsGuide.leadingAnchor),
      view1.bottomAnchor.constraintEqualToAnchor(self.view.bottomAnchor,constant: -15)
    ]
    
    rightConstraints = [
      view1.trailingAnchor.constraintEqualToAnchor(self.view.layoutMarginsGuide.trailingAnchor),
      view1.bottomAnchor.constraintEqualToAnchor(self.view.bottomAnchor,constant: -15)
    ]
    
    activeConstraints = startingConstraints
    
  }
  
  func centerPressed() {
    activeConstraints = centerConstraints
    UIView.animateWithDuration(0.33, animations: {
      self.view.layoutIfNeeded()
    })
  }
  
  func leftPressed() {
    activeConstraints = leftConstraints
    UIView.animateWithDuration(0.33, animations: {
      self.view.layoutIfNeeded()
    })
  }
  
  func rightPressed() {
    activeConstraints = rightConstraints
    UIView.animateWithDuration(0.33, animations: {
      self.view.layoutIfNeeded()
    })
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

