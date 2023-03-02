//
//  ViewController.swift
//  WantedHomework
//
//  Created by Jae-hoon Sim on 2023/03/02.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    let viewModel = ViewModel()
    let disposeBag = DisposeBag()

    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }()

    let horizontalStackViews: [UIStackView] = {
        let stackViews = (0..<5).map { _ -> UIStackView in
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.alignment = .center
            return stackView
        }
        return stackViews
    }()

    let imageViews: [UIImageView] = {
        let imageViews = (0..<5).map { _ -> UIImageView in
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(systemName: "photo")
            return imageView
        }
        return imageViews
    }()

    let loadButtons: [UIButton] = {
        let buttons = (0..<5).map { _ -> UIButton in
            let button = UIButton()
            button.setTitle("Load", for: .normal)
            button.backgroundColor = .systemBlue
            button.setTitleColor(.white, for: .normal)
            button.layer.cornerRadius = 5
            return button
        }
        return buttons
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
        self.bind()
    }

    private func bind() {
        let output = self.viewModel.transform(
            input: ViewModel.Input(
                buttonTapped: Observable<Int>
                    .merge(self.loadButtons.enumerated().map { index, button in
                        button.rx.tap.map { index }.asObservable()
                    }),
                loadAllTapped: self.loadAllImagesButton.rx.tap.asObservable()))
        output.image.bind { index, imageData in
            DispatchQueue.main.async {
                if let data = imageData {
                    self.imageViews[index].image = UIImage(data: data)
                } else {
                    self.imageViews[index].image = nil
                    self.imageViews[index].image = UIImage(systemName: "photo")
                }
            }
        }
        .disposed(by: self.disposeBag)
    }

    private func configure() {
        self.view.backgroundColor = .white

        self.view.translatesAutoresizingMaskIntoConstraints = false
        let safeAreaLayoutGuide = self.view.safeAreaLayoutGuide
        self.configureStackViews(safeAreaLayoutGuide: safeAreaLayoutGuide)
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

        self.horizontalStackViews.enumerated().forEach { index, stackView in
            self.verticalStackView.addArrangedSubview(stackView)
            stackView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                stackView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.14)
            ])

            stackView.addArrangedSubview(self.imageViews[index])
            stackView.addArrangedSubview(self.loadButtons[index])
            NSLayoutConstraint.activate([
                self.imageViews[index].heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.14),
                self.imageViews[index].widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.30),
                self.loadButtons[index].heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.05),
                self.loadButtons[index].widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.22)
            ])
        }
        self.verticalStackView.addArrangedSubview(self.loadAllImagesButton)
        self.loadAllImagesButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.loadAllImagesButton.widthAnchor.constraint(equalTo: self.verticalStackView.widthAnchor),
            self.loadAllImagesButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.05)
        ])
    }
}
