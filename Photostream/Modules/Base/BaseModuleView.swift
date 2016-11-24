//
//  BaseModuleView.swift
//  Photostream
//
//  Created by Mounir Ybanez on 24/11/2016.
//  Copyright © 2016 Mounir Ybanez. All rights reserved.
//

import UIKit

protocol BaseModuleView: class {
    
    var controller: UIViewController? { get }
    var presenter: BaseModulePresenter! { set get }
}
