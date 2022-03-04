//
//  SegmentedVC.swift
//  UIKit-Slider-Switch-Segmented-Steppers
//
//  Created by Berkan Çalışkan on 3.03.2022.
//

import UIKit

class SegmentedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func createSC(){
        
        let items = ["Purple", "Green", "Blue"]
        let customSC = UISegmentedControl(items: items)
        customSC.selectedSegmentIndex = 0

        // Set up Frame and SegmentedControl
        customSC.frame = CGRect(x: minX + 10, y: minY + 50,
                                    frame.width - 20, frame.height*0.1)

        // Style the Segmented Control
        customSC.layer.cornerRadius = 5.0  // Don't let background bleed
        customSC.backgroundColor = UIColor.black
        customSC.tintColor = UIColor.white

        // Add target action method
        customSC.addTarget(self, action: "changeColor:", for: valueChanged)

        // Add this custom Segmented Control to our view
        self.view.addSubview(customSC)
    
    }
          

    func changeColor(sender: UISegmentedControl) {
        print("Change color handler is called.")
        print("Changing Color to ")
        switch sender.selectedSegmentIndex {
        case 1:
            self.view.backgroundColor = UIColor.green
            print("Green")
        case 2:
            self.view.backgroundColor = UIColor.blue
            print("Blue")
        default:
            self.view.backgroundColor = UIColor.purple
            print("Purple")
        }
    }

}
    
