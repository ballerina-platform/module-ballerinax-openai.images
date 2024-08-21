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

configurable string token = ?;

public function main() returns error? {

    // Initialize the OpenAI Images client with your API key
    final images:Client openaiClient = check new ({
        auth: {
            token
        }
    });

    io:println("Generating a product image using the OpenAI API...");
    // Generate a base product image using the `images/generation` API
    string generationPrompt = "a sleek and modern smartphone with a curved screen and minimalist design";

    images:CreateImageRequest generationRequest = {
        prompt: generationPrompt,
        model: "dall-e-3",
        n: 1,
        response_format: "b64_json",
        size: "1024x1024"
    };

    images:ImagesResponse generationResponse = check openaiClient->/images/generations.post(generationRequest);

    io:println("Product image generated successfully.");

    // Save the generated product image in base64 format
    string? b64GenImage = generationResponse.data[0].b64_json;

    if b64GenImage is string {
        io:println("Saving the generated product image...");
        // Decode the base64 string to get image bytes
        string|byte[]|io:ReadableByteChannel|mime:DecodeError genImageBytes = mime:base64Decode(b64GenImage.toBytes());
        if genImageBytes is byte[] {
            // Save the base image to a file
            error? saveGenImageResult = io:fileWriteBytes("images/product_image.png", genImageBytes);

            if saveGenImageResult is error {
                io:println("Error writing the base image to a file: ", saveGenImageResult);
                return;
            } else {
                io:println("Generated product image saved successfully as 'images/product_image.png'.");
            }

            io:println("Creating 3 variations of the generated product image...");

            // Create 3 variations of the generated product image using the `images/variations` API
            images:CreateImageVariationRequest variationRequest = {
                image: {
                    fileContent: genImageBytes,
                    fileName: "product_image.png"
                },
                n: 3,
                size: "1024x1024",
                response_format: "b64_json"
            };

            images:ImagesResponse variationResponse = check openaiClient->/images/variations.post(variationRequest);

            io:println("Variations generated successfully.");

            // Save each variation to a file
            foreach var i in 0 ..< variationResponse.data.length() {
                string? b64VariationImage = variationResponse.data[i].b64_json;

                if b64VariationImage is string {
                    io:println("Saving variation ", i + 1, "...");
                    // Decode the base64 string to get variation image bytes
                    string|byte[]|io:ReadableByteChannel|mime:DecodeError variationImageBytes = mime:base64Decode(b64VariationImage.toBytes());
                    if variationImageBytes is byte[] {
                        // Save the variation image to a file
                        string variationFileName = string `images/product_image_variation_${i + 1}.png`;
                        error? saveVariationImageResult = io:fileWriteBytes(variationFileName, variationImageBytes);

                        if saveVariationImageResult is error {
                            io:println("Error writing variation ", i + 1, " to a file: ", saveVariationImageResult);
                        } else {
                            io:println(string `Variation ${i + 1} saved successfully as '${variationFileName}'.`);
                        }
                    }
                }
            }
        }
    }
}
