//
//  LoginViewController.swift
//  ChartsSample
//
//  Created by 山田隼也 on 2019/12/28.
//  Copyright © 2019 Shunya Yamada. All rights reserved.
//

import UIKit
import RxCocoa

final class LoginViewController: BaseViewController {
    
    // MARK: IBOutlet
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameErrorLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var setButton: UIButton!
    
    // MARK: Properties
    
    private var viewModel: LoginViewModel!
    
    // MARK: Lifecycle
    
    static func instantiate() -> LoginViewController {
        return Storyboard.LoginViewController.instantiate(LoginViewController.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bindViewModel()
    }
    
    // MARK: IBAction
}

// MARK: - Setup

extension LoginViewController {
    
    private func setupViews() {
        nameTextField.rx.controlEvent(.editingDidEndOnExit).asSignal()
            .emit(onNext: { [weak self] in self?.passwordTextField.becomeFirstResponder() })
            .disposed(by: disposeBag)
        passwordTextField.rx.controlEvent(.editingDidEndOnExit).asSignal()
            .emit(onNext: { [weak self] in self?.view.endEditing(true) })
            .disposed(by: disposeBag)
        PublishRelay
            .combineLatest(nameTextField.rx.text.orEmpty,
                           passwordTextField.rx.text.orEmpty)
            .map { (name, password) in !name.isEmpty && !password.isEmpty }
            .bind(to: setButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }
}

// MARK: - ViewModel

extension LoginViewController {
    
    private func bindViewModel() {
        viewModel = LoginViewModel()
        
        let input = LoginViewModel.Input(nameTextFieldDidInput: nameTextField.rx.text.orEmpty.asDriver(),
                                         passwordTextFieldDidInput: passwordTextField.rx.text.orEmpty.asDriver(),
                                         setButtonDidTap: setButton.rx.tap.asDriver())
        let output = viewModel.transform(input: input)
        
        output.replaceRootToTabBar
            .drive(onNext: { [weak self] in self?.replaceRootToTabBar() })
            .disposed(by: disposeBag)
    }
}

// MARK: - Transition

extension LoginViewController {
    
    private func replaceRootToTabBar() {
        let vc = TabBarController.instantiate()
        replaceRoot(to: vc)
    }
}
