//
//  SliderVC.swift
//  UIKit-Slider-Switch-Segmented-Steppers
//
//  Created by Berkan Çalışkan on 3.03.2022.
//

import UIKit
import Lottie

class SliderVC: UIViewController {

    
    let step:Float = 1
    let mySlider = UISlider(frame:CGRect(x: 0, y: 0, width: 300, height: 20))
    let sliderLabel = UILabel()
    var animationView: AnimationView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        blurBackground()
        setupSlider()
        createLabel()
        createLottie()
       
    }
    func createLottie(){
        let screenHeight = view.frame.size.height
        let screenWidth = view.frame.size.width
        let stringMultiplier = 0.00115 * screenHeight

        animationView = .init(name: "confetti")
        animationView?.frame =  CGRect(x: 0.25 * screenWidth,
                                       y: 0.08 * screenHeight,
                                       width: 0.5 * screenWidth,
                                       height: 0.325 * screenHeight)
        view.addSubview(animationView!)
    }
    func blurBackground(){
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
    }
    
    func createLabel(){
        
        let screenHeight = view.frame.size.height
        let screenWidth = view.frame.size.width
        sliderLabel.text = NSLocalizedString("Slider değeri: 0", comment:"")
        sliderLabel.textAlignment = .center
        sliderLabel.textColor = .white
        sliderLabel.numberOfLines = 0
        sliderLabel.font = GBookBig
        sliderLabel.frame = CGRect(x: 0.1 * screenWidth,
                                   y: 0.43 * screenHeight,
                                   width: 0.8 * screenWidth,
                                   height: 0.18 * screenHeight)
        view.addSubview(sliderLabel)
        
    }
    
    
    func setupSlider(){
        
        let screenHeight = view.frame.size.height
        let screenWidth = view.frame.size.width
        mySlider.frame = CGRect(x: 0.075 * screenWidth,
                                y: 0.26 * screenHeight,
                                width: 0.85 * screenWidth,
                                height: 0.05 * screenHeight)
        mySlider.minimumValue = 0
        mySlider.maximumValue = 100
        mySlider.maximumTrackTintColor = .lightGray
        mySlider.thumbTintColor = .systemOrange

        mySlider.backgroundColor = .clear
        
        // Değer değişirken senkronize olarak değişim göstermesi istiyorsak true olmalı.
        mySlider.isContinuous = true
        
        mySlider.tintColor = UIColor.green
        mySlider.addTarget(self, action: #selector(self.sliderValueDidChange(_:)), for: .valueChanged)
        view.addSubview(mySlider)
    }

    @objc func sliderValueDidChange(_ sender:UISlider!)
    {
        // mySlider.setThumbImage( UIImage(named: "slider-icon"), for: .normal)
        // UISlider'ın değerlerinin adım adım artmasını istediğimizde kullanıyoruz.
        let roundedStepValue = round(sender.value / step) * step
        sender.value = roundedStepValue
       
        sliderLabel.text = NSLocalizedString("Slider değeri: \(Int(roundedStepValue))", comment:"")
        
        if roundedStepValue == 100 {
            animationView?.isHidden = false
            animationView?.play()
            animationView?.loopMode = .loop
        }else{
            animationView?.isHidden = true
            
        }
    }
    
 

}
