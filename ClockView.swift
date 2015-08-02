import UIKit

public class ClockView:UIView{
    private let twoPi=3.142857*2
    
   public var hour:Double=1{
        didSet{
            self.setNeedsDisplay()
        }
    }
    
    public var minute:Double=10{
        didSet{
            self.setNeedsDisplay()
        }
    }
    
    
    @IBInspectable
    public var hourHandPercentLength:Int=55{
        didSet{
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable
    public var minuteHandPerCentLength:Int=80{
        didSet{
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable
    public var lineWidthHand:CGFloat=3{
        didSet{
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable
    public var lineWidthCircle:CGFloat=3{
        didSet{
            self.setNeedsDisplay()
        }
    }
    
    
    public override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        let circle=UIBezierPath(ovalInRect: rect)
        UIColor.orangeColor().setStroke()
        circle.lineWidth=lineWidthCircle
        UIColor.blackColor().setFill()
        
        circle.fill()
        circle.stroke()
        
        let path=UIBezierPath()
        UIColor.orangeColor().setStroke()
        path.lineWidth=lineWidthHand
        
        
        let width=frame.width
        let height=frame.height
        
        let angleHourHand=hour/12.0*twoPi
        let yHourHand=CGFloat(cos(angleHourHand)*Double(-width)/2.0*Double(hourHandPercentLength)/100.0+Double(width)/2.0)
        let xHourHAnd=CGFloat(sin(angleHourHand)*Double(height)/2.0*Double(hourHandPercentLength)/100.0+Double(height)/2.0)
        path.moveToPoint(CGPointMake(width/2,height/2))
        path.addLineToPoint(CGPointMake(xHourHAnd, yHourHand))
        UIColor.orangeColor().setStroke()
        
        
        
        let angleMinuteHand=minute/60.0*twoPi
        let yMinuteHand=CGFloat(cos(angleMinuteHand)*Double(-width)/2.0*Double(minuteHandPerCentLength)/100.0+Double(width)/2.0)
        let xMinuteHand=CGFloat(sin(angleMinuteHand)*Double(height)/2.0*Double(minuteHandPerCentLength)/100.0+Double(height)/2.0)
        path.moveToPoint(CGPointMake(width/2,height/2))
        path.moveToPoint(CGPointMake(width/2,height/2))
        path.addLineToPoint(CGPointMake(xMinuteHand, yHourHand))
        UIColor.orangeColor().setStroke()
        
        
        path.fill()
        path.stroke()
        
        
    }
}











