//
//  MainVC.swift
//  UIKit-Slider-Switch-Segmented-Steppers
//
//  Created by Berkan Çalışkan on 3.03.2022.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        createUI()
    }
    
    
    func createUI(){
        
        let screenHeight = view.frame.size.height
        let screenWidth = view.frame.size.width
        let stringMultiplier = 0.00115 * screenHeight
        
        view.backgroundColor = UIColor.white
      
        let holderTitle = UILabel()
        holderTitle.text = NSLocalizedString("UIKit", comment:"")
        holderTitle.textAlignment = .center
        holderTitle.textColor = .darkGray
        holderTitle.font = GBoldBig
        holderTitle.numberOfLines = 0
        holderTitle.frame = CGRect(x: 0.1 * screenWidth, y: 0.415 * screenHeight, width: 0.8 * screenWidth, height: 0.1 * screenHeight)
        view.addSubview(holderTitle)
        
        
        let switchTitle = UILabel()
        switchTitle.text = NSLocalizedString("UISwitch", comment:"")
        switchTitle.textAlignment = .center
        switchTitle.textColor = .darkGray
        switchTitle.numberOfLines = 0
        switchTitle.font = GBookBig
        switchTitle.frame = CGRect(x: 0.1 * screenWidth, y: 0.43 * screenHeight, width: 0.8 * screenWidth, height: 0.18 * screenHeight)
        view.addSubview(switchTitle)
      
        
        let swiftImg = UIImageView()
        swiftImg.image = UIImage(named: "swift-logo")
        swiftImg.frame = CGRect(x: screenWidth * 0.3, y: screenHeight * 0.22 ,width: screenWidth * 0.4, height: screenWidth * 0.4)
        view.addSubview(swiftImg)
        


     
        let switchTitleButton = UIButton()
        switchTitleButton.backgroundColor = .systemOrange
        switchTitleButton.setTitle(NSLocalizedString("UISwitch", comment: ""), for: UIControl.State.normal)
        switchTitleButton.layer.cornerRadius = 8
        switchTitleButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        switchTitleButton.titleLabel?.font = GBook
        switchTitleButton.frame = CGRect(x: 0.14 * screenWidth, y: 0.56 * screenHeight, width: 0.72 * screenWidth, height: 0.056 * screenHeight)
        view.addSubview(switchTitleButton)
        switchTitleButton.addTarget(self, action: #selector(switchClicked), for: UIControl.Event.touchUpInside)
        
        let segmentButton = UIButton()
        segmentButton.backgroundColor = .systemOrange
        segmentButton.setTitle(NSLocalizedString("UISegmented", comment: ""), for: UIControl.State.normal)
        segmentButton.layer.cornerRadius = 8
        segmentButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        segmentButton.titleLabel?.font = GBook
        segmentButton.frame = CGRect(x: 0.14 * screenWidth, y: 0.64 * screenHeight, width: 0.72 * screenWidth, height: 0.056 * screenHeight)
        view.addSubview(segmentButton)
        segmentButton.addTarget(self, action: #selector(segmentedClicked), for: UIControl.Event.touchUpInside)
        
        
        let sliderButton = UIButton()
        sliderButton.backgroundColor = .systemOrange
        sliderButton.setTitle(NSLocalizedString("UISlider", comment: ""), for: UIControl.State.normal)
        sliderButton.layer.cornerRadius = 8
        sliderButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        sliderButton.titleLabel?.font = GBook
        sliderButton.frame = CGRect(x: 0.14 * screenWidth, y: 0.72 * screenHeight, width: 0.72 * screenWidth, height: 0.056 * screenHeight)
        view.addSubview(sliderButton)
        sliderButton.addTarget(self, action: #selector(sliderClicked), for: UIControl.Event.touchUpInside)
        
        let stepperButton = UIButton()
        stepperButton.backgroundColor = .systemOrange
        stepperButton.setTitle(NSLocalizedString("UIStepper", comment: ""), for: UIControl.State.normal)
        stepperButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        stepperButton.layer.cornerRadius = 8
        stepperButton.titleLabel?.font = GBook
        stepperButton.frame = CGRect(x: 0.14 * screenWidth, y: 0.8 * screenHeight, width: 0.72 * screenWidth, height: 0.056 * screenHeight)
        view.addSubview(stepperButton)
        stepperButton.addTarget(self, action: #selector(stepperClicked), for: UIControl.Event.touchUpInside)
        
      
                
    }
    
    @objc func switchClicked() {
       
        let vc = SwitchVC()
        vc.modalPresentationStyle = .pageSheet
        self.present(vc, animated: true, completion: nil)
        
      }
    
    @objc func segmentedClicked() {
        
        let vc = SegmentedVC()
//        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
        
      }
    @objc func sliderClicked() {
       
        let vc = SliderVC()
        vc.modalPresentationStyle = .pageSheet
        self.present(vc, animated: true, completion: nil)
        
      }
    
    @objc func stepperClicked() {
        
        let vc = StepperVC()
//        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
        
      }
        
        
}



