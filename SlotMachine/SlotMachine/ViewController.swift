//
//  ViewController.swift
//  SlotMachine
//
//  Created by sainath bamen on 06/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    
    var points = 1000
    override func viewDidLoad() {
        super.viewDidLoad()
        pointsLabel.text = "Points: \(points)"
        
        
    }
    
    @IBAction func spinButtonAction(_ sender: Any) {
        spinAndAssignImage()
    }
    
   func spinAndAssignImage(){
       let image1number = Int.random(in: 1...4)
       let image2number = Int.random(in: 1...4)
       let image3number = Int.random(in: 1...4)
       let image4number = Int.random(in: 1...4)
        
    
       
       //
       assignImages(number: image1number, images: image1)
       assignImages(number: image2number, images: image2)
       assignImages(number: image3number, images: image3)
       assignImages(number: image4number, images: image4)
       
           // adding animation.
       UIView.transition(with: image1, duration: 0.3, options: .transitionFlipFromTop, animations: nil, completion: nil)
       UIView.transition(with: image2, duration: 0.3, options: .transitionFlipFromTop, animations: nil, completion: nil)
       UIView.transition(with: image3, duration: 0.3, options: .transitionFlipFromBottom, animations: nil, completion: nil)
       UIView.transition(with: image4, duration: 0.3, options: .transitionFlipFromBottom, animations: nil, completion: nil)
       
       //substracting 100 points with each spin
       points = points - 100
       if points < 0{
           pointsLabel.text = "Bankrupt!"
           
       }else{
           pointsLabel.text = "Points \(points) "
           
       }
       // check if two same images add 200 points.
       if image1number == image2number{
           points = points + 200
       }
       else if image1number == image2number{
           points = points + 200
       }
       else if image2number == image3number{
           points = points + 200
       }
       else if image3number == image4number{
           points = points + 200
       }
       else if image1number == image2number, image2number == image3number, image3number == image4number{
           points = points + 300
       }
       
       // add another jacpot 100 points.
       if image1number == 5, image2number == 5, image3number == 5, image4number == 5{
           points = points + 100
       }
       
       // display status
//       pointsLabel.text = "Points: \(points)"
//
       
       
       
       
       
       
        
    }
    
    func assignImages(number:Int, images:UIImageView){
        switch number {
        case 1:
            images.image = UIImage(named: "charmendor")
        case 2:
            images.image = UIImage(named: "bulbasaur")
        case 3:
            images.image = UIImage(named: "pikachu")
        case 4:
            images.image = UIImage(named: "chicorita")
        case 5:
            images.image = UIImage(named: "jackpot")
        default:
            print("error")
        }
        
    }
    

}

