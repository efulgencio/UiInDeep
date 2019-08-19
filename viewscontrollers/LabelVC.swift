//
//  ViewController.swift
//  UILabelinDeep
//
//  Created by eduardo fulgencio on 11/08/2019.
//  Copyright © 2019 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import UIKit

class LabelVC: UIViewController {
    
    
    let termText = "By register, I agree to ... Terms of Service and Private Policy"
    let term = "Terms of Service"
    let policy = "Private Policy"
    
    let termLabel = UILabel()

    var lblCounter: UILabel!
    var counter = 0
    var lastControl: AnyObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Propiedades básicas
          labelProperties()
        // Añadir atributos con append método
          appendAttributes()
        // Aplicar sombras
          labelShadow()
        // (2) Atributed text
          labelWithAttributed()
        // (3) Underline label
         labelUnderline()
        // label con sombras
          labelShadow()
        // (4) Atributos en label extension
          labelAttributedExtension()
         // (5) Aplicar transiciones
          labelTransition()
        // (6) Animación
          labelAnimation()
        // (7) espacio entre líneas
          labelSpacing()
        // (8) aplicar fuente al texto
           aplicarAttributed()
    }
    
    // Costumbre de añadir comentarios a los métodos
    
    // MARK: - (0) *******************  Creación con frame
    /**
     This method sum two double numbers and returns.
     
     - parameter number1: First Double Number.
     - parameter number2: Second Double Number.
     - returns: The sum of two double numbers.
     
     # Notes: #
     1. Parameters must be **double** type
     2. Handle return type because it is optional.
     
     # Example #
     ```
     if let sum = self.add(number1: 23, number2: 34) {
     print(sum)
     }
     ```
     */
    func labelProperties() {
        
           // inicializamos con un frame
            let label = UILabel()
            // Diferentes propiedades
            label.text = "El texto que va a contener este UILabel."
            label.textColor = UIColor.black
        
            // El color del fondo
            label.backgroundColor = .yellow

            // En el caso de querer aplicar otra fuente
            // contiene una array de los tipos de fuentes
            let nombreFuente = UIFont.familyNames[10]
            let fuente = UIFont.init(name: nombreFuente , size: UIFont.labelFontSize)
            label.font = fuente
            // Aplicar la fuente actual cambiando su tamaño
            // label.font = UIFont.systemFont(ofSize: 18.0, weight: UIFont.Weight(rawValue: 1.0))
        
            // Alinear el texto
            label.textAlignment = NSTextAlignment.center
        
            // Aplicar lalyer un aspecto
            label.layer.borderColor = UIColor.black.cgColor
            label.layer.borderWidth = 1.0

            // Indicamos el número de líneas
            label.numberOfLines = 1;
        
            // El modo de ajustar el texto
            label.lineBreakMode = NSLineBreakMode.byWordWrapping
        
            // Para que se visualice todo el contenido
            // label.numberOfLines = 0
            // label.sizeToFit()

         // Añadimos el label as subviews
        lastControl = self.view
        self.view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            label.heightAnchor.constraint(equalToConstant: 30)
            ])
        lastControl = label
    }
    
    // (1) Creación con constraint
    func appendAttributes() {
    
        let firstAttributes: [NSAttributedString.Key: Any] = [.backgroundColor: UIColor.green, NSAttributedString.Key.kern: 10]
        let secondAttributes = [NSAttributedString.Key.foregroundColor: UIColor.blue]

      //  let firstString = NSMutableAttributedString(string: "Haters ", attributes: firstAttributes)
        let contenido = NSMutableAttributedString(string: "Haters ", attributes: firstAttributes)
        let otrocontenido = NSAttributedString(string: "gonna ", attributes: secondAttributes)
        let mascontenido = NSAttributedString(string: "hate")

        contenido.append(otrocontenido)
        contenido.append(mascontenido)
        
        let label = UILabel()
        label.attributedText = contenido
        
        situarComponente(label: label)
    }
    
    func labelShadow() {
        let font = UIFont.systemFont(ofSize: 24)

        let shadow = NSShadow()
        shadow.shadowColor = UIColor.red
        shadow.shadowBlurRadius = 5

        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.white,
            .shadow: shadow
        ]
        
        let attributedQuote = NSAttributedString(string: "conteido", attributes: attributes)
        
        let label = UILabel()
        label.attributedText = attributedQuote

        situarComponente(label: label)
    }


    func labelWithAttributed() {
        let label = UILabel()
        let strokeTextAttributes = [
            NSAttributedString.Key.strokeColor : UIColor.red,
            NSAttributedString.Key.textEffect : NSAttributedString.TextEffectStyle.letterpressStyle,
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.strokeWidth : -4.0,
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 30)]
            as [NSAttributedString.Key : Any]
        
        label.attributedText = NSMutableAttributedString(string: "Your outline text", attributes: strokeTextAttributes)
      
        let attributedString = NSMutableAttributedString(string: "Want to learn iOS? You should visit the best source of free iOS tutorials!")
        attributedString.addAttribute(.link, value: "https://www.hackingwithswift.com", range: NSRange(location: 19, length: 55))
        label.attributedText = attributedString
    
        situarComponente(label: label)
    }
    
    // (3) Label subrayado
    func labelUnderline() {
        let label = UILabel()
        let attributedString = NSMutableAttributedString(string: "Your UnderLine text")
        
        attributedString.addAttribute(
            NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue,
            range: NSRange(location: 0, length: attributedString.length))
        
        label.attributedText = attributedString

        situarComponente(label: label)
    }
    
    // (4) labelAttributedExtension
    func labelAttributedExtension(){
        let label = UILabel()
        label.text = "Todo subrayado"
        label.underline()
        situarComponente(label: label)
    }
    
    func aplicarAttributed() {
        let label = UILabel()
        let formattedText = String.formatAttributed(strings: [term, policy],
                                          boldFont: UIFont.boldSystemFont(ofSize: 15),
                                          boldColor: UIColor.blue,
                                          inString: termText,
                                          font: UIFont.systemFont(ofSize: 15),
                                          color: UIColor.black)

        label.attributedText = formattedText
        label.numberOfLines = 0
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTermTapped))
        label.addGestureRecognizer(tap)
        label.isUserInteractionEnabled = true
        label.textAlignment = .center
        
       situarComponente(label: label)
    }
    
    @objc func handleTermTapped(gesture: UITapGestureRecognizer) {
        let termString = termText as NSString
        let termRange = termString.range(of: term)
        let policyRange = termString.range(of: policy)
        
        let tapLocation = gesture.location(in: termLabel)
        let index = termLabel.indexOfAttributedTextCharacterAtPoint(point: tapLocation)
        
        if checkRange(termRange, contain: index) == true {
          //  handleViewTermOfUse()
            return
        }
        
        if checkRange(policyRange, contain: index) {
          //  handleViewPrivacy()
            return
        }
    }
    
    func checkRange(_ range: NSRange, contain index: Int) -> Bool {
        return index > range.location && index < range.location + range.length
    }

    // (5) label transition
    func labelTransition() {
        //label.text = "Contenido inicial"
        //view.addSubview(label)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // si es doble click decrementar
        //label.text = "Cambio contenido"
        //label.fadeTransition(1)
        labelAnimation()
    }
    
    // (6) label animation
    func labelAnimation() {
            let label = UILabel()
            view.addSubview(label)
            label.layer.bottomAnimation(duration: 0.7)
            counter = counter + 1
            label.text = "\(counter)"
            situarComponente(label: label)
    }
    
    func labelSpacing() {
        let label = UILabel()
        label.frame = CGRect(x:12 , y:100 , width: 100 , height: 100)
        label.backgroundColor = .red
  
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        
        view.addSubview(label)
        let attributedString = NSMutableAttributedString(string: "Todo este texto en dos lineas con espacio.")
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle,
                                      range:NSMakeRange(0, attributedString.length))
        label.attributedText = attributedString
        situarComponente(label: label)
    }
    
}



extension LabelVC {
    // MARK: - Extension situarComponente
    func situarComponente (label: UILabel) {
        view.addSubview(label)
        self.situationControl(objectVisual: label, aboveControl: lastControl)
        lastControl = label
    }
}
