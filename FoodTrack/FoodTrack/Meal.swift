//
//  Meal.swift
//  FoodTracker
//
//  Created by XilongHuang on 27/10/2016.
//  Copyright © 2016 SeanDev. All rights reserved.
//

import UIKit

class Meal : NSObject, NSCoding{
	var name: String
	var photo: UIImage?
	var rating: Int

	//MARK: Initialization
	init?(name: String, photo: UIImage?, rating: Int) {
		self.name = name
		self.photo = photo
		self.rating = rating
		
		super.init()
		// Initialization should fail if there is no name or if the rating is negative.
		if name.isEmpty || rating < 0 {
			return nil
		}
	}
	
	//Mark Type
	struct PropertyKey {
		static let nameKey = "name"
		static let photoKey = "photo"
		static let ratingKey = "rating"
	}
	
	


	func encode(with aCoder: NSCoder){
		aCoder.encode(name, forKey: PropertyKey.nameKey)
		aCoder.encode(photo, forKey: PropertyKey.photoKey)
		aCoder.encode(rating, forKey: PropertyKey.ratingKey)
	}
	
	required convenience init?(coder aDecoder: NSCoder){
		let name = aDecoder.decodeObject(forKey: PropertyKey.nameKey) as! String
		let photo = aDecoder.decodeObject(forKey: PropertyKey.photoKey) as? UIImage
		let rating = aDecoder.decodeInteger(forKey: PropertyKey.ratingKey)
		self.init(name: name, photo: photo, rating: rating)
	}
	
	
	static let DocumentsDirectory = FileManager().urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first!
	
	static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")
	
	

}
