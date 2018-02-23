//
//  Client+Promise.swift
//  BeyovaNetPromise
//
//  Created by canius.chu on 10/1/2018.
//  Copyright © 2018 Beyova. All rights reserved.
//

import Foundation
@_exported import PromiseKit
#if !BNCocoaPods
import BeyovaNet
#endif

extension Client {
    
    @discardableResult
    public func request(relativeURL: String,
                        method: HTTPMethod,
                        parameters: [String: Any],
                        tokenReqiured: Bool) -> Promise<Void> {
        return Promise { r in
            self.request(relativeURL: relativeURL, method: method, parameters: parameters, tokenReqiured: tokenReqiured) { (error) in
                if let err = error {
                    r.reject(err)
                }
                else {
                    r.fulfill(())
                }
            }
        }
    }

    @discardableResult
    public func request<T:Encodable>(relativeURL: String,
                                     method: HTTPMethod,
                                     parameters: [String: Any],
                                     object: T,
                                     tokenReqiured: Bool) -> Promise<Void> {
        return Promise { r in
            self.request(relativeURL: relativeURL, method: method, parameters: parameters, object: object, tokenReqiured: tokenReqiured) { (error) in
                if let err = error {
                    r.reject(err)
                }
                else {
                    r.fulfill(())
                }
            }
        }
    }

    @discardableResult
    public func request<S:Decodable>(relativeURL: String,
                                     method: HTTPMethod,
                                     parameters: [String: Any],
                                     tokenReqiured: Bool) -> Promise<S?> {
        return Promise { r in
            self.request(relativeURL: relativeURL, method: method, parameters: parameters, tokenReqiured: tokenReqiured) { (result: S?, error) in
                if let err = error {
                    r.reject(err)
                }
                else {
                    r.fulfill(result)
                }
            }
        }
    }

    @discardableResult
    public func request<T:Encodable,S:Decodable>(relativeURL: String,
                                                 method: HTTPMethod,
                                                 parameters: [String: Any],
                                                 object: T,
                                                 tokenReqiured: Bool) -> Promise<S?> {
        return Promise { r in
            self.request(relativeURL: relativeURL, method: method, parameters: parameters, object: object, tokenReqiured: tokenReqiured) { (result: S?, error) in
                if let err = error {
                    r.reject(err)
                }
                else {
                    r.fulfill(result)
                }
            }
        }
    }
}
