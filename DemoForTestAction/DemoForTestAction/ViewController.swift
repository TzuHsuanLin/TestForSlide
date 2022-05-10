//
//  ViewController.swift
//  DemoForTestAction
//
//  Created by 林子愃 on 2022/4/20.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.isPagingEnabled = true
        
        let colors: [UIColor] = [.red, .yellow, .blue]
        let views: [View] = [.init(), .init(), .init()]
        
       let tuples = Array(zip(colors, views))
        
        for i in tuples.indices {
            let tup = tuples[i]
            tup.1.backgroundColor = tup.0
            scroll.addSubview(tup.1)
            tup.1.label.text = "\(i)"
            if i == 0 {
                NSLayoutConstraint.activate([
                    tup.1.leadingAnchor.constraint(equalTo: scroll.leadingAnchor)
                ])
            } else if i == tuples.count - 1 {
                NSLayoutConstraint.activate([
                    tup.1.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
                    tup.1.leadingAnchor.constraint(equalTo: tuples[i-1].1.trailingAnchor)
                ])
            } else {
                NSLayoutConstraint.activate([
                    tup.1.leadingAnchor.constraint(equalTo: tuples[i-1].1.trailingAnchor)
        
                ])
            }

            NSLayoutConstraint.activate([
                tup.1.topAnchor.constraint(equalTo: scroll.topAnchor),
                tup.1.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
                tup.1.widthAnchor.constraint(equalTo: scroll.widthAnchor),
                tup.1.heightAnchor.constraint(equalTo: scroll.heightAnchor)
            ])
            
        }
        
        
        view.addSubview(scroll)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: view.topAnchor),
            scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
}

class View: UIView {
    let label: UILabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
