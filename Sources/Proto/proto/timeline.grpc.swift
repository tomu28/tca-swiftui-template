//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: proto/timeline.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import GRPC
import NIO
import SwiftProtobuf


/// Usage: instantiate `Timeline_TimelineServiceClient`, then call methods of this protocol to make API calls.
public protocol Timeline_TimelineServiceClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Timeline_TimelineServiceClientInterceptorFactoryProtocol? { get }

  func getTweets(
    _ request: Timeline_GetTweetsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Timeline_GetTweetsRequest, Timeline_GetTweetsResponse>
}

extension Timeline_TimelineServiceClientProtocol {
  public var serviceName: String {
    return "timeline.TimelineService"
  }

  /// tweet一覧を取得
  ///
  /// - Parameters:
  ///   - request: Request to send to GetTweets.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func getTweets(
    _ request: Timeline_GetTweetsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Timeline_GetTweetsRequest, Timeline_GetTweetsResponse> {
    return self.makeUnaryCall(
      path: "/timeline.TimelineService/GetTweets",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetTweetsInterceptors() ?? []
    )
  }
}

public protocol Timeline_TimelineServiceClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'getTweets'.
  func makeGetTweetsInterceptors() -> [ClientInterceptor<Timeline_GetTweetsRequest, Timeline_GetTweetsResponse>]
}

public final class Timeline_TimelineServiceClient: Timeline_TimelineServiceClientProtocol {
  public let channel: GRPCChannel
  public var defaultCallOptions: CallOptions
  public var interceptors: Timeline_TimelineServiceClientInterceptorFactoryProtocol?

  /// Creates a client for the timeline.TimelineService service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  public init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Timeline_TimelineServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}
