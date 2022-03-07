//
//  SwitchVC.swift
//  UIKit-Slider-Switch-Segmented-Steppers
//
//  Created by Berkan Çalışkan on 3.03.2022.
//

import UIKit
import Lottie

class SwitchVC: UIViewController {
    
    var animationView: AnimationView?
    let lampSwitch = UISwitch()
    let lampInfo = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        blurBackground()
        createLabel()
        createLottie()
        createSwitch()
        
    }
    func blurBackground(){
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
    }
    
    func createLottie(){
        
        let screenHeight = view.frame.size.height
        let screenWidth = view.frame.size.width
        let stringMultiplier = 0.00115 * screenHeight
        

        animationView = .init(name: "lamp")
        animationView?.frame =  CGRect(x: 0.25 * screenWidth, y: 0.08 * screenHeight, width: 0.5 * screenWidth, height: 0.325 * screenHeight)
        animationView?.play()
        animationView?.loopMode = .loop

        view.addSubview(animationView!)
    }
    func createLabel(){
        let screenHeight = view.frame.size.height
        let screenWidth = view.frame.size.width
        let stringMultiplier = 0.00115 * screenHeight
        lampInfo.text = NSLocalizedString("Lambayı açtın💡", comment:"")
        lampInfo.textAlignment = .center
        lampInfo.textColor = .white
        lampInfo.font = GBoldBig
        lampInfo.numberOfLines = 0
        lampInfo.frame = CGRect(x: 0.1 * screenWidth, y: 0.415 * screenHeight, width: 0.8 * screenWidth, height: 0.1 * screenHeight)
        view.addSubview(lampInfo)
        
    }
   
    func createSwitch(){
        let screenWidth = view.frame.size.width
        
//        X'i ekranın yarısından switchin widthinin yarısının farkı kadar olsun böylelikle ekran boyutu değişse de tam ortada duracak.
        lampSwitch.frame = CGRect(x: screenWidth/2 - lampSwitch.frame.width/2,
                                  y: 550,
                                  width: lampSwitch.frame.width,
                                  height: lampSwitch.frame.height)
        lampSwitch.isOn = true
        lampSwitch.setOn(true, animated: true)
    
        lampSwitch.transform = CGAffineTransform(scaleX: 1.5 , y: 1.5)

        lampSwitch.onTintColor = UIColor.systemOrange
        lampSwitch.thumbTintColor = UIColor.green
    
        lampSwitch.addTarget(self, action: #selector(switchValueDidChange(_:)), for: .valueChanged)
        self.view!.addSubview(lampSwitch)
    }
    @objc func switchValueDidChange(_ sender: UISwitch!) {
        if (sender.isOn){
            animationView?.isHidden = false
            animationView?.play()
            animationView?.loopMode = .loop
            lampSwitch.thumbTintColor = UIColor.green
            lampInfo.text = NSLocalizedString("Lambayı açtın💡", comment:"")
        }
        else{
            animationView?.isHidden = true
            lampSwitch.thumbTintColor = UIColor.red
            lampInfo.text = NSLocalizedString("Lambayı kapattın🌒", comment:"")
        }
    }
}
