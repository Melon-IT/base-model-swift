//
//  NetworkMonitor.swift
//  MelonBaseModel
//
//  Created by Tomasz Popis on 20/12/2020.
//  Copyright © 2020 Melon-IT. All rights reserved.
//

import Foundation

open class MNetworkMonitor {
  var hostReachability: Reachability?
  var internetReachability: Reachability?
  let remoteHostName = ""
  
  open var hasInternet: Bool {

    return self.internetReachability?.currentReachabilityStatus() != NotReachable
  }
  
  public static let defaultMonitor: MNetworkMonitor = MNetworkMonitor()
  
  open func configure() {
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(reachabilityChanged),
                                           name: NSNotification.Name.reachabilityChanged,
                                           object: nil)
    
    self.hostReachability = Reachability(hostName: self.remoteHostName)
    self.internetReachability = Reachability.forInternetConnection()
  }
  
  open func start() {
    self.hostReachability?.startNotifier()
    self.internetReachability?.startNotifier()
  }
  
  open func stop() {
    self.hostReachability?.stopNotifier()
    self.internetReachability?.stopNotifier()
  }
  
  @objc open func reachabilityChanged(note: Notification) {
    if let currentReach = note.object as? Reachability {
      self.networkStatusChanged(status: currentReach.currentReachabilityStatus())
    }
  }
  
  open func networkStatusChanged(status: NetworkStatus) {
    /*
    switch status {
    case NotReachable:
      self.handleFirstOfflineMode()
      break
    case ReachableViaWWAN:
      break
    case ReachableViaWiFi:
      break
    default:
      break
    }
 */
  }
  
  private func handleFirstOfflineMode() {
    if MNetworkMonitor.offlinePopupShown() {
      return
    }
    MNetworkMonitor.setOfflinePopupShown()
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let viewController = storyboard.instantiateViewController(withIdentifier: "OfflineModeInfoViewController")
    UIApplication.shared.windows.first!.rootViewController!.present(viewController, animated: true, completion: {
        // do nothing
    })
  }
  
  //MARK: - Sprawdzanie czy popup był wyświetlany
  private static let offlineModePopupShownKey = "offlineModePopupShownKey"
  
  public static func offlinePopupShown() -> Bool {
      return UserDefaults.standard.bool(forKey: offlineModePopupShownKey)
  }
  
  public static func setOfflinePopupShown() {
      UserDefaults.standard.set(true, forKey: offlineModePopupShownKey)
  }
}
