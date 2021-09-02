//
//  HomeNC.swift
//  ALLinOne
//
//  Created by Narendra Yadav on 8/28/21.
//

import UIKit

class HomeNC: UINavigationController {

    // MARK: - Properties
    
    private var popRecognizer: InteractivePopRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupPopRecognizer()
    }
    
    // MARK: - Setup

    private func setupPopRecognizer() {
        popRecognizer = InteractivePopRecognizer(controller: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //self.navigationController?.navigationBar.backItem?.title = "Anything Else"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var shouldAutorotate: Bool {
//        if self.traitCollection.userInterfaceIdiom == .pad {
//            return true // we are supporting both landscapeLeft and landscapeRight on iPad.
//        }
        return false }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
//        if self.traitCollection.userInterfaceIdiom == .pad {
//            return .all // we are supporting both landscapeLeft and landscapeRight on iPad.
//        }
        return .portrait }
}

class InteractivePopRecognizer: NSObject {
    
    // MARK: - Properties
    
    fileprivate weak var navigationController: UINavigationController?
    
    // MARK: - Init
    
    init(controller: UINavigationController) {
        self.navigationController = controller
        
        super.init()
        
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
}

extension InteractivePopRecognizer: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return (navigationController?.viewControllers.count ?? 0) > 1
    }
    
    // This is necessary because without it, subviews of your top controller can cancel out your gesture recognizer on the edge.
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

