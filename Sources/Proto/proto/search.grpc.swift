//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: proto/search.proto
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


/// Usage: instantiate `Search_SearchServiceClient`, then call methods of this protocol to make API calls.
public protocol Search_SearchServiceClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Search_SearchServiceClientInterceptorFactoryProtocol? { get }

  func getTweets(
    _ request: Search_GetTweetsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Search_GetTweetsRequest, Search_GetTweetsResponse>
}

extension Search_SearchServiceClientProtocol {
  public var serviceName: String {
    return "search.SearchService"
  }

  /// tweetの検索
  ///
  /// - Parameters:
  ///   - request: Request to send to GetTweets.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func getTweets(
    _ request: Search_GetTweetsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Search_GetTweetsRequest, Search_GetTweetsResponse> {
    return self.makeUnaryCall(
      path: "/search.SearchService/GetTweets",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetTweetsInterceptors() ?? []
    )
  }
}

public protocol Search_SearchServiceClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'getTweets'.
  func makeGetTweetsInterceptors() -> [ClientInterceptor<Search_GetTweetsRequest, Search_GetTweetsResponse>]
}

public final class Search_SearchServiceClient: Search_SearchServiceClientProtocol {
  public let channel: GRPCChannel
  public var defaultCallOptions: CallOptions
  public var interceptors: Search_SearchServiceClientInterceptorFactoryProtocol?

  /// Creates a client for the search.SearchService service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  public init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Search_SearchServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}
