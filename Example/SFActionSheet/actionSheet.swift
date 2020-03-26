//
//  actionSheet.swift
//  SFActionSheet_Example
//
//  Created by Alex.Shen on 3/26/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class actionSheet: UIView {
    private let cellID = "cellID"
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: self.bounds.height, width: self.bounds.width, height: 350))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableView.self, forCellReuseIdentifier: cellID)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    func setupUI() {
//        addSubview(<#T##view: UIView##UIView#>)
    }
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension actionSheet: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = "测试测试"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
}
