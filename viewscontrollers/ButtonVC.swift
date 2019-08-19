//
//  ViewController.swift
//  UIButtonInDeep
//
//  Created by eduardo fulgencio on 15/08/2019.
//  Copyright © 2019 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import UIKit

class ButtonVC: UIViewController {
    


// button.setTitle("Button Title here", for: UIControlState.normal)
//  button.setTitle("Button Title here", for: UIControlState.normal)
//  button.titleLabel?.font = UIFont.systemFont(ofSize: 18.0, weight: 1.0)
    
/*
     button.addTarget(self, action: #selector(self.callButtonClicked), for: UIControlEvents.touchUpInside)
     @objc func callButtonClicked()
     {
     print("Call Button Clicked")
     }
     
     
     // for normal state
     btn_refresh.setImage(UIImage(named: "xxx.png"), forState: UIControlState.Normal)
     // for Highlighted state
     btn_refresh.setImage(UIImage(named: "yyy.png"), forState: UIControlState.Highlighted)
     
     // for Selected state
     btn_refresh.setImage(UIImage(named: "zzzz.png"), forState: UIControlState.Selected)

     
     let buttonDone  = UIButton(type: .Custom)
     
     if let image = UIImage(named: "Done") {
     self.buttonDone.setImage(image, for: .normal)
     }
     
     // Center image at uibutton
     
     shiftButton.contentMode = .Center
*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centrarImagen()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        
//        // Añade gradient al boton
        let layer = CAGradientLayer()
        // Aquí crea el frame que va a ocupar
        layer.frame = CGRect(x: 64, y: 64, width: 160, height: 160)
        // Aquí le aplica los colores
        layer.colors = [UIColor.red.cgColor, UIColor.black.cgColor]
        view.layer.addSublayer(layer)

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.init(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)

        //    UIButtonType.custom
        //    UIButtonType.roundedRect
        //    UIButtonType.detailDisclosure
        //    UIButtonType.infoLight
        //    UIButtonType.infoDark
        //    UIButtonType.contactAdd
        // contactAdd añade el icono de mas
        let button = UIButton.init(type: UIButton.ButtonType.roundedRect)
        
        button.frame = CGRect(x:self.view.frame.size.width / 2.0 - 52 , y:80, width: 120 , height: 44)
        self.view.addSubview(button)
        
        button.setTitle("Call", for: UIControl.State.normal)
        button.setTitle("highlighted", for: UIControl.State.highlighted)
        button.setTitle("selected", for: UIControl.State.selected)
        button.titleLabel?.textColor = UIColor.white
        button.backgroundColor = UIColor.init(red: 0/255.0, green: 152/255.0, blue: 152/255.0, alpha: 1.0)
        button .setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18.0, weight: UIFont.Weight(rawValue: 1.0))
        button.layer.cornerRadius = 2.0
        button.addTarget(self, action: #selector(self.callButtonClicked), for: UIControl.Event.touchUpInside)
        
        button.zoomIn()
        
        //  animateButton(sender: button)
    }
    
    func centrarImagen() {
        let buttonDone  = UIButton(type: .custom)
        
        if let image = UIImage(named: "first") {
            buttonDone.setImage(image, for: .normal)
        }
        
        // Center image at uibutton
        buttonDone.contentMode = .center
        
        self.view.addSubview(buttonDone)
    }
    
    func animateButton(sender: UIButton) {
        
        sender.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        UIView.animate(withDuration: 2.0, delay: 0,
                       usingSpringWithDamping: CGFloat(0.20), initialSpringVelocity: CGFloat(6.0),
                       options: UIView.AnimationOptions.allowUserInteraction,
                       animations: {
                        sender.transform = CGAffineTransform.identity
                }, completion: { Void in() })
    }
    
    @objc func callButtonClicked(_ sender: UIButton)
    {
        /* si esta seleccionado o no se puede cambiar la imagen
         if bRec {
            btnRec.setImage(UIImage(named: "MicOn.png"), for: .normal)
         } else {
            btnRec.setImage(UIImage(named: "MicOff.png"), for: .normal)
         }
        */
        //  createParticles()
        // Cuando pulsa un boton que haga este efecto.
        // hacer ver que el usuario ha pulsado.
        sender.zoomInWithEasing(duration: 4.0, easingOffset: 1)
        if sender.isSelected == true {
            sender.isSelected = false
        }else {
            sender.isSelected = true
        }
    }

    
    // Alucina crea particulas
    func createParticles() {
        let particleEmitter = CAEmitterLayer()
        
        particleEmitter.emitterPosition = CGPoint(x: view.center.x, y: -96)
        particleEmitter.emitterShape = .line
        particleEmitter.emitterSize = CGSize(width: view.frame.size.width, height: 1)
        
        let red = makeEmitterCell(color: UIColor.red)
        let green = makeEmitterCell(color: UIColor.green)
        let blue = makeEmitterCell(color: UIColor.blue)
        
        particleEmitter.emitterCells = [red, green, blue]
        
        view.layer.addSublayer(particleEmitter)
    }
    
    func makeEmitterCell(color: UIColor) -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.birthRate = 3
        cell.lifetime = 7.0
        cell.lifetimeRange = 0
        cell.color = color.cgColor
        cell.velocity = 200
        cell.velocityRange = 50
        cell.emissionLongitude = CGFloat.pi
        cell.emissionRange = CGFloat.pi / 4
        cell.spin = 2
        cell.spinRange = 3
        cell.scaleRange = 0.5
        cell.scaleSpeed = -0.05
        
        cell.contents = UIImage(named: "first")?.cgImage
        return cell
    }
    
    

}

