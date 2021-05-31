//
//  WelcomeViewController.swift
//  Spotify
//
//  Created by Pierce Tu on 2/28/21.
//

import UIKit

class WelcomeViewController: VideoSplashViewController {
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Sign In with Spotify", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSplash()
        title = "Spotify"
        view.backgroundColor = .systemBackground
        view.addSubview(signInButton)
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        signInButton.frame = CGRect(x: 20, y: view.height - 100 - view.safeAreaInsets.bottom, width: view.width - 40, height: 50)
    }
    
    @objc func didTapSignIn() {
        let vc = AuthViewController()
        vc.completionHandler = { [weak self] success in
            DispatchQueue.main.async {
                self?.handleSignIn(success: success)
            }
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupSplash() {
        // Video Background
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "Spotify", ofType: "mp4") ?? "")
        
        videoFrame = view.frame
        fillMode = .resizeAspectFill
        alwaysRepeat = true
        sound = false
        startTime = 2.0
        alpha = 0.8
        
        contentURL = url
        //        view.isUserInteractionEnabled = false
    }
    
    private func handleSignIn(success: Bool) {
        // Log user in or give error
        guard success else {
            let alert = UIAlertController(title: "Oops", message: "Something went wrong while signing in.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true)
            return
            
        }
        
        let mainAppTabBarVC = TabBarViewController()
        mainAppTabBarVC.modalPresentationStyle = .fullScreen
        present(mainAppTabBarVC, animated: true)
    }
    
}
