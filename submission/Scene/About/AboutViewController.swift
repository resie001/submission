//
//  AboutViewController.swift
//  submission
//
//  Created by Ade Resie on 11/09/22.
//

import UIKit
import SnapKit
import Kingfisher
import PanModal

class AboutViewController: UIViewController {

    private lazy var circleImageView = UIImageView()
    private lazy var nameLabel = UILabel()
    private lazy var emailLabel = UILabel()
    private lazy var editNameButton = UIButton()
    private lazy var editEmailButton = UIButton()
    private lazy var processor = DownsamplingImageProcessor(size: CGSize(width: 200, height: 200))

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar(title: "About", isBorderless: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        circleImageView.image = UIImage(named: "img_profile")
        circleImageView.layer.cornerRadius = 100
        circleImageView.contentMode = .scaleAspectFill
        circleImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        circleImageView.clipsToBounds = true
        circleImageView.backgroundColor = .lightGray
        view.addSubview(circleImageView)
        circleImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.height.equalTo(200)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(12)
        }
        
        nameLabel.text = Prefs.shared.getName()
        nameLabel.numberOfLines = 0
        nameLabel.textAlignment = .center
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(circleImageView.snp.bottom).offset(20)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
        
        editNameButton.setImage(UIImage(named: "ic_edit"), for: .normal)
        editNameButton.tag = 1
        editNameButton.addTarget(self, action: #selector(editAction), for: .touchUpInside)
        view.addSubview(editNameButton)
        editNameButton.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.trailing).offset(2)
            make.centerY.equalTo(nameLabel)
        }
        
        emailLabel.text = Prefs.shared.getEmail()
        emailLabel.textAlignment = .center
        emailLabel.numberOfLines = 0
        view.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
        
        editEmailButton.setImage(UIImage(named: "ic_edit"), for: .normal)
        editEmailButton.addTarget(self, action: #selector(editAction), for: .touchUpInside)
        editEmailButton.tag = 2
        view.addSubview(editEmailButton)
        editEmailButton.snp.makeConstraints { make in
            make.leading.equalTo(emailLabel.snp.trailing).offset(2)
            make.centerY.equalTo(emailLabel)
        }
    }
    
    @objc private func editAction(sender: UIButton) {
        if sender.tag == 1 {
            let bottomSheet = TextFieldBottomSheet(titleText: "Edit Name", placeholder: "Name", defaultValue: nameLabel.text!, keyboardType: .asciiCapable) { value in
                self.dismiss(animated: true) {
                    Prefs.shared.saveName(value: value, key: Constants.name)
                    self.nameLabel.text = value
                }
            }
            presentPanModal(bottomSheet)
        } else {
            let bottomSheet = TextFieldBottomSheet(titleText: "Edit Email", placeholder: "Email", defaultValue: emailLabel.text!, keyboardType: .emailAddress) { value in
                self.dismiss(animated: true) {
                    Prefs.shared.saveName(value: value, key: Constants.email)
                    self.emailLabel.text = value
                }
            }
            presentPanModal(bottomSheet)
        }
    }
}
