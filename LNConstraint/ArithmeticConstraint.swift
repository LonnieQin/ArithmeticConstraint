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

func addConstraint(oldValue:ArithmeticConstraint,newValue:ArithmeticConstraint,relation:NSLayoutRelation = .equal) {
    let owner = oldValue.owner
    if owner?.translatesAutoresizingMaskIntoConstraints == true{
        owner?.translatesAutoresizingMaskIntoConstraints = false
    }
    if owner == nil {
        return
    }
    let constraint = NSLayoutConstraint(item: owner!, attribute: oldValue.attribute, relatedBy: relation, toItem: newValue.owner, attribute: newValue.attribute, multiplier: newValue.multiplyer, constant: newValue.constant)
    owner!.superview?.addConstraint(constraint)}

class LN:NSObject {
    weak var owner:UIView?
    let left:ArithmeticConstraint
    let right:ArithmeticConstraint
    let leading:ArithmeticConstraint
    let trailing:ArithmeticConstraint
    let top:ArithmeticConstraint
    let bottom:ArithmeticConstraint
    let width:ArithmeticConstraint
    let height:ArithmeticConstraint
    let centerX:ArithmeticConstraint
    let centerY:ArithmeticConstraint
    let lastBaseline:ArithmeticConstraint
    let firstBaseline:ArithmeticConstraint
    let leftMargin:ArithmeticConstraint
    let rightMargin:ArithmeticConstraint
    let topMargin:ArithmeticConstraint
    let bottomMargin:ArithmeticConstraint
    let leadingMargin:ArithmeticConstraint
    let trailingMargin:ArithmeticConstraint
    let centerXWithinMargins:ArithmeticConstraint
    let centerYWithinMargins:ArithmeticConstraint

    init(owner:UIView?) {
        func f(_ attribute:NSLayoutAttribute)->ArithmeticConstraint {
            var v = ArithmeticConstraint(attribute)
            v.owner = owner
            return v
        }
        left = f(.left)
        right = f(.right)
        leading = f(.leading)
        trailing = f(.trailing)
        top = f(.top)
        bottom = f(.bottom)
        width = f(.width)
        height = f(.height)
        centerX = f(.centerX)
        centerY = f(.centerY)
        lastBaseline = f(.lastBaseline)
        firstBaseline = f(.firstBaseline)
        leftMargin = f(.leftMargin)
        rightMargin = f(.rightMargin)
        topMargin = f(.topMargin)
        bottomMargin = f(.bottomMargin)
        leadingMargin = f(.leadingMargin)
        trailingMargin = f(.trailingMargin)
        centerXWithinMargins = f(.centerXWithinMargins)
        centerYWithinMargins = f(.centerYWithinMargins)
        super.init()
    }
}
private var LNKey = 1
extension UIView {
    var ln:LN {
        get {
            var ln:LN? = objc_getAssociatedObject(self, &LNKey) as? LN
            if ln == nil {
                ln = LN(owner:self)
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

func == (left:ArithmeticConstraint,right:ArithmeticConstraint) {
    addConstraint(oldValue: left, newValue: right,relation: .equal)
}

func <= (left:ArithmeticConstraint,right:ArithmeticConstraint) {
    addConstraint(oldValue: left, newValue: right,relation: .lessThanOrEqual)
}

func >= (left:ArithmeticConstraint,right:ArithmeticConstraint) {
    addConstraint(oldValue: left, newValue: right,relation: .greaterThanOrEqual)
}
