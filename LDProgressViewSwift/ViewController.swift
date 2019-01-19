//
//  ViewController.swift
//  LDProgressViewSwift
//
//  Created by wxh on 2019/1/19.
//  Copyright © 2019 realibox. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var progressView: LDProgressView = {
        let view = LDProgressView()
        view.progress = 0.0
        view.color = UIColor(red: 47 / 255.0, green: 192 / 255.0, blue: 214 / 255.0, alpha: 1.0)
        view.showStroke = false
        view.flat = true
        view.showBackgroundInnerShadow = false
        view.showText = false
        view.animate = true
        view.borderRadius = 5
        view.background = UIColor.white
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        self.view.addSubview(self.progressView)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.progressView.frame = CGRect(x: 0, y: 0, width: 200, height: 10)
        self.progressView.center = self.view.center
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.progressView.progress = 0.5
    }

}

