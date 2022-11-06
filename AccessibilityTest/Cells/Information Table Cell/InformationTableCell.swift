//
//  InformationTableCell.swift
//  AccessibilityTest
//
//  Created by Elina Batyrova on 05.11.2022.
//

import UIKit
import SnapKit

final class InformationTableCell: UITableViewCell {
    
    // MARK: - Instance Private Properties
    
    private var model: InformationTableCellViewModel?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        return label
    }()

    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.systemGray
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0  
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.systemGray2
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
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
        
        self.addSubview(contentStackView)
        
        contentStackView.snp.makeConstraints { maker in
            maker.leading.trailing.top.bottom.equalToSuperview().inset(UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))
        }
        
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
        dateLabel.text = model.dateTitle

        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(subtitleLabel)
        contentStackView.addArrangedSubview(dateLabel)
        
        let isAccessibilityCategory = traitCollection.preferredContentSizeCategory.isAccessibilityCategory
        contentStackView.axis = isAccessibilityCategory ? .vertical : .horizontal
    }
    
    // MARK: - Instance Public Methods
    
    public func update(model: InformationTableCellViewModel) {
        self.model = model

        configureView()
    }
}
