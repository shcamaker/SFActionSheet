//
//  actionSheet.swift
//  SFActionSheet_Example
//
//  Created by Alex.Shen on 3/26/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

protocol actionSheetDelegate: NSObjectProtocol {
    func numberOfRows() -> Int
    func titleForRow(InRow row: Int) -> String
    
}
class actionSheet: UIView {
    
    private var confirmAction: (actionSheet)->()
    
    weak var delegate: actionSheetDelegate?
    
    private lazy var pickView: UIPickerView = {
        let pickView = UIPickerView(frame: CGRect(x: 0, y: self.bounds.height-160, width: self.bounds.width, height: 120))
        pickView.delegate = self
        pickView.dataSource = self
        return pickView
    }()
    
    init(frame: CGRect, confirmAction: @escaping (actionSheet)->()) {
        self.confirmAction = confirmAction
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        backgroundColor = UIColor(white: 0.0, alpha: 0.3)
        
        setWhiteBackground()

        setActionItems()
        
        addSubview(pickView)
    }
    
    private func setActionItems() {
        let container = UIStackView(frame: CGRect(x: 32, y: self.bounds.height-200, width: self.bounds.width-64, height: 40))
        container.axis = .horizontal
        container.distribution = .equalSpacing
        container.spacing = 10
        addSubview(container)
        
        let cancelButton = UIButton()
        cancelButton.setTitle("取消", for: .normal)
        cancelButton.setTitleColor(UIColor.black, for: .normal)
        cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        container.addArrangedSubview(cancelButton)
        
        let titleLabel = UILabel()
        titleLabel.text = "切换空间"
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.textColor = UIColor.gray
        container.addArrangedSubview(titleLabel)
        
        let confirmButton = UIButton()
        confirmButton.setTitle("确定", for: .normal)
        confirmButton.setTitleColor(UIColor.red, for: .normal)
        confirmButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        confirmButton.addTarget(self, action: #selector(confirm(sender:)), for: .touchUpInside)
        container.addArrangedSubview(confirmButton)
        
    }
    
    private func setWhiteBackground() {
        let whiteBackground = UIView(frame: CGRect(x: 0, y: self.bounds.height-200, width: self.bounds.width, height: 240))
        whiteBackground.backgroundColor = UIColor.white
        whiteBackground.layer.cornerRadius = 20
        whiteBackground.layer.masksToBounds = true
        addSubview(whiteBackground)
    }
    
    @objc func cancel() {
        removeFromSuperview()
    }
    
    @objc private func confirm(sender: UIButton) {
        confirmAction(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension actionSheet: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return delegate?.numberOfRows() ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()

        pickerLabel.font = UIFont.systemFont(ofSize: 16)
        pickerLabel.textAlignment = .center
        pickerLabel.text = delegate?.titleForRow(InRow: row)

        return pickerLabel;
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
}

