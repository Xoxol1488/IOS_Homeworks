//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Кирилл Пономаренко on 13.07.2022.
//


import UIKit
import StorageService
import iOSIntPackage

class PostTableViewCell: UITableViewCell {
    
    private let inCellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imagePostView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .black
        return view
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 2
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        return label
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(post: Post) {
        let imageProcessor = ImageProcessor()
        let image = imagePostView.image
        imageProcessor.processImage(sourceImage: image!, filter: .colorInvert, completion: { _ in imagePostView.image = image })
        
        imagePostView.image = UIImage(named: "\(post.image)")
        authorLabel.text = post.author
        descriptionLabel.text = post.description
        likesLabel.text = "Likes: \(post.likes)"
        viewsLabel.text = "Views: \(post.views)"
    }
    
    private func setUp() {
        
        contentView.addSubviews(inCellView,authorLabel,imagePostView, descriptionLabel, likesLabel,viewsLabel)
        
        NSLayoutConstraint.activate([
            inCellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            inCellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            inCellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            inCellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            authorLabel.topAnchor.constraint(equalTo: inCellView.topAnchor, constant: 16),
            authorLabel.leadingAnchor.constraint(equalTo: inCellView.leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: inCellView.trailingAnchor, constant: -16),
            
            imagePostView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12),
            imagePostView.leadingAnchor.constraint(equalTo: inCellView.leadingAnchor),
            imagePostView.trailingAnchor.constraint(equalTo: inCellView.trailingAnchor),
            imagePostView.heightAnchor.constraint(equalTo: inCellView.widthAnchor),
            imagePostView.widthAnchor.constraint(equalTo: inCellView.widthAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: imagePostView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: inCellView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: inCellView.trailingAnchor, constant: -16),
            
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: inCellView.leadingAnchor, constant: 16),
            likesLabel.bottomAnchor.constraint(equalTo: inCellView.bottomAnchor, constant: -16),
            
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: inCellView.trailingAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: inCellView.bottomAnchor, constant: -16)])
        
    }
}
