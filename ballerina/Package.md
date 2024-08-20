## Overview

[OpenAI](https://openai.com/), an AI research organization focused on creating friendly AI for humanity, offers the [OpenAI API](https://platform.openai.com/docs/api-reference/introduction) to access its powerful AI models for tasks like natural language processing and image generation.

The `ballarinax/openai.images` package offers APIs to connect and interact with [OpenAI REST API v1](https://platform.openai.com/docs/api-reference/images/create) providing access to the new DALL.E models developed by OpenAI for various image-related tasks.

## Setup guide

To use the OpenAI Connector, you must have access to the OpenAI API through a [OpenAI Platform account](https://platform.openai.com) and a project under it. If you do not have a OpenAI Platform account, you can sign up for one [here](https://platform.openai.com/signup).

1. Open the [OpenAI Platform Dashboard](https://platform.openai.com).

2. Navigate to Dashboard -> API keys
<img src=https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-openai.images/main/docs/setup/resources/navigate-api-key-dashboard.png alt="OpenAI Platform" style="width: 70%;">

3. Click on the "Create new secret key" button
<img src=https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-openai.images/main/docs/setup/resources/api-key-dashboard.png alt="OpenAI Platform" style="width: 70%;">

4. Fill the details and click on Create secret key
<img src=https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-openai.images/main/docs/setup/resources/create-new-secret-key.png alt="OpenAI Platform" style="width: 70%;">

5. Store the API key securely to use in your application 
<img src=https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-openai.images/main/docs/setup/resources/saved-key.png alt="OpenAI Platform" style="width: 70%;">

## Quickstart

To use the `OpenAI Images` connector in your Ballerina application, update the `.bal` file as follows:

### Step 1: Import the module

Import the `openai.images` module.

```ballerina
import ballerinax/openai.images;
```

### Step 2: Instantiate a new connector

Create a `images:ConnectionConfig` with the obtained API Key and initialize the connector.

```ballerina
configurable string apiKey = ?;

final images:Client openAIImages = check new ({
    auth: {
        token: apiKey
    }
});
```

### Step 3: Invoke the connector operation

Now, utilize the available connector operations.

#### Generate a image

```ballerina
public function main() returns error? {

    images:CreateImageRequest request = { 
        prompt: "A cute baby sea otter",        
        model: "dall-e-3",
        n: 1,
        size: "1024x1024",
        response_format: "url"        
    };

    images:ImagesResponse response = check openAIImages->/images/generations.post(request);

}
```

### Step 4: Run the Ballerina application

```bash
bal run
```

## Examples

The `OpenAI Images` connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-openai.images/tree/main/examples/), covering the following use cases:

1. [Personalized visual content generator](https://github.com/ballerina-platform/module-ballerinax-openai.images/tree/main/examples/personalized-visual-content-generator) - Create personalized visual content for targeted email marketing by generating and editing images to include specific products.

2. [Rapid product visualizer](https://github.com/ballerina-platform/module-ballerinax-openai.images/tree/main/examples/rapid-product-visualizer) - Generate and vary product images for client presentations to showcase different design options and aid decision-making.
