import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var label: UILabel!

  var items: UIntMax = 0 {
    didSet {
      dispatch_async(dispatch_get_main_queue()) {
        self.label.text = "\(self.items)"
        NSUserDefaults.standardUserDefaults().setValue("\(self.items)", forKey: "SwarmItemCount")
      }
    }
  }
  var timer = NSTimer()

  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("tick"), userInfo: .None, repeats: true)
  }

  func tick() {
    items++
  }
}
