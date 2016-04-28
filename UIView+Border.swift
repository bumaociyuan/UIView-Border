//
//  UIView+Border.swift
//  HRCalendarView
//
//  Created by admin on 4/28/16.
//  Copyright © 2016 __ASIAINFO__. All rights reserved.
//

import UIKit

extension UIView {
	
    var borderPosition: UIRectEdge? {
		set {
            removeAllBorder()
			addBorderTo(position: newValue!)
		}
		get {
            var result: UIRectEdge = []
            if viewWithTag(UIRectEdge.Top.tag) != nil {
               result = result.union(.Top)
            }
            if viewWithTag(UIRectEdge.Bottom.tag) != nil {
               result = result.union(.Bottom)
            }
            if viewWithTag(UIRectEdge.Left.tag) != nil {
               result = result.union(.Left)
            }
            if viewWithTag(UIRectEdge.Right.tag) != nil {
               result = result.union(.Right)
            }
            return result
		}
	}
	
	private func addBorderTo(position position: UIRectEdge) {
		switch position {
		case UIRectEdge.All:
			addSubview(borderAt(position: UIRectEdge.Top))
			addSubview(borderAt(position: UIRectEdge.Bottom))
			addSubview(borderAt(position: UIRectEdge.Left))
			addSubview(borderAt(position: UIRectEdge.Right))
		case UIRectEdge.None:
			break
		default:
			if position.contains(UIRectEdge.Top) {
				addSubview(borderAt(position: UIRectEdge.Top))
			}
			
			if position.contains(UIRectEdge.Bottom) {
				addSubview(borderAt(position: UIRectEdge.Bottom))
			}
			if position.contains(UIRectEdge.Left) {
				addSubview(borderAt(position: UIRectEdge.Left))
			}
			if position.contains(UIRectEdge.Right) {
				addSubview(borderAt(position: UIRectEdge.Right))
			}
		}
	}
	
	private func borderAt(position position: UIRectEdge) -> UIView {
		let result = UIView()
		result.backgroundColor = UIColor.blackColor()
		result.tag = position.tag
		let lineThin: CGFloat = 1.0 / UIScreen.mainScreen().nativeScale
		let width = CGRectGetWidth(bounds)
		let height = CGRectGetHeight(bounds)
		switch position {
		case UIRectEdge.Top:
			result.frame = CGRect(x: 0, y: 0, width: width, height: lineThin)
			result.autoresizingMask = .FlexibleTopMargin
		case UIRectEdge.Bottom:
			result.frame = CGRect(x: 0, y: height - lineThin, width: width, height: lineThin)
			result.autoresizingMask = .FlexibleBottomMargin
		case UIRectEdge.Left:
			result.frame = CGRect(x: 0, y: 0, width: lineThin, height: height)
			result.autoresizingMask = .FlexibleLeftMargin
		case UIRectEdge.Right:
			result.frame = CGRect(x: width - lineThin, y: 0, width: lineThin, height: height)
			result.autoresizingMask = .FlexibleRightMargin
		default:
			break
		}
		return result
	}
	
	private func removeAllBorder() {
		viewWithTag(UIRectEdge.Top.tag)?.removeFromSuperview()
		viewWithTag(UIRectEdge.Bottom.tag)?.removeFromSuperview()
		viewWithTag(UIRectEdge.Left.tag)?.removeFromSuperview()
		viewWithTag(UIRectEdge.Right.tag)?.removeFromSuperview()
	}
}

extension UIRectEdge {
	var tag: Int {
		get {
			var result = 231431421
			switch self {
			case UIRectEdge.Top:
				result += 1
			case UIRectEdge.Left:
				result += 2
			case UIRectEdge.Bottom:
				result += 3
			case UIRectEdge.Right:
				result += 4
			default:
				break
			}
			return result
		}
	}
}