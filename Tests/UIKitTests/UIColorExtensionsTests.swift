//
//  UIColorExtensionsTests.swift
//  SwifterSwift
//
//  Created by Ewelina on 25/01/2017.
//  Copyright © 2017 omaralbeik. All rights reserved.
//
import XCTest
@testable import SwifterSwift

#if !os(macOS)
class UIColorExtensionsTests: XCTestCase {
	
	// MARK: - Test properties
	func testRgbComponents() {
		XCTAssertEqual(UIColor.red.rgbComponents.red, 255)
		XCTAssertEqual(UIColor.red.rgbComponents.green, 0)
		XCTAssertEqual(UIColor.red.rgbComponents.blue, 0)
		
		XCTAssertEqual(UIColor.green.rgbComponents.red, 0)
		XCTAssertEqual(UIColor.green.rgbComponents.green, 255)
		XCTAssertEqual(UIColor.green.rgbComponents.blue, 0)
		
		XCTAssertEqual(UIColor.blue.rgbComponents.red, 0)
		XCTAssertEqual(UIColor.blue.rgbComponents.green, 0)
		XCTAssertEqual(UIColor.blue.rgbComponents.blue, 255)
		
		XCTAssertEqual(UIColor.black.rgbComponents.red, 0)
		XCTAssertEqual(UIColor.black.rgbComponents.green, 0)
		XCTAssertEqual(UIColor.black.rgbComponents.blue, 0)
		
		XCTAssertEqual(UIColor.white.rgbComponents.red, 255)
		XCTAssertEqual(UIColor.white.rgbComponents.green, 255)
		XCTAssertEqual(UIColor.white.rgbComponents.blue, 255)
	
		XCTAssertEqual(UIColor(hex: 0x12FFFF)?.rgbComponents.red, 0x12)
	}
	
	func testCGFloatComponents() {
		XCTAssertEqual(UIColor.red.cgFloatComponents.red, 1)
		XCTAssertEqual(UIColor.red.cgFloatComponents.green, 0)
		XCTAssertEqual(UIColor.red.cgFloatComponents.blue, 0)
		
		XCTAssertEqual(UIColor.green.cgFloatComponents.red, 0)
		XCTAssertEqual(UIColor.green.cgFloatComponents.green, 1)
		XCTAssertEqual(UIColor.green.cgFloatComponents.blue, 0)
		
		XCTAssertEqual(UIColor.blue.cgFloatComponents.red, 0)
		XCTAssertEqual(UIColor.blue.cgFloatComponents.green, 0)
		XCTAssertEqual(UIColor.blue.cgFloatComponents.blue, 1)
		
		XCTAssertEqual(UIColor.black.cgFloatComponents.red, 0)
		XCTAssertEqual(UIColor.black.cgFloatComponents.green, 0)
		XCTAssertEqual(UIColor.black.cgFloatComponents.blue, 0)
		
		XCTAssertEqual(UIColor.white.cgFloatComponents.red, 1)
		XCTAssertEqual(UIColor.white.cgFloatComponents.green, 1)
		XCTAssertEqual(UIColor.white.cgFloatComponents.blue, 1)
		
		let color = UIColor(hex: 0x12FFFF)!
		XCTAssertEqual(color.cgFloatComponents.red, 0.070, accuracy: 0.001)
	}
	
	func testAlpha() {
		var color: UIColor = UIColor.red
		XCTAssertEqual(color.alpha, 1.0)
		
		color = UIColor.white.withAlphaComponent(0.5)
		XCTAssertEqual(color.alpha, 0.5)
		
		color = UIColor(red: 0, green: 0, blue: 0, transparency: 0.7)!
		XCTAssertEqual(color.alpha, 0.7)
		
		color = UIColor(red: 0, green: 0, blue: 0, transparency: 1.1)!
		XCTAssertEqual(color.alpha, 1.0)
	}
	
