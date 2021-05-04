//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: proto/user.proto
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


/// Usage: instantiate `User_UserServiceClient`, then call methods of this protocol to make API calls.
public protocol User_UserServiceClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: User_UserServiceClientInterceptorFactoryProtocol? { get }

  func signUp(
    _ request: User_SignUpRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<User_SignUpRequest, User_SignUpResponse>

  func updateUser(
    _ request: User_UpdateUserRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<User_UpdateUserRequest, User_UpdateUserResponse>
}

extension User_UserServiceClientProtocol {
  public var serviceName: String {
    return "user.UserService"
  }

  /// サインアップ
  ///
  /// - Parameters:
  ///   - request: Request to send to SignUp.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func signUp(
    _ request: User_SignUpRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<User_SignUpRequest, User_SignUpResponse> {
    return self.makeUnaryCall(
      path: "/user.UserService/SignUp",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeSignUpInterceptors() ?? []
    )
  }

  /// ユーザー編集
  ///
  /// - Parameters:
  ///   - request: Request to send to UpdateUser.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func updateUser(
    _ request: User_UpdateUserRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<User_UpdateUserRequest, User_UpdateUserResponse> {
    return self.makeUnaryCall(
      path: "/user.UserService/UpdateUser",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateUserInterceptors() ?? []
    )
  }
}

public protocol User_UserServiceClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'signUp'.
  func makeSignUpInterceptors() -> [ClientInterceptor<User_SignUpRequest, User_SignUpResponse>]

  /// - Returns: Interceptors to use when invoking 'updateUser'.
  func makeUpdateUserInterceptors() -> [ClientInterceptor<User_UpdateUserRequest, User_UpdateUserResponse>]
}

public final class User_UserServiceClient: User_UserServiceClientProtocol {
  public let channel: GRPCChannel
  public var defaultCallOptions: CallOptions
  public var interceptors: User_UserServiceClientInterceptorFactoryProtocol?

  /// Creates a client for the user.UserService service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  public init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: User_UserServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}
