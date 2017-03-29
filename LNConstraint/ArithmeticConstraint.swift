//
//  ArithmeticConstraint.swift
//
//  Created by Apple on 2017/3/29.
//  Copyright © 2017年 lonnie. All rights reserved.
//

import Foundation
import UIKit

struct ArithmeticConstraint {
    weak var owner:UIView?
    var attribute:NSLayoutAttribute
    var constant:CGFloat = 0
    var multiplyer:CGFloat = 1
    var relation:NSLayoutRelation = .equal
    var priority:UILayoutPriority = UILayoutPriorityRequired
    init(_ attribute:NSLayoutAttribute) {
        self.attribute = attribute
    }
    
    mutating func set(attribute:NSLayoutAttribute,owner:UIView?,constant:CGFloat = 0,multiplyler:CGFloat = 1,relation:NSLayoutRelation = .equal) {
        self.attribute = attribute
        self.owner = owner
        self.constant = constant
        self.multiplyer = multiplyler
        self.relation = relation
    }
}



func ArithmeticHeight(_ height:CGFloat)->ArithmeticConstraint {
    var attribute = ArithmeticConstraint(.height)
    attribute.constant = height
    return attribute
}

func ArithmeticWidth(_ width:CGFloat)->ArithmeticConstraint {
    var attribute = ArithmeticConstraint(.width)
    attribute.constant = width
    return attribute
}

class LN:NSObject {
    weak var owner:UIView?
    var skip:Bool = false
    var left:ArithmeticConstraint = ArithmeticConstraint(.left) {
        willSet {
            addConstraint(oldValue: left, newValue: newValue)
        }
        didSet {
            left.set(attribute: .left, owner: owner)
        }
    }
    
    var right:ArithmeticConstraint = ArithmeticConstraint(.right) {
        willSet {
            addConstraint(oldValue: right, newValue: newValue)
        }
        didSet {
            right.set(attribute: .right, owner: owner)
        }
    }

    var leading:ArithmeticConstraint = ArithmeticConstraint(.leading) {
        willSet {
            addConstraint(oldValue: leading, newValue: newValue)
        }
        didSet {
            leading.set(attribute: .leading, owner: owner)
        }
    }
    
    var trailing:ArithmeticConstraint = ArithmeticConstraint(.trailing) {
        willSet {
            addConstraint(oldValue: trailing, newValue: newValue)
        }
        didSet {
            trailing.set(attribute: .trailing, owner: owner)
        }
    }
    
    var top:ArithmeticConstraint = ArithmeticConstraint(.top) {
        willSet {
            addConstraint(oldValue: top, newValue: newValue)
        }
        didSet {
            top.set(attribute: .top, owner: owner)
        }
    }
    
    var bottom:ArithmeticConstraint = ArithmeticConstraint(.bottom) {
        willSet {
            addConstraint(oldValue: bottom, newValue: newValue)
        }
        didSet {
            bottom.set(attribute: .bottom, owner: owner)
        }
    }
    
    var width:ArithmeticConstraint = ArithmeticConstraint(.width) {
        willSet {
            addConstraint(oldValue: width, newValue: newValue)
        }
        didSet {
            width.set(attribute: .width, owner: owner)
        }
    }
    
    var height:ArithmeticConstraint = ArithmeticConstraint(.height) {
        willSet {
            addConstraint(oldValue: height, newValue: newValue)
        }
        didSet {
            height.set(attribute: .height, owner: owner)
        }
    }
    
    var centerX:ArithmeticConstraint = ArithmeticConstraint(.centerX) {
        willSet {
            addConstraint(oldValue: centerX, newValue: newValue)
        }
        didSet {
            centerX.set(attribute: .centerX, owner: owner)
        }
    }
    
    var centerY:ArithmeticConstraint = ArithmeticConstraint(.centerY) {
        willSet {
            addConstraint(oldValue: centerY, newValue: newValue)
        }
        didSet {
            centerY.set(attribute: .centerY, owner: owner)
        }
    }
    
    var lastBaseline:ArithmeticConstraint = ArithmeticConstraint(.lastBaseline) {
        willSet {
            addConstraint(oldValue: lastBaseline, newValue: newValue)
        }
        didSet {
            lastBaseline.set(attribute: .lastBaseline, owner: owner)
        }
    }
    