    // MARK: - Test properties
    func testHsbaComponents() {
        var color = UIColor(hex: 0xFF0000, transparency: 1.0)
        XCTAssertEqual(color?.hsbaComponents.hue, 0.0)
        XCTAssertEqual(color?.hsbaComponents.saturation, 1.0)
        XCTAssertEqual(color?.hsbaComponents.brightness, 1.0)

        color = UIColor(hex: 0x00FF00, transparency: 1.0)
        XCTAssertEqual(CGFloat(round(1000 * (color?.hsbaComponents.hue)!) / 1000), CGFloat(round(1000 * (120/360)) / 1000))
        XCTAssertEqual(color?.hsbaComponents.saturation, 1.0)
        XCTAssertEqual(color?.hsbaComponents.brightness, 1.0)

        color = UIColor(hex: 0x0000FF, transparency: 1.0)
        XCTAssertEqual(CGFloat(round(1000 * (color?.hsbaComponents.hue)!) / 1000), CGFloat(round(1000 * (240/360)) / 1000))
        XCTAssertEqual(color?.hsbaComponents.saturation, 1.0)
        XCTAssertEqual(color?.hsbaComponents.brightness, 1.0)

        color = UIColor(hex: 0x000000, transparency: 1.0)
        XCTAssertEqual(color?.hsbaComponents.hue, 0.0)
        XCTAssertEqual(color?.hsbaComponents.saturation, 0.0)
        XCTAssertEqual(color?.hsbaComponents.brightness, 0.0)

        color = UIColor(hex: 0xFFFFFF, transparency: 1.0)
        XCTAssertEqual(color?.hsbaComponents.hue, 0.0)
        XCTAssertEqual(color?.hsbaComponents.saturation, 0.0)
        XCTAssertEqual(color?.hsbaComponents.brightness, 1.0)

        color = UIColor(hex: 0x123456, transparency: 1.0)
        XCTAssertEqual(CGFloat(round(1000 * (color?.hsbaComponents.hue)!) / 1000), CGFloat(round(1000 * (210/360)) / 1000))
        XCTAssertEqual(((color?.hsbaComponents.saturation)! * 100).rounded(), 79)
        XCTAssertEqual(((color?.hsbaComponents.brightness)! * 100).rounded(), 34)

        color = UIColor(hex: 0xFCA864, transparency: 1.0)
        XCTAssertEqual(CGFloat(round(1000 * (color?.hsbaComponents.hue)!) / 1000), CGFloat(round(1000 * (27/360)) / 1000))
        XCTAssertEqual(((color?.hsbaComponents.saturation)! * 100).rounded(), 60)
        XCTAssertEqual(((color?.hsbaComponents.brightness)! * 100).rounded(), 99)

        color = UIColor(hex: 0x1F2D3C, transparency: 1.0)
        XCTAssertEqual(CGFloat(round(1000 * (color?.hsbaComponents.hue)!) / 1000), CGFloat(round(1000 * (211/360)) / 1000))
        XCTAssertEqual(((color?.hsbaComponents.saturation)! * 100).rounded(), 48)
        XCTAssertEqual(((color?.hsbaComponents.brightness)! * 100).rounded(), 24)
    }

    func testUInt() {
        var color = UIColor(hex: 0xFF0000, transparency: 1.0)
        XCTAssertEqual(color?.uInt, 0xFF0000)

        color = UIColor(hex: 0x00FF00, transparency: 1.0)
        XCTAssertEqual(color?.uInt, 0x00FF00)

        color = UIColor(hex: 0x0000FF, transparency: 1.0)
        XCTAssertEqual(color?.uInt, 0x0000FF)

        color = UIColor(hex: 0x000000, transparency: 1.0)
        XCTAssertEqual(color?.uInt, 0x000000)

        color = UIColor(hex: 0xFFFFFF, transparency: 1.0)
        XCTAssertEqual(color?.uInt, 0xFFFFFF)

        color = UIColor(hex: 0x123456, transparency: 1.0)
        XCTAssertEqual(color?.uInt, 0x123456)

        color = UIColor(hex: 0xFCA864, transparency: 1.0)
        XCTAssertEqual(color?.uInt, 0xFCA864)

        color = UIColor(hex: 0xFCA864, transparency: 1.0)
        XCTAssertEqual(color?.uInt, 0xFCA864)

        color = UIColor(hex: 0x1F2D3C, transparency: 1.0)
        XCTAssertEqual(color?.uInt, 0x1F2D3C)

    }

