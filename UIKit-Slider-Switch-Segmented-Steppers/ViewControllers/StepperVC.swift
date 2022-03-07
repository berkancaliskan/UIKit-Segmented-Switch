//
//  StepperVC.swift
//  UIKit-Slider-Switch-Segmented-Steppers
//
//  Created by Berkan Çalışkan on 3.03.2022.
//

import UIKit

class StepperVC: UIViewController {

    let stepperLabel = UILabel()
    let stepper = UIStepper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blurBackground()
        createStepper()
        createLabel()
    }
    func blurBackground(){
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
    }
    
    func createStepper(){
        
        let screenHeight = view.frame.size.height
        let screenWidth = view.frame.size.width

        stepper.layer.borderWidth = 2
        stepper.layer.borderColor = UIColor.systemOrange.cgColor
        stepper.layer.cornerRadius = 8
        stepper.frame = CGRect(x: screenWidth/2 - stepper.frame.width/2,
                               y: 300,
                               width: stepper.frame.width,
                               height: stepper.frame.height)
// UIStepper'a width ve height vermek için kullanmak için transform kullanıyoruz.
        stepper.transform = CGAffineTransform(scaleX: 1.5, y: 1.6)
        stepper.maximumValue = 60
        stepper.minimumValue = 0
// UIStepper değerini eş zamanlı olarak hareket etmesini istiyorsak true olmalı.
        stepper.isContinuous = true
// UIStepper değerini maximum olunca baştan devam ettirir.
        stepper.wraps = false
// Düğmeye basılı tutarsanız, UIStepper değeri sürekli olarak artar.
        stepper.autorepeat = true
        stepper.backgroundColor = UIColor(red: 1.00,
                                          green: 0.99,
                                          blue: 0.87,
                                          alpha: 1.00)
// UIStepper değerinde kaçar kaçar artıp azalacağını belirtiyoruz.
        stepper.stepValue = 3
        stepper.tintColor = UIColor.red
    view.addSubview(stepper)
        stepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)

    }
    func createLabel(){
        
        let screenHeight = view.frame.size.height
        let screenWidth = view.frame.size.width
        stepperLabel.text = NSLocalizedString("Stepper değeri: \(stepper.value)", comment:"")
        stepperLabel.textAlignment = .center
        stepperLabel.textColor = .white
        stepperLabel.numberOfLines = 0
        stepperLabel.font = GBookBig
        stepperLabel.frame = CGRect(x: 0.1 * screenWidth,
                                    y: 0.43 * screenHeight,
                                    width: 0.8 * screenWidth,
                                    height: 0.18 * screenHeight)
        view.addSubview(stepperLabel)
        
    }
    
    @objc func stepperValueChanged(_ sender:UIStepper!)
      {
          stepperLabel.text = NSLocalizedString("Stepper değeri: \(Int(stepper.value))", comment:"")
      }


}
