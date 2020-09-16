//
//  OnboardingViewController.swift
//  paysplit
//
//  Created by timofey makhlay on 12/30/19.
//  Copyright © 2019 dev. All rights reserved.
//

import UIKit


class OnboardingViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    /// View model property  in the VC
     lazy var viewModel: OnboardViewModel = {
         return OnboardViewModel()
     }()

    /// User Defaults Standard
    let defaults = UserDefaults.standard

    /// Variables for size
    private var screenSize = UIScreen.main.bounds  // Height: 812 Width: 375

    /// Image
    let logoImg: UIImageView = {
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        v.image = UIImage(named: "Asset:Logo:WhiteText")
        return v
    }()

    /// Skip button
    lazy var skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.isHidden = true
        button.setTitle("Skip", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: Font.light.name, size: CGFloat(Font.medium.size))
        button.setTitleColor(PSColor.gray.value, for: .normal)
        button.addTarget(self, action: #selector(skipButtonPressed), for: .touchUpInside)
        button.contentEdgeInsets = UIEdgeInsets(top: CGFloat(Padding.consecutive.value), left: CGFloat(Padding.consecutive.value), bottom: CGFloat(Padding.consecutive.value), right: CGFloat(Padding.consecutive.value))
        return button
    }()

    /// page controls
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.translatesAutoresizingMaskIntoConstraints = false
        pc.currentPage = 0
        pc.numberOfPages = 3
        pc.currentPageIndicatorTintColor = PSColor.primary.value
        pc.pageIndicatorTintColor = PSColor.gray.value
        return pc
    }()

    /// Sign up button
    lazy var signUpButton: UIButton = {
       let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Sign up", for: .normal)
        b.setTitleColor(PSColor.primary.value, for: .normal)
        b.titleLabel?.font = UIFont(name: Font.semiBold.name, size: CGFloat(Font.medium.size))
        b.backgroundColor = PSColor.white.value
        b.layer.cornerRadius = 3

        b.addTarget(self, action: #selector(signUpButtonPressBegan), for: .touchDown)
        b.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)

        return b
    }()

    /// First function to start button animation
    @objc func signUpButtonPressBegan() {
        signUpButton.touchDown()
    }

    /// Second function after the button was released
    @objc func signUpButtonPressed() {
        signUpButton.touchUp()
        
        // Next view
//        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }

    /// Login button
    lazy var loginButton: UIButton = {
       let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
                b.setTitle("Log in", for: .normal)
        b.setTitleColor(PSColor.white.value, for: .normal)
        b.titleLabel?.font = UIFont(name: Font.semiBold.name, size: CGFloat(Font.medium.size))
        b.backgroundColor = PSColor.primary.value
        b.layer.cornerRadius = 3


        b.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        b.addTarget(self, action: #selector(loginButtonPressBegan), for: .touchDown)

        return b
    }()


    /// Login button released
    @objc func loginButtonPressed() {
        loginButton.touchUp()
        
        // Next View
//        var loginViewController = LoginViewController()
//        navigationController?.pushViewController(loginViewController, animated: true)
    }

    /// Login button touch began
    @objc func loginButtonPressBegan() {
        loginButton.touchDown()
    }
    
    /// Croll control
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let visibleRect = CGRect(origin: self.collectionView.contentOffset, size: self.collectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let visibleIndexPath = self.collectionView.indexPathForItem(at: visiblePoint) {
            self.pageControl.currentPage = visibleIndexPath.row
        }
    }

    // View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear

        view.addSubview(collectionView)

        navigationController?.isNavigationBarHidden = true

        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.register(OnboardPageCell.self, forCellWithReuseIdentifier: OnboardPageCell.identifier)
        collectionView.backgroundColor = UIColor.clear
        collectionView.isPagingEnabled = true

        setupCollectionConstraints()
        
        // Create Structs
        viewModel.createPages()
        
        // CAGradientLayer
        let gradient: CAGradientLayer = PSColor.white.backgroundGradient() // Call function
        
        gradient.frame = view.bounds // set bounds
        view.layer.insertSublayer(gradient, at: 0) // add to view
    }

    /// CollectionView
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = PSColor.white.value
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()

    // Skip Button Pressed
    /// Close the Onboarding View
    @objc func skipButtonPressed() {
        Vibration.light.vibrate()

        // So we know the user has finished the onboarding.
        defaults.set(true, forKey: "finishedOnboarding")

        navigationController?.popViewController(animated: true)

    }

    // Layout
    /// Set layout for everything in onboardingVC
    func setupCollectionConstraints() {
        
        // MARK: Fix this with snapkit
//        collectionView.snp.makeConstraints { (make) in
//            make.left.right.top.bottom.equalToSuperview()
//        }

        view.addSubview(logoImg)
        view.addSubview(pageControl)
        view.addSubview(signUpButton)
        view.addSubview(loginButton)

          [pageControl].disableAutoresizing()

          [

            logoImg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Padding.medium.cgFloat()),
            logoImg.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImg.heightAnchor.constraint(equalToConstant: Padding.medium.cgFloat() * 2),

            pageControl.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: -Padding.consecutive.cgFloat()),
              pageControl.leftAnchor.constraint(equalTo: view.leftAnchor),
              pageControl.rightAnchor.constraint(equalTo: view.rightAnchor),

              loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Padding.medium.cgFloat()),
              loginButton.heightAnchor.constraint(equalToConstant: Padding.largeButtonHeight.cgFloat()),
              loginButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3),
              loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Padding.medium.cgFloat()),

              signUpButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Padding.medium.cgFloat()),
              signUpButton.heightAnchor.constraint(equalToConstant: Padding.largeButtonHeight.cgFloat()),
              signUpButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3),
              signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Padding.medium.cgFloat()),

          ].activate()

        // MARK: Fix this with snapkit
//        // skip button
//        view.addSubview(skipButton)
//        skipButton.snp.makeConstraints { (make) in
//            make.right.equalTo(view.safeAreaLayoutGuide).offset(-Padding.medium.value)
//            make.centerY.equalTo(loginButton)
//        }
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardPageCell.identifier, for: indexPath) as! OnboardPageCell

        //Getting the view model for a cell
        let cellVM = viewModel.getCellViewModel(at: indexPath)
        
        cell.onboardCellViewModel = cellVM
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }

}