    func testHexString() {
		var color = UIColor.red
		XCTAssertEqual(color.hexString, "#FF0000")
		
		color = UIColor.blue
		XCTAssertEqual(color.hexString, "#0000FF")
		
		color = UIColor(hex: 0xABCDEF)!
		XCTAssertEqual(color.hexString, "#ABCDEF")
		
		color = UIColor(hex: 0xABC)!
		XCTAssertEqual(color.hexString, "#000ABC")
		
		color = UIColor.black
		XCTAssertEqual(color.hexString, "#000000")
	}
	
	func testShortHexString() {
		var color: UIColor? = UIColor.red
		XCTAssertEqual(color?.shortHexString, "#F00")
		
		color = UIColor.blue
		XCTAssertEqual(color?.shortHexString, "#00F")
		
		color = UIColor(hexString: "#0F120F")
		XCTAssertNil(color?.shortHexString)
		
		color = UIColor(hexString: "#8FFFF")
		XCTAssertNil(color?.shortHexString)
	}
	
	func testShortHexOrHexString() {
		var color: UIColor? = UIColor.red
		XCTAssertEqual(color?.shortHexOrHexString, "#F00")
		
		color = UIColor(hexString: "#8FFFFF")
		XCTAssertEqual(color?.shortHexOrHexString, "#8FFFFF")
		
		color = UIColor(hexString: "#F")
		XCTAssertEqual(color?.shortHexOrHexString, "#00000F")
		
		color = UIColor(hexString: "#11")
		XCTAssertEqual(color?.shortHexOrHexString, "#001")
	}
	
	func testComplementary() {
		var color = UIColor.black
		var r: CGFloat = 0
		var g: CGFloat = 0
		var b: CGFloat = 0
		color.complementary?.getRed(&r, green: &g, blue: &b, alpha: nil)
		XCTAssertEqual(r, 1)
		XCTAssertEqual(g, 1)
		XCTAssertEqual(b, 1)
		
		color = UIColor.white
		color.complementary?.getRed(&r, green: &g, blue: &b, alpha: nil)
		XCTAssertEqual(r, 0)
		XCTAssertEqual(g, 0)
		XCTAssertEqual(b, 0)
		
		color = UIColor.red
		color.complementary?.getRed(&r, green: &g, blue: &b, alpha: nil)
		XCTAssertEqual(r, 0)
		XCTAssertEqual(g, 1)
		XCTAssertEqual(b, 1)
	}
	
	func testRandom() {
		let color1 = UIColor.random
		let color2 = UIColor.random
		
		XCTAssertNotEqual(color1, color2)
	}
	
