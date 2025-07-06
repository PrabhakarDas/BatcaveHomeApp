//
//  MQTTService.swift
//  Batcore
//
//  Created by Prabhakar Das on 06/07/25.
//

import Foundation
import CocoaMQTT

class MQTTService: NSObject, CocoaMQTTDelegate {
    static let shared = MQTTService()
    private var mqtt: CocoaMQTT?
    
    func connect(host: String = "broker.hivemq.com", port: UInt16 = 1883) {
        let clientID = "BatcaveHomeApp-\(UUID().uuidString)"
        mqtt = CocoaMQTT(clientID: clientID, host: host, port: port)
        mqtt?.delegate = self
        mqtt?.connect()
    }
    
    func publish(topic: String, message: String) {
        mqtt?.publish(topic, withString: message, qos: .qos1)
        Logger.log("Published to \(topic): \(message)")
    }
    
    func subscribe(to topic: String) {
        mqtt?.subscribe(topic, qos: .qos1)
        Logger.log("Subscribed to \(topic)")
    }
    
    // MARK: CocoaMQTTDelegate
    func mqtt(_ mqtt: CocoaMQTT, didConnectAck ack: CocoaMQTTConnAck) { }
    func mqtt(_ mqtt: CocoaMQTT, didPublishMessage message: CocoaMQTTMessage, id: UInt16) { }
    func mqtt(_ mqtt: CocoaMQTT, didPublishAck id: UInt16) { }
    func mqtt(_ mqtt: CocoaMQTT, didReceiveMessage message: CocoaMQTTMessage, id: UInt16) {
        guard let text = message.string else { return }
        Logger.log("Received on \(message.topic): \(text)")
        // TODO: Dispatch to view models
    }
    func mqtt(_ mqtt: CocoaMQTT, didSubscribeTopic topic: String) { }
    func mqtt(_ mqtt: CocoaMQTT, didUnsubscribeTopic topic: String) { }
    func mqttDidDisconnect(_ mqtt: CocoaMQTT, withError err: Error?) { }
    func mqtt(_ mqtt: CocoaMQTT, didStateChangeTo state: CocoaMQTTConnState) { }
    func mqtt(_ mqtt: CocoaMQTT, didReceive trust: SecTrust, completionHandler: @escaping (Bool) -> Void) { completionHandler(true) }
    func mqtt(_ mqtt: CocoaMQTT, didPublishComplete id: UInt16) { }
}
