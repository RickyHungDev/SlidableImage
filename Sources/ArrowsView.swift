//
//  ArrowsView.swift
//  SlidableImage
//
//  Created by Pawel Bednorz on 18.12.2016.
//  Copyright © 2016 Quver. All rights reserved.
//

import UIKit

class ArrowsView: UIView {

  private let factorValue: CGFloat = 0.05

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .clear
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    backgroundColor = .clear
  }

  override func draw(_ rect: CGRect) {
    drawCircle(rect)
    drawRightArrows(rect)
    drawLeftArrow(rect)
  }

  private func drawCircle(_ rect: CGRect) {
    let circle = UIBezierPath(ovalIn: rect)
    let circleLayer = CAShapeLayer()
    circleLayer.path = circle.cgPath
    circleLayer.fillColor = UIColor.lightGray.cgColor
    circleLayer.shadowColor = UIColor.darkGray.cgColor
    circleLayer.shadowOpacity = 1
    circleLayer.shadowOffset = CGSize.zero
    circleLayer.shadowRadius = 10
    layer.addSublayer(circleLayer)
  }

  private func drawRightArrows(_ rect: CGRect) {
    let factor = rect.width * factorValue
    let doubleFactor = factor * 2

    let startPointRight = CGPoint(x: (rect.maxX - doubleFactor), y: rect.midY)
    let arrowRight = UIBezierPath()
    arrowRight.move(to: startPointRight)
    arrowRight.addLine(to: CGPoint(x: (rect.midX + factor), y: (rect.minY + doubleFactor)))
    arrowRight.addLine(to: CGPoint(x: (rect.midX + factor), y: (rect.maxY - doubleFactor)))
    arrowRight.addLine(to: startPointRight)

    let arrowRightLayer = CAShapeLayer()
    arrowRightLayer.path = arrowRight.cgPath
    arrowRightLayer.fillColor = UIColor.white.cgColor
    layer.addSublayer(arrowRightLayer)
  }

  private func drawLeftArrow(_ rect: CGRect) {
    let factor: CGFloat = rect.width * factorValue
    let doubleFactor = factor * 2

    let startPointLeft = CGPoint(x: (rect.minX + doubleFactor), y: rect.midY)
    let arrowLeft = UIBezierPath()
    arrowLeft.move(to: startPointLeft)
    arrowLeft.addLine(to: CGPoint(x: (rect.midX - factor), y: (rect.minY + doubleFactor)))
    arrowLeft.addLine(to: CGPoint(x: (rect.midX - factor), y: (rect.maxY - doubleFactor)))
    arrowLeft.addLine(to: startPointLeft)

    let arrowLeftLayer = CAShapeLayer()
    arrowLeftLayer.path = arrowLeft.cgPath
    arrowLeftLayer.fillColor = UIColor.white.cgColor
    layer.addSublayer(arrowLeftLayer)
  }

}
