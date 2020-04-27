//
//  APIClient.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 4/26/20.
//  Copyright © 2020 Samuel Yanez. All rights reserved.
//

import Foundation

protocol APIClient {
    var session: URLSession { get }
    
    func fetch<T: Decodable>(with request: URLRequest, parse: @escaping (Data) -> T?, queue: DispatchQueue, completion: ((Result<T, APIError>) -> Void)?)
    
    func fetch<T: Decodable>(with request: URLRequest, parse: @escaping (Data) -> [T]?, queue: DispatchQueue, completion: ((Result<[T], APIError>) -> Void)?)
}

extension APIClient {
    func task(with request: URLRequest, completionHandler completion: @escaping (Swift.Result<Data, APIError>) -> Void) -> URLSessionDataTask {
        return session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                completion(.failure(.requestFailed))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.requestFailed))
                return
            }
            guard httpResponse.statusCode == 200 else {
                completion(.failure(.responseUnsuccessful))
                return
            }
            guard let data = data else {
               completion(.failure(.invalidData))
                return
            }
            completion(.success(data))
        }
    }
    
    func fetch<T: Decodable>(with request: URLRequest, parse: @escaping (Data) -> T?, queue: DispatchQueue = .main, completion: ((Result<T, APIError>) -> Void)?) {
        task(with: request) { result in
            queue.async() {
                switch result {
                case .failure(let error):
                    completion?(.failure(error))
                case .success(let data):
                    guard let value = parse(data) else {
                        completion?(.failure(.jsonParsingError))
                        return
                    }
                    completion?(.success(value))
                }
            }
        }.resume()
    }
    
    func fetch<T: Decodable>(with request: URLRequest, parse: @escaping (Data) -> [T]?, queue: DispatchQueue = .main, completion: ((Result<[T], APIError>) -> Void)?) {
        task(with: request) { result in
            queue.async() {
                switch result {
                case .failure(let error):
                    completion?(.failure(error))
                case .success(let data):
                    guard let values = parse(data) else {
                        completion?(.failure(.jsonParsingError))
                        return
                    }
                    completion?(.success(values))
                }
            }
        }.resume()
    }
}
