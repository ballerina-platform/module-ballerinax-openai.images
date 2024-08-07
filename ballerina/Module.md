## Overview

[OpenAI](https://openai.com/), an AI research organization focused on creating friendly AI for humanity, offers the [OpenAI API](https://platform.openai.com/docs/api-reference/introduction) to access its powerful AI models for tasks like natural language processing and image generation.

The `ballarinax/openai.images` package offers APIs to connect and interact with [Image related endpoints of OpenAI API](https://platform.openai.com/docs/api-reference/images/create) providing access to the new DALL.E models developed by OpenAI for various image-related tasks.

## Setup guide

To use the OpenAI Connector, you must have access to the OpenAI API through a [OpenAI Platform account](https://platform.openai.com) and a project under it. If you do not have a OpenAI Platform account, you can sign up for one [here](https://platform.openai.com/signup).

#### Create a OpenAI API Key

1. Open the [OpenAI Platform Dashboard](https://platform.openai.com).


2. Navigate to Dashboard -> API keys
<img src=https://raw.githubusercontent.com/G5andeepD/module-ballerinax-openai-images/docs/docs/setup/resources/api-key-dashboard.png alt="OpenAI Platform" style="width: 70%;">

3. Click on the "Create new secret key" button
<img src=https://raw.githubusercontent.com/G5andeepD/module-ballerinax-openai-images/docs/docs/setup/resources/create-new-secrete-key.png alt="OpenAI Platform" style="width: 70%;">

4. Fill the details and click on Create secret key
<img src=https://raw.githubusercontent.com/G5andeepD/module-ballerinax-openai-images/docs/docs/setup/resources/saved-key.png alt="OpenAI Platform" style="width: 70%;">

5. Store the API key securely to use in your application 



## Quickstart

To use the `OpenAI Images` connector in your Ballerina application, update the `.bal` file as follows:

### Step 1: Import the module

Import the `openai.images` module.

```ballerina
import ballerinax/openai.images;
```

### Step 2: Instantiate a new connector

1. Create a `Config.toml` file and, configure the obtained credentials in the above steps as follows:

```bash
apiKey = "<API Key>"
```

2. Create a `images:ConnectionConfig` with the obtained API Key and initialize the connector with it.

```ballerina
configurable string apiKey = ?;

final images:Client openai = check new({
    auth: {
        apiKey
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

    // Call the `post images/generations` resource to generate an image

    var response = openai->/images/generations.post(request);

    if (response is ImagesResponse) {
        io:println("Created images: ", response.data);
    } else {
        io:println("Error: ", response);
    }

    return;
}
```

### Step 4: Run the Ballerina application

```bash
bal run
```

## Examples

The `OpenAI Images` connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/module-ballerinax-openai-images/tree/main/examples/), covering the following use cases:

[//]: # (TODO: Add examples)
