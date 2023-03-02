//
//  ViewController.swift
//  WantedHomework
//
//  Created by Jae-hoon Sim on 2023/03/02.
//

import UIKit

class ViewController: UIViewController {

    let viewModel = ViewModel()

    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }()

    let horizontalStackView1: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()

    let horizontalStackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()

    let horizontalStackView3: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()

    let horizontalStackView4: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()

    let horizontalStackView5: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()

    let imageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    let imageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    let imageView3: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    let imageView4: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    let imageView5: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    let loadButton1: UIButton = {
        let button = UIButton()
        button.setTitle("Load", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        return button
    }()

    let loadButton2: UIButton = {
        let button = UIButton()
        button.setTitle("Load", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        return button
    }()

    let loadButton3: UIButton = {
        let button = UIButton()
        button.setTitle("Load", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        return button
    }()

    let loadButton4: UIButton = {
        let button = UIButton()
        button.setTitle("Load", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        return button
    }()

    let loadButton5: UIButton = {
        let button = UIButton()
        button.setTitle("Load", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        return button
    }()

    let loadAllImagesButton: UIButton = {
        let button = UIButton()
        button.setTitle("Load All Images", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
    }

    private func configure() {
        self.view.backgroundColor = .white

        self.view.translatesAutoresizingMaskIntoConstraints = false
        let safeAreaLayoutGuide = self.view.safeAreaLayoutGuide

        self.configureStackViews(safeAreaLayoutGuide: safeAreaLayoutGuide)
        self.configureStackViewContents(safeAreaLayoutGuide: safeAreaLayoutGuide)
    }

    private func configureStackViews(safeAreaLayoutGuide: UILayoutGuide){
        self.view.addSubview(self.verticalStackView)
        self.verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.verticalStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            self.verticalStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15),
            self.verticalStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant:  -15),
            self.verticalStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -15)
        ])

        self.verticalStackView.addArrangedSubview(self.horizontalStackView1)
        self.horizontalStackView1.translatesAutoresizingMaskIntoConstraints = false
        self.verticalStackView.addArrangedSubview(self.horizontalStackView2)
        self.horizontalStackView2.translatesAutoresizingMaskIntoConstraints = false
        self.verticalStackView.addArrangedSubview(self.horizontalStackView3)
        self.horizontalStackView3.translatesAutoresizingMaskIntoConstraints = false
        self.verticalStackView.addArrangedSubview(self.horizontalStackView4)
        self.horizontalStackView4.translatesAutoresizingMaskIntoConstraints = false
        self.verticalStackView.addArrangedSubview(self.horizontalStackView5)
        self.horizontalStackView5.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.horizontalStackView1.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.14),
            self.horizontalStackView2.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.14),
            self.horizontalStackView3.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.14),
            self.horizontalStackView4.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.14),
            self.horizontalStackView5.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.14)
        ])
    }
    private func configureStackViewContents(safeAreaLayoutGuide: UILayoutGuide){
        self.horizontalStackView1.addArrangedSubview(self.imageView1)
        self.horizontalStackView1.addArrangedSubview(self.loadButton1)
        self.horizontalStackView2.addArrangedSubview(self.imageView2)
        self.horizontalStackView2.addArrangedSubview(self.loadButton2)
        self.horizontalStackView3.addArrangedSubview(self.imageView3)
        self.horizontalStackView3.addArrangedSubview(self.loadButton3)
        self.horizontalStackView4.addArrangedSubview(self.imageView4)
        self.horizontalStackView4.addArrangedSubview(self.loadButton4)
        self.horizontalStackView5.addArrangedSubview(self.imageView5)
        self.horizontalStackView5.addArrangedSubview(self.loadButton5)
        NSLayoutConstraint.activate([
            self.imageView1.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.14),
            self.imageView2.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.14),
            self.imageView3.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.14),
            self.imageView4.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.14),
            self.imageView5.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.14),
            self.imageView1.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.30),
            self.imageView2.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.30),
            self.imageView3.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.30),
            self.imageView4.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.30),
            self.imageView5.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.30),
            self.loadButton1.heightAnchor.constraint(equalTo:  safeAreaLayoutGuide.heightAnchor, multiplier: 0.05),
            self.loadButton2.heightAnchor.constraint(equalTo:  safeAreaLayoutGuide.heightAnchor, multiplier: 0.05),
            self.loadButton3.heightAnchor.constraint(equalTo:  safeAreaLayoutGuide.heightAnchor, multiplier: 0.05),
            self.loadButton4.heightAnchor.constraint(equalTo:  safeAreaLayoutGuide.heightAnchor, multiplier: 0.05),
            self.loadButton5.heightAnchor.constraint(equalTo:  safeAreaLayoutGuide.heightAnchor, multiplier: 0.05),
            self.loadButton1.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.22),
            self.loadButton2.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.22),
            self.loadButton3.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.22),
            self.loadButton4.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.22),
            self.loadButton5.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.22)
        ])

        self.verticalStackView.addArrangedSubview(self.loadAllImagesButton)
        self.loadAllImagesButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.loadAllImagesButton.widthAnchor.constraint(equalTo: self.verticalStackView.widthAnchor),
            self.loadAllImagesButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.05)
        ])

    }
}

