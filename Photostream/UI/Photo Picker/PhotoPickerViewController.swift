//
//  PhotoPickerViewController.swift
//  Photostream
//
//  Created by Mounir Ybanez on 11/11/2016.
//  Copyright © 2016 Mounir Ybanez. All rights reserved.
//

import UIKit
import Photos

class PhotoPickerViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var cropView: CropView!
    @IBOutlet weak var dimView: UIView!
    @IBOutlet weak var cropContentViewConstraintTop: NSLayoutConstraint!
    
    lazy var scrollHandler = ScrollHandler()
    
    var presenter: PhotoPickerModuleInterface!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollHandler.scrollView = collectionView
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.didTapDimView))
        dimView.addGestureRecognizer(tap)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        addObserver(self, forKeyPath: "cropContentViewConstraintTop.constant", options: .new, context: nil)
        
        collectionView.contentInset.top = cropView.height + 2
        collectionView.scrollIndicatorInsets.top = cropView.height + 2
        flowLayout.configure(with: collectionView.width, columnCount: 4, columnSpacing: 0.5, rowSpacing: 2)

        presenter.fetchPhotos()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        removeObserver(self, forKeyPath: "cropContentViewConstraintTop.constant")
        
        super.viewDidDisappear(animated)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard let newValue = change?[.newKey] as? CGFloat else {
            return
        }
        
        dimView.isHidden = newValue == 0
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    @IBAction func didTapDone(_ sender: AnyObject) {
        presenter.didCrop(with: cropView.croppedImage)
    }
    
    @IBAction func didTapCancel(_ sender: AnyObject) {
        presenter.didCancelCrop()
    }
    
    @IBAction func toggleContentMode() {
        presenter.toggleContentMode(animated: true)
    }
    
    func didTapDimView() {
        scrollHandler.killScroll()
        UIView.animate(withDuration: 0.25) { 
            self.cropContentViewConstraintTop.constant = 0
            self.dimView.alpha = 0
            
            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()
        }
    }
}

extension PhotoPickerViewController: PhotoPickerViewInterface {
    
    var controller: UIViewController? {
        return self
    }
    
    func reloadView() {
        collectionView.reloadData()
    }
    
    func didFetchPhotos() {
        reloadView()
        
        if presenter.photoCount > 0 {
            let indexPath = IndexPath(row: 0, section: 0)
            collectionView(collectionView, didSelectItemAt: indexPath)
        }
    }
    
    func showSelectedPhoto(with image: UIImage?) {
        cropView.setCropTarget(with: image)
        presenter.fillSelectedPhoto(animated: false)
    }
    
    func showSelectedPhotoInFitMode(animated: Bool) {
        cropView.zoomToFit(animated)
    }
    
    func showSelectedPhotoInFillMode(animated: Bool) {
        cropView.zoomToFill(animated)
    }
}
