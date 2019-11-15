//
//  Reusable.swift
//  GOATWeather
//
//  Created by Komran Ghahremani on 11/14/19.
//  Copyright © 2019 Komran Ghahremani. All rights reserved.
//

import UIKit

// Old code that I wrote that I like to use for table views

protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String { return String(describing: Self.self) }
}

extension UITableViewCell: Reusable {}
extension UITableViewHeaderFooterView: Reusable {}

extension UITableView {
    func register<T: UITableViewCell>(cell cellType: T.Type) {
        self.register(cellType.self, forCellReuseIdentifier: cellType.reuseIdentifier)
    }

    func dequeueCell<T: UITableViewCell>(of cellType: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else { fatalError("Unexpected cell reuse identifier") }
        return cell
    }

    func register<T: UITableViewHeaderFooterView>(headerFooter viewType: T.Type) {
        self.register(viewType.self, forHeaderFooterViewReuseIdentifier: viewType.reuseIdentifier)
    }

    func dequeueHeaderFooter<T: UITableViewHeaderFooterView>(of viewType: T.Type) -> T {
        guard let view = self.dequeueReusableHeaderFooterView(withIdentifier: viewType.reuseIdentifier) as? T else { fatalError("Unexpected header/footer reuse identifier") }
        return view
    }
}