	// MARK: - Test methods
	func testBlend() {
		var color1 = UIColor.white
		var color2 = UIColor.black
		
		var blendColor = UIColor.blend(color1, with: color2)
		XCTAssertEqual(blendColor.rgbComponents.red, 0xFF / 2)
		XCTAssertEqual(blendColor.rgbComponents.green, 0xFF / 2)
		XCTAssertEqual(blendColor.rgbComponents.blue, 0xFF / 2)
		
		color1 = UIColor(hex: 0x123456, transparency: 0.5)!
		color2 = UIColor(hex: 0x665544, transparency: 0.7)!
		
		blendColor = UIColor.blend(color1, with: color2)
		XCTAssertEqual(blendColor.rgbComponents.red, (0x12 + 0x66) / 2)
		XCTAssertEqual(blendColor.rgbComponents.green, (0x34 + 0x55) / 2)
		XCTAssertEqual(blendColor.rgbComponents.blue, (0x56 + 0x44) / 2)
		XCTAssertEqual(blendColor.alpha, (0.7 + 0.5) / 2)
		
		blendColor = UIColor.blend(color1, intensity1: 0.7, with: color2, intensity2: 0.3)
		var output: Double = 0x12 * 0.7 + 0x66 * 0.3
		XCTAssertEqual(blendColor.rgbComponents.red, Int(output))
		output = 0x34 * 0.7 + 0x55 * 0.3
		XCTAssertEqual(blendColor.rgbComponents.green, Int(output))
		output = 0x56 * 0.7 + 0x44 * 0.3
		XCTAssertEqual(blendColor.rgbComponents.blue, Int(output))
		output = 0.5 * 0.7 + 0.7 * 0.3
		XCTAssertEqual(blendColor.alpha, CGFloat(output))
		
		blendColor = UIColor.blend(color1, intensity1: 0.0, with: color2, intensity2: 0.3)
		output = (0x12 * 0.0 + 0x66 * 0.3) / 0.3
		XCTAssertEqual(blendColor.rgbComponents.red, Int(output))
		output = (0x34 * 0.0 + 0x55 * 0.3) / 0.3
		XCTAssertEqual(blendColor.rgbComponents.green, Int(output))
		output = (0x56 * 0.0 + 0x44 * 0.3) / 0.3
		XCTAssertEqual(blendColor.rgbComponents.blue, Int(output))
		output = (0.5 * 0.0 + 0.7 * 0.3 / 0.3)
		XCTAssertEqual(blendColor.alpha, CGFloat(output))
		
		blendColor = UIColor.blend(color1, intensity1: 1.0, with: color2, intensity2: 0.0)
		XCTAssertEqual(blendColor, color1)
	}
	
	// MARK: - Test initializers
	func testInit() {
		var color = UIColor(hex: 0xFFF)
		XCTAssertEqual(color?.rgbComponents.red, 0)
		XCTAssertEqual(color?.rgbComponents.green, 0xf)
		XCTAssertEqual(color?.rgbComponents.blue, 0xff)
		XCTAssertEqual(color?.alpha, 1.0)
		
		color = UIColor(hex: 0xFFFFFFF)
		XCTAssertEqual(color?.rgbComponents.red, 0xff)
		XCTAssertEqual(color?.rgbComponents.green, 0xff)
		XCTAssertEqual(color?.rgbComponents.blue, 0xff)
		XCTAssertEqual(color?.alpha, 1.0)
		
		color = UIColor(hex: 0x123456, transparency: 1.0)
		XCTAssertEqual(color?.rgbComponents.red, 0x12)
		XCTAssertEqual(color?.rgbComponents.green, 0x34)
		XCTAssertEqual(color?.rgbComponents.blue, 0x56)
		XCTAssertEqual(color?.alpha, 1.0)
		
		color = UIColor(hex: 0x999, transparency: 21.0)
		XCTAssertEqual(color?.rgbComponents.red, 0)
		XCTAssertEqual(color?.rgbComponents.green, 0x09)
		XCTAssertEqual(color?.rgbComponents.blue, 0x99)
		XCTAssertEqual(color?.alpha, 1.0)
		
		color = UIColor(hex: 0xaabbcc, transparency: 0.0)
		XCTAssertEqual(color?.rgbComponents.red, 0xaa)
		XCTAssertEqual(color?.rgbComponents.green, 0xbb)
		XCTAssertEqual(color?.rgbComponents.blue, 0xcc)
		XCTAssertEqual(color?.alpha, 0.0)
		
		color = UIColor(hex: 0x1, transparency: 0.5)
		XCTAssertEqual(color?.rgbComponents.red, 0)
		XCTAssertEqual(color?.rgbComponents.green, 0)
		XCTAssertEqual(color?.rgbComponents.blue, 1)
		XCTAssertEqual(color?.alpha, 0.5)
		
		let color1 = UIColor(hex: 0xFFF, transparency: -0.4)
		let color2 = UIColor(hex: 0xFFF, transparency: 0)
		XCTAssertEqual(color1, color2)
		
		let color3 = UIColor(hex: 0xFFF, transparency: 1.5)
		let color4 = UIColor(hex: 0xFFF, transparency: 1)
		XCTAssertEqual(color3, color4)

	}
	
