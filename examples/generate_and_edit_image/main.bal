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

import ballerina/io;
import ballerina/mime;
import ballerinax/openai.images;

configurable string apiKey = ?;

// Initialize the OpenAI Images client with your API key
final images:Client openaiClient = check new ({
    auth: {
        token: apiKey
    }
});

public function main() returns error? {

    // Generate a base image using the `images/generation` API
    string generationPrompt = "a developer coding in vscode";

    images:CreateImageRequest generationRequest = {
        prompt: generationPrompt,
        model: "dall-e-3",
        n: 1,
        response_format: "b64_json",
        size: "1024x1024"
    };

    images:ImagesResponse generationResponse = check openaiClient->/images/generations.post(generationRequest);

    // Save the generated image in base64 format
    string? b64GenImage = generationResponse.data[0].b64_json;

    if (b64GenImage is string) {
        // Decode the base64 string to get image bytes
        string|byte[]|io:ReadableByteChannel|mime:DecodeError genImageBytes = mime:base64Decode(b64GenImage.toBytes());
        if (genImageBytes is byte[]) {
            // Save the base image to a file
            error? saveGenImageResult = io:fileWriteBytes("images/coding_developer.png", genImageBytes);

            if (saveGenImageResult is error) {
                io:println("Error writing the base image to a file: ", saveGenImageResult);
            } else {
                io:println("Generated image saved successfully!");
            }

            // Convert the image to RGBA format and create a mask (Instructions in the Generate and edit image.md)
            // Read the converted image and mask as byte[]s.

            byte[] rgbaGenImageBytes = check io:fileReadBytes("images/coding_developer_rgba.png");
            byte[] mask = check io:fileReadBytes("images/mask.png");

            // Edit the generated image using the `images/edit` API
            images:CreateImageEditRequest editRequest = {
                image: {
                    fileContent: rgbaGenImageBytes,
                    fileName: "coding_developer_rgba.png"
                },
                mask: {
                    fileContent: mask,
                    fileName: "mask.png"
                },
                prompt: "Remove the coffee mug and add a fizzing drink bottle",
                n: 1,
                size: "1024x1024",
                response_format: "b64_json"
            };

            images:ImagesResponse editResponse = check openaiClient->/images/edits.post(editRequest);

            // Save the edited image in base64 format
            string? b64EditImage = editResponse.data[0].b64_json;

            if (b64EditImage is string) {
                // Decode the base64 string to get edited image bytes
                string|byte[]|io:ReadableByteChannel|mime:DecodeError editedImageBytes = mime:base64Decode(b64EditImage.toBytes());
                if (editedImageBytes is byte[]) {
                    // Save the edited image to a file
                    error? saveEditedImageResult = io:fileWriteBytes("images/edited_coding_developer.png", editedImageBytes);

                    if (saveEditedImageResult is error) {
                        io:println("Error writing the edited image to a file: ", saveEditedImageResult);
                    } else {
                        io:println("Edited image saved successfully!");
                    }
                }
            }
        }
    }
}
