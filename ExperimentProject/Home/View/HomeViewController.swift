//
//  HomeViewController.swift
//  ExperimentProject
//
//  Created by Dhiya Ulhaq Zulha Alamsyah on 07/12/20.
//

import UIKit

class HomeViewController: UIViewController {
    
    var titleButton = EPButton()
    
    var presenter: HomeViewToPresenterProtocol?
    var param: HomeParam?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        titleButton.into(parent: view)
        titleButton.setTitle("Title")
        titleButton.setStyle(with: .fill, state: .normal)
        titleButton.configure()
        
        titleButton.makeConstraint {
            $0.leadingAnchor == view.leadingAnchor + 16
            $0.trailingAnchor == view.trailingAnchor - 16
            $0.centerYAnchor == view.centerYAnchor
        }
        
        titleButton.onClick {
            print("Title button clicked")
        }
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct HomeVCPreview: PreviewProvider {
    
    static var previews: some View {
        // view controller using programmatic UI
        HomeRouter.createModule(param: HomeParam()).toPreview()
    }
}
#endif
