//
//  RatingControl.swift
//  HelloWorld
//
//  Created by XilongHuang on 27/10/2016.
//  Copyright © 2016 SeanDev. All rights reserved.
//

import UIKit

class RatingControl: UIView {

	let starCount = 5
	let spacing = 5
	var rating = 0 {
		didSet {
			setNeedsLayout()
		}
	}
	var ratingButtons = [UIButton]()
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		let emptyStarImage = UIImage(named: "star_empty")
		let filledStarImage = UIImage(named: "star_filled")
		
		for _ in 0..<starCount {
			let button = UIButton()
			button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchDown)
			button.setImage(emptyStarImage, for: .normal)
			button.setImage(filledStarImage, for: .selected)
			button.setImage(filledStarImage, for: [.selected, .highlighted])
			button.adjustsImageWhenHighlighted = false
			addSubview(button)
			ratingButtons += [button]
		}
	}

	func ratingButtonTapped(button: UIButton) {
		rating = ratingButtons.index(of: button)! + 1
		updateButtonSelectionStates()
	}
	
	
	func updateButtonSelectionStates() {
		for (index, button) in ratingButtons.enumerated() {
			// If the index of a button is less than the rating, that button should be selected.
			button.isSelected = index < rating
		}
	}
	
	override var intrinsicContentSize : CGSize{
		let buttonSize = Int(frame.size.height)
		let width = (buttonSize * starCount) + (spacing * (starCount - 1))
		return CGSize(width: width, height: buttonSize)
	}
	
	
	override func layoutSubviews() {
		let buttonSize = Int(frame.size.height)
		var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
		
		// Offset each button's origin by the length of the button plus spacing.
		for (index, button) in ratingButtons.enumerated() {
			buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
			button.frame = buttonFrame
		}
		
		updateButtonSelectionStates()
	}
	
	
	
}
