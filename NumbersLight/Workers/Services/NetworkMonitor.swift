//
//  NetowrkServices.swift
//  NumbersLight
//
//  Created by Tarek HACHANI on 23/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import Foundation
import Network

class NetworkMonitor {
    static public let shared = NetworkMonitor()
    private var monitor: NWPathMonitor
    private var queue = DispatchQueue.global()
    var netOn: Bool = true

    private init() {
        self.monitor = NWPathMonitor()
        self.queue = DispatchQueue.global(qos: .background)
        self.monitor.start(queue: queue)
    }

    func startMonitoring() {
        self.monitor.pathUpdateHandler = { path in
            self.netOn = path.status == .satisfied
        }
    }

    func stopMonitoring() {
        self.monitor.cancel()
    }

    func isConnected() -> Bool{
        return netOn
    }

}
