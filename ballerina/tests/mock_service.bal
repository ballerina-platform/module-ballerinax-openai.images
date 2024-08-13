// Copyright (c) 2024, WSO2 LLC. (http://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;
import ballerina/log;

listener http:Listener httpListener = new (9090);

http:Service mockService = service object {

    # Creates an edited or extended image given an original image and a prompt.
    #
    # + return - ImageResponse 
    resource function post images/edits(http:Request request) returns ImagesResponse {
        ImagesResponse response = {
            created: 1625460000,
            data: [
                {
                    url: "https://example.com/edited_image.png",
                    revised_prompt: "A sunny beach with palm trees"
                }
            ]
        };
        return response;
    }

    # Creates an image given a prompt.
    #
    # + return - ImageResponse 
    resource function post images/generations(@http:Payload CreateImageRequest payload) returns ImagesResponse {
        ImagesResponse response = {
            created: 1625460000,
            data: [
                {
                    url: "https://example.com/generated_image.png"
                }
            ]
        };
        return response;
    }

    # Creates a variation of a given image.
    #
    # + return - ImageResponse 
    resource function post images/variations(http:Request request) returns ImagesResponse {
        ImagesResponse response = {
            created: 1625460000,
            data: [
                {
                    url: "https://example.com/variation_image.png"
                }
            ]
        };
        return response;
    }
};

function init() returns error? {
    if isLiveServer {
        log:printInfo("Skiping mock server initialization as the tests are running on live server");
        return;
    }
    log:printInfo("Initiating mock server");
    check httpListener.attach(mockService, "/");
    check httpListener.'start();
}
