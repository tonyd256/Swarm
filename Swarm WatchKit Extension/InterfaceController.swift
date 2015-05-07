import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {
  @IBOutlet weak var label: WKInterfaceLabel!

  var timer: NSTimer = NSTimer()
  
  override func willActivate() {
    super.willActivate()
    timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("tick"), userInfo: .None, repeats: true)
  }

  override func didDeactivate() {
    super.didDeactivate()
    timer.invalidate()
  }

  func tick() {
    WKInterfaceController.openParentApplication([:]) { dict, error in
      self.label.setText(dict["SwarmItemCount"] as? String)
    }
  }
}
