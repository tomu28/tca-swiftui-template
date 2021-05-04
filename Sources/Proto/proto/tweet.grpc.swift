//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: proto/tweet.proto
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


/// Usage: instantiate `Tweet_TweetServiceClient`, then call methods of this protocol to make API calls.
public protocol Tweet_TweetServiceClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Tweet_TweetServiceClientInterceptorFactoryProtocol? { get }

  func getTweet(
    _ request: Tweet_GetTweetRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Tweet_GetTweetRequest, Tweet_GetTweetResponse>

  func postTweet(
    _ request: Tweet_PostTweetRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Tweet_PostTweetRequest, Tweet_PostTweetResponse>

  func deleteTweet(
    _ request: Tweet_DeleteTweetRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Tweet_DeleteTweetRequest, Tweet_DeleteTweetResponse>

  func favoriteTweet(
    _ request: Tweet_FavoriteTweetRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Tweet_FavoriteTweetRequest, Tweet_FavoriteTweetResponse>

  func unFavoriteTweet(
    _ request: Tweet_UnFavoriteTweetRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Tweet_UnFavoriteTweetRequest, Tweet_UnFavoriteTweetResponse>
}

extension Tweet_TweetServiceClientProtocol {
  public var serviceName: String {
    return "tweet.TweetService"
  }

  /// 特定tweetを取得
  ///
  /// - Parameters:
  ///   - request: Request to send to GetTweet.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func getTweet(
    _ request: Tweet_GetTweetRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Tweet_GetTweetRequest, Tweet_GetTweetResponse> {
    return self.makeUnaryCall(
      path: "/tweet.TweetService/GetTweet",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetTweetInterceptors() ?? []
    )
  }

  /// tweetの投稿
  ///
  /// - Parameters:
  ///   - request: Request to send to PostTweet.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func postTweet(
    _ request: Tweet_PostTweetRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Tweet_PostTweetRequest, Tweet_PostTweetResponse> {
    return self.makeUnaryCall(
      path: "/tweet.TweetService/PostTweet",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makePostTweetInterceptors() ?? []
    )
  }

  /// tweetの削除
  ///
  /// - Parameters:
  ///   - request: Request to send to DeleteTweet.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func deleteTweet(
    _ request: Tweet_DeleteTweetRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Tweet_DeleteTweetRequest, Tweet_DeleteTweetResponse> {
    return self.makeUnaryCall(
      path: "/tweet.TweetService/DeleteTweet",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDeleteTweetInterceptors() ?? []
    )
  }

  /// tweetのファボ
  ///
  /// - Parameters:
  ///   - request: Request to send to FavoriteTweet.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func favoriteTweet(
    _ request: Tweet_FavoriteTweetRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Tweet_FavoriteTweetRequest, Tweet_FavoriteTweetResponse> {
    return self.makeUnaryCall(
      path: "/tweet.TweetService/FavoriteTweet",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeFavoriteTweetInterceptors() ?? []
    )
  }

  /// tweetのファボ
  ///
  /// - Parameters:
  ///   - request: Request to send to UnFavoriteTweet.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func unFavoriteTweet(
    _ request: Tweet_UnFavoriteTweetRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Tweet_UnFavoriteTweetRequest, Tweet_UnFavoriteTweetResponse> {
    return self.makeUnaryCall(
      path: "/tweet.TweetService/UnFavoriteTweet",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUnFavoriteTweetInterceptors() ?? []
    )
  }
}

public protocol Tweet_TweetServiceClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'getTweet'.
  func makeGetTweetInterceptors() -> [ClientInterceptor<Tweet_GetTweetRequest, Tweet_GetTweetResponse>]

  /// - Returns: Interceptors to use when invoking 'postTweet'.
  func makePostTweetInterceptors() -> [ClientInterceptor<Tweet_PostTweetRequest, Tweet_PostTweetResponse>]

  /// - Returns: Interceptors to use when invoking 'deleteTweet'.
  func makeDeleteTweetInterceptors() -> [ClientInterceptor<Tweet_DeleteTweetRequest, Tweet_DeleteTweetResponse>]

  /// - Returns: Interceptors to use when invoking 'favoriteTweet'.
  func makeFavoriteTweetInterceptors() -> [ClientInterceptor<Tweet_FavoriteTweetRequest, Tweet_FavoriteTweetResponse>]

  /// - Returns: Interceptors to use when invoking 'unFavoriteTweet'.
  func makeUnFavoriteTweetInterceptors() -> [ClientInterceptor<Tweet_UnFavoriteTweetRequest, Tweet_UnFavoriteTweetResponse>]
}

public final class Tweet_TweetServiceClient: Tweet_TweetServiceClientProtocol {
  public let channel: GRPCChannel
  public var defaultCallOptions: CallOptions
  public var interceptors: Tweet_TweetServiceClientInterceptorFactoryProtocol?

  /// Creates a client for the tweet.TweetService service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  public init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Tweet_TweetServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

