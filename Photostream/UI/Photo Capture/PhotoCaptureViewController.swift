//
//  PhotoCaptureViewController.swift
//  Photostream
//
//  Created by Mounir Ybanez on 10/11/2016.
//  Copyright © 2016 Mounir Ybanez. All rights reserved.
//

import UIKit
import GPUImage

class PhotoCaptureViewController: UIViewController {

    @IBOutlet weak var preview: GPUImageView!
    @IBOutlet weak var controlContentView: UIView!
    @IBOutlet weak var captureButton: UIButton!
    
    var presenter: PhotoCaptureModuleInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        preview.fillMode = kGPUImageFillModePreserveAspectRatioAndFill
        presenter.setupBackCamera(with: preview)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter.startCamera()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        presenter.stopCamera()
        
        super.viewWillDisappear(animated)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func didTapCapture() {
        presenter.capture()
    }
}

extension PhotoCaptureViewController: PhotoCaptureViewInterface {
    
    var controller: UIViewController? {
        return self
    }
}