	func testFailableInit() {
		var color = UIColor(hexString: "0xFFFFFF")
		XCTAssertNotNil(color)
		
		color = UIColor(hexString: "#FFFFFF")
		XCTAssertNotNil(color)
		
		color = UIColor(hexString: "FFFFFF")
		XCTAssertNotNil(color)
		
		color = UIColor(hexString: "#ABC")
		XCTAssertNotNil(color)
		
		color = UIColor(hexString: "#GGG")
		XCTAssertNil(color)
		
		color = UIColor(hexString: "4#fff")
		XCTAssertNil(color)
		
		color = UIColor(hexString: "FFFFFFF")
		XCTAssertNotNil(color)
	}
	
	func testInitWithComponents() {
		var r1: CGFloat = 0
		var r2: CGFloat = 0
		var g1: CGFloat = 0
		var g2: CGFloat = 0
		var b1: CGFloat = 0
		var b2: CGFloat = 0
		var alpha1: CGFloat = 0
		var alpha2: CGFloat = 0
		
		var color1 = UIColor(red: 255, green: 244, blue: 255, transparency: 2.0)
		var color2 = UIColor(red: 1.0, green: 244.0 / 255.0, blue: 1.0, alpha: 2.0)
		color1?.getRed(&r1, green: &g1, blue: &b1, alpha: &alpha1)
		color2.getRed(&r2, green: &g2, blue: &b2, alpha: &alpha2)
		XCTAssertEqual(r1, r2)
		XCTAssertEqual(g1, g2)
		XCTAssertEqual(b1, b2)
		XCTAssertEqual(alpha1, alpha2)
		
		color1 = UIColor(red: 25, green: 244, blue: 55, transparency: -1.0)
		color2 = UIColor(red: 25.0 / 255.0, green: 244.0 / 255.0, blue: 55.0 / 255.0, alpha: -1.0)
		color1?.getRed(&r1, green: &g1, blue: &b1, alpha: &alpha1)
		color2.getRed(&r2, green: &g2, blue: &b2, alpha: &alpha2)
		XCTAssertEqual(r1, r2)
		XCTAssertEqual(g1, g2)
		XCTAssertEqual(b1, b2)
		XCTAssertEqual(alpha1, alpha2)
		
		color1 = UIColor(red: 2, green: 4, blue: 5)
		color2 = UIColor(red: 2.0 / 255.0, green: 4.0 / 255.0, blue: 5.0 / 255.0, alpha: 1.0)
		color1?.getRed(&r1, green: &g1, blue: &b1, alpha: &alpha1)
		color2.getRed(&r2, green: &g2, blue: &b2, alpha: &alpha2)
		XCTAssertEqual(r1, r2)
		XCTAssertEqual(g1, g2)
		XCTAssertEqual(b1, b2)
		XCTAssertEqual(alpha1, alpha2)
	}
	
	func testFailableInitWithComponents() {
		let color1 = UIColor(red: 258, green: 0, blue: 0)
		XCTAssertNil(color1)
		
		let color2 = UIColor(red: 0, green: 258, blue: 0)
		XCTAssertNil(color2)
		
		let color3 = UIColor(red: 0, green: 0, blue: 258)
		XCTAssertNil(color3)
		
		let color4 = UIColor(red: 258, green: 258, blue: 258)
		XCTAssertNil(color4)

	}
	
	func testFailableInitWithComplementaryColor() {
		var color = UIColor(complementaryFor: UIColor.black)
		var r: CGFloat = 0
		var g: CGFloat = 0
		var b: CGFloat = 0
		
		color?.getRed(&r, green: &g, blue: &b, alpha: nil)
		XCTAssertEqual(r, 1)
		XCTAssertEqual(g, 1)
		XCTAssertEqual(b, 1)
		
		color = UIColor(complementaryFor: UIColor.red)
		color?.getRed(&r, green: &g, blue: &b, alpha: nil)
		XCTAssertEqual(r, 0)
		XCTAssertEqual(g, 1)
		XCTAssertEqual(b, 1)
	}
}

#endif
