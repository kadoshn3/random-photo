//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Neeve Kadosh on 9/13/22.
//

import UIKit

class ViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        
        return button
    }()
    
    let colors: [UIColor] = [
        .systemGreen,
        .systemPink,
        .systemCyan,
        .systemMint,
        .systemOrange
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0,
                                 y: 0,
                                 width: 300,
                                 height: 300)
        imageView.center = view.center
        
        view.addSubview(button)
        button.addTarget(self, action: #selector(OnButtonTap), for: .touchUpInside)
        GetRandomPhoto()
    }
    
    @objc func OnButtonTap() {
        GetRandomPhoto()
        view.backgroundColor = colors.randomElement()
        button.backgroundColor = colors.randomElement()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 60,
                              y: view.frame.size.height - 150 - view.safeAreaInsets.bottom,
                              width: view.frame.size.width - 120,
                              height: 55)
    }
    
    func GetRandomPhoto() {
        let urlString = "https://source.unsplash.com/600x600/?panda"
        let url = URL(string: urlString)!
        
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }


}

