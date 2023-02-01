//
//  ViewController.swift
//  DisplayHTMLData
//
//  Created by Harun Demirkaya on 1.02.2023.
//
// MARK: -Import Libaries
import UIKit

// MARK: -ViewController Class
class ViewController: UIViewController {

    // MARK: -Define
    
    // MARK: Label Defined
    var labelTitle: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = "<h2><b>Harun DEMİRKAYA</b></h2>".htmlToAttributedString
        return label
    }()
    
    // MARK: -ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Screen
        view.backgroundColor = .white
        
        // MARK: Added Label
        labelTitle.labelConstraints(view)
    }
}

// MARK: -Constraints
public extension UIView{
    func labelConstraints(_ view: UIView){
        view.addSubview(self)
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive  = true
    }
}

// MARK: -Display HTML Functions
extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}