    var firstBaseline:ArithmeticConstraint = ArithmeticConstraint(.firstBaseline) {
        willSet {
            addConstraint(oldValue: firstBaseline, newValue: newValue)
        }
        didSet {
            firstBaseline.set(attribute: .firstBaseline, owner: owner)
        }
    }
    

    var leftMargin:ArithmeticConstraint = ArithmeticConstraint(.leftMargin) {
        willSet {
            addConstraint(oldValue: leftMargin, newValue: newValue)
        }
        didSet {
            leftMargin.set(attribute: .leftMargin, owner: owner)
        }
    }
    
    var rightMargin:ArithmeticConstraint = ArithmeticConstraint(.rightMargin) {
        willSet {
            addConstraint(oldValue: rightMargin, newValue: newValue)
        }
        didSet {
            rightMargin.set(attribute: .rightMargin, owner: owner)
        }
    }
    
    var topMargin:ArithmeticConstraint = ArithmeticConstraint(.topMargin) {
        willSet {
            addConstraint(oldValue: topMargin, newValue: newValue)
        }
        didSet {
            topMargin.set(attribute: .topMargin, owner: owner)
        }
    }


    var bottomMargin:ArithmeticConstraint = ArithmeticConstraint(.bottomMargin) {
        willSet {
            addConstraint(oldValue: bottomMargin, newValue: newValue)
        }
        didSet {
            bottomMargin.set(attribute: .bottomMargin, owner: owner)
        }
    }

    var leadingMargin:ArithmeticConstraint = ArithmeticConstraint(.leadingMargin) {
        willSet {
            addConstraint(oldValue: leadingMargin, newValue: newValue)
        }
        didSet {
            leadingMargin.set(attribute: .leadingMargin, owner: owner)
        }
    }

    var trailingMargin:ArithmeticConstraint = ArithmeticConstraint(.trailingMargin) {
        willSet {
            addConstraint(oldValue: trailingMargin, newValue: newValue)
        }
        didSet {
            trailingMargin.set(attribute: .trailingMargin, owner: owner)
        }
    }
    
    var centerXWithinMargins:ArithmeticConstraint = ArithmeticConstraint(.centerXWithinMargins) {
        willSet {
            addConstraint(oldValue: centerXWithinMargins, newValue: newValue)
        }
        didSet {
            centerXWithinMargins.set(attribute: .centerXWithinMargins, owner: owner)
        }
    }
    
