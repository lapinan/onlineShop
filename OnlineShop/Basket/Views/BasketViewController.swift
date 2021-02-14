//
//  BasketViewController.swift
//  OnlineShop
//
//  Created by Андрей Лапин on 14.02.2021.
//

import UIKit
import SnapKit

class BasketViewController: UIViewController {
    
    //MARK: View
    private lazy var productTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .white
        table.separatorInset = .zero
        table.rowHeight = 96
        return table
    }()
    private let buyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        button.setTitle("Оформить заказ", for: .normal)
        return button
    }()
    private let fullPriceView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let nameTotalPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        label.textColor = .black
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        label.text = "Итого:"
        return label
    }()
    private let totalPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        label.textColor = .black
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        label.alpha = 0.4
        label.textAlignment = .right
        return label
    }()
    private let lowerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.741, green: 0.741, blue: 0.741, alpha: 1)
        return view
    }()
    
    //MARK: Override
    override func viewDidLoad() {
        super.viewDidLoad()
        //View
        view.backgroundColor = .white
        
        //Constraints
        setupNavBar()
        setBuyButtonConstraints()
        setFullPriceViewConstraints()
        setProductTableViewConstraints()
    }

    //MARK: Constraints
    private func setupNavBar() {
        navigationItem.title = "Корзина"
    }
    private func setBuyButtonConstraints() {
        view.addSubview(buyButton)
        
        //Constraints
        buyButton.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(16)
        }
        
        //
        buyButton.layer.cornerRadius = 24
    }
    private func setProductTableViewConstraints() {
        view.addSubview(productTableView)
        
        productTableView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(fullPriceView.snp.top)
        }
    }
    private func setFullPriceViewConstraints() {
        view.addSubview(fullPriceView)
        
        
        //constraints mainView
        fullPriceView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(64)
            make.bottom.equalTo(buyButton.snp.top).inset(-20)
        }
        
        //constraints nameTotalPriceLabel
        fullPriceView.addSubview(nameTotalPriceLabel)
        nameTotalPriceLabel.snp.makeConstraints { make in
            make.left.equalTo(fullPriceView.snp.left).inset(16)
            make.height.equalTo(16)
            make.centerY.equalTo(fullPriceView.snp.centerY)
            make.right.equalTo(fullPriceView.snp.centerX)
        }
        
        //constraints totalPriceLabel
        fullPriceView.addSubview(totalPriceLabel)
        totalPriceLabel.snp.makeConstraints { make in
            make.right.equalTo(fullPriceView.snp.right).inset(16)
            make.centerY.equalTo(fullPriceView.snp.centerY)
            make.height.equalTo(16)
            make.left.equalTo(fullPriceView.snp.centerX)
        }
        
        //constraints lowerView
        fullPriceView.addSubview(lowerView)
        lowerView.snp.makeConstraints { make in
            make.height.equalTo(0.5)
            make.width.equalTo(fullPriceView.snp.width)
            make.bottom.equalTo(fullPriceView.snp.bottom)
        }
    }
}

//MARK: DataSource
extension BasketViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

//MARK: Delegate
extension BasketViewController: UITableViewDelegate { }
