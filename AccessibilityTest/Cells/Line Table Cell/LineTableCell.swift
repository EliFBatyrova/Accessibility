//
//  LineTableCell.swift
//  AccessibilityTest
//
//  Created by Elina Batyrova on 05.11.2022.
//

import UIKit
import SnapKit

final class LineTableCell: UITableViewCell {
    
    // MARK: - Instance Private Properties
    
    private var model: LineTableCellViewModel?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "right_arrow_icon")
        imageView.tintColor = UIColor.black
        imageView.adjustsImageSizeForAccessibilityContentSizeCategory = true
        imageView.setContentHuggingPriority(.required, for: .horizontal)
        imageView.setContentCompressionResistancePriority(.required, for: .horizontal)
        return imageView
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGray5
        return view
    }()
    
    // MARK: - Init

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        configureView()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureView()
    }
    
    // MARK: - Instance Private Methods
    
    func configureView() {
        selectionStyle = .none
        
        guard let model else { return }
        
        titleLabel.text = model.title
        
        self.addSubview(titleLabel)
        self.addSubview(separatorView)
        self.addSubview(iconImageView)

        titleLabel.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(24)
            maker.top.equalToSuperview().offset(17)
            maker.bottom.equalToSuperview().offset(-17)
        }
        
        iconImageView.snp.makeConstraints { maker in
            maker.trailing.equalToSuperview().offset(-8)
            maker.centerY.equalToSuperview()
            maker.left.equalTo(titleLabel.snp.right).offset(8)
        }
        
        separatorView.snp.makeConstraints { maker in
            maker.height.equalTo(1)
            maker.bottom.trailing.equalToSuperview()
            maker.leading.equalToSuperview().offset(12)
        }
    }
    
    // MARK: - Instance Public Methods
    
    public func update(model: LineTableCellViewModel) {
        self.model = model

        configureView()
    }
}
