//
//  ViewController.swift
//  dog_class_app
//
//  Created by andrew von Rajcs on 8/10/20.
//  Copyright © 2020 andrew von Rajcs. All rights reserved.
//

import UIKit

protocol ClassifyViewDelegate {
    func cameraButtonPressed()
    func photoLibraryButtonPressed()
    func videoButtonPressed()
}

    //MARK: - ClassifyView: uiview

class ClassifyView: UIView{
    
    //MARK: properties
    
    var delegate: ClassifyViewDelegate?
    
    let dogStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        return stackView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Dog Class"
        label.font = UIFont.systemFont(ofSize: 27)
        label.textAlignment = .center
        return label
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName:"Dog"))
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .lightGray
        imageView.alpha = 0.3
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    let detailTextView: UITextView = {
        let textView = UITextView(frame: .zero)
        textView.isEditable = false
        textView.text = "classify a dog by using an existing photo, taking a new photo, or directly from a video feed"
        textView.font = UIFont.systemFont(ofSize: 15)
        return textView
    }()
    let toolbar:UIToolbar = {
        let toolbar = UIToolbar(frame: .zero)
        return toolbar
    }()
    let photoLibraryButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .organize, target: self , action:#selector(cameraButtonPressed))
        button.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        return button
    }()
    let videoButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(videoButtonPressed))
        button.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        return button
    }()
    //MARK: Initializer

    
    override init (frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview()
        setupConstraints()
        
    }
    required init?(coder aDecoder: NSCoder)
    super.init(coder: aDecoder)
}

//MARK: Actions