    var centerYWithinMargins:ArithmeticConstraint = ArithmeticConstraint(.centerYWithinMargins) {
        willSet {
            addConstraint(oldValue: centerYWithinMargins, newValue: newValue)
        }
        didSet {
            centerYWithinMargins.set(attribute: .centerYWithinMargins, owner: owner)
        }
    }

    
    func addConstraint(oldValue:ArithmeticConstraint,newValue:ArithmeticConstraint) {
        if skip == true {return}
        if owner?.translatesAutoresizingMaskIntoConstraints == true{
            owner?.translatesAutoresizingMaskIntoConstraints = false
        }
        if owner != nil {
            let constraint = NSLayoutConstraint(item: owner!, attribute: oldValue.attribute, relatedBy: oldValue.relation, toItem: newValue.owner, attribute: newValue.attribute, multiplier: newValue.multiplyer, constant: newValue.constant)
            owner!.superview?.addConstraint(constraint)
        } else {
            let constraint = NSLayoutConstraint(item: owner!, attribute: oldValue.attribute, relatedBy: oldValue.relation, toItem: newValue.owner, attribute: newValue.attribute, multiplier: newValue.multiplyer, constant: newValue.constant)
            owner!.addConstraint(constraint)
        }
    }
    
}
private var LNKey = 1
extension UIView {
    var ln:LN {
        get {
            var ln:LN? = objc_getAssociatedObject(self, &LNKey) as? LN
            if ln == nil {
                ln = LN()
                ln!.skip = true
                ln!.owner = self
                ln!.left.owner = self
                ln!.right.owner = self
                ln!.leading.owner = self
                ln!.trailing.owner = self
                ln!.top.owner = self
                ln!.bottom.owner = self
                ln!.width.owner = self
                ln!.height.owner = self
                ln!.centerX.owner = self
                ln!.centerY.owner = self
                ln!.firstBaseline.owner = self
                ln!.lastBaseline.owner = self
                ln!.leftMargin.owner = self
                ln!.rightMargin.owner = self
                ln!.topMargin.owner = self
                ln!.bottomMargin.owner = self
                ln!.leadingMargin.owner = self
                ln!.trailingMargin.owner = self
                ln!.topMargin.owner = self
                ln!.bottomMargin.owner = self
                ln!.centerXWithinMargins.owner = self
                ln!.centerYWithinMargins.owner = self
                ln!.skip = false
                objc_setAssociatedObject(self, &LNKey, ln,.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
            return ln!
        }
    }
}

func * (left:CGFloat,right:ArithmeticConstraint)->ArithmeticConstraint {
    var attr = ArithmeticConstraint(right.attribute)
    attr.multiplyer *= left
    attr.owner = right.owner
    attr.constant = right.constant
    attr.relation = right.relation
    return attr
}

func * (left:ArithmeticConstraint,right:CGFloat)->ArithmeticConstraint {
    return right*left
}
func / (left:ArithmeticConstraint,right:CGFloat)->ArithmeticConstraint {
    return (CGFloat(1.0)/right) * left
}
func + (left:ArithmeticConstraint,right:CGFloat)->ArithmeticConstraint {
    var attr = ArithmeticConstraint(left.attribute)
    attr.constant = left.constant + right
    attr.owner = left.owner
    attr.multiplyer = left.multiplyer
    return attr
}

func - (left:ArithmeticConstraint,right:CGFloat)->ArithmeticConstraint {
    return left+(-right)
}

func <= (left:ArithmeticConstraint,right:ArithmeticConstraint) {
    addAttribute(left: left, right: right, relation: .lessThanOrEqual)
}

func >= (left:ArithmeticConstraint,right:ArithmeticConstraint) {
    addAttribute(left: left, right: right, relation: .greaterThanOrEqual)
}


fileprivate func addAttribute(left:ArithmeticConstraint,right:ArithmeticConstraint,relation:NSLayoutRelation) {
    guard let ln = left.owner?.ln else {return}
    switch left.attribute {
    case .left:
        ln.left.relation = relation
        ln.left = right
    case .right:
        ln.right.relation = relation
        ln.right = right
    case .leading:
        ln.leading.relation = relation
        ln.leading = right
    case .trailing:
        ln.trailing.relation = relation
        ln.trailing = right
    case .top:
        ln.top.relation = relation
        ln.top = right
    case .bottom:
        ln.bottom.relation = relation
        ln.bottom = right
    case .centerX:
        ln.centerX.relation = relation
        ln.centerX = right
    case .centerY:
        ln.centerY.relation = relation
        ln.centerY = right
    case .width:
        ln.width.relation = relation
        ln.width = right
    case .height:
        ln.height.relation = relation
        ln.height = right
    case .firstBaseline:
        ln.firstBaseline.relation = relation
        ln.firstBaseline = right
    case .lastBaseline:
        ln.lastBaseline.relation = relation
        ln.lastBaseline = right
    case .leftMargin:
        ln.leftMargin.relation = relation
        ln.leftMargin = right
    case .rightMargin:
        ln.rightMargin.relation = relation
        ln.rightMargin = right
    case .topMargin:
        ln.topMargin.relation = relation
        ln.topMargin = right
    case .bottomMargin:
        ln.bottomMargin.relation = relation
        ln.bottomMargin = right
    case .leadingMargin:
        ln.leadingMargin.relation = relation
        ln.leadingMargin = right
    case .trailingMargin:
        ln.trailingMargin.relation = relation
        ln.trailingMargin = right
    case .centerXWithinMargins:
        ln.centerXWithinMargins.relation = relation
        ln.centerXWithinMargins = right
    case .centerYWithinMargins:
        ln.centerYWithinMargins.relation = relation
        ln.centerYWithinMargins = right
    default:break
    }
}
