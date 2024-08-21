# Examples

The `ballerinax/openai.images` connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-openai.images/tree/main/examples), covering use cases like cache management, session management, and rate limiting.

1. [Personalized visual content generator](https://github.com/ballerina-platform/module-ballerinax-openai.images/tree/main/examples/personalized-visual-content-generator) - Create personalized visual content for targeted email marketing by generating and editing images to include specific products.
2. [Rapid product visualizer](https://github.com/ballerina-platform/module-ballerinax-openai.images/tree/main/examples/rapid-product-visualizer) - Generate and vary product images for client presentations to showcase different design options and aid decision-making.

## Prerequisites

### 1. Setup OpenAI Account
To get started, you'll need to have an OpenAI account and obtain an API key. Refer to the [Setup guide](https://central.ballerina.io/ballerinax/openai.images/latest#setup-guide) for more details on how to set up your account and obtain the API key.

### 2. Configuration
Create a `Config.toml` file in the example's root directory and provide your OpenAI account-related configurations as follows:

```toml
token = "<Your OpenAI API Key>"
```

## Running an example

Execute the following commands to build an example from the source:

* To build an example:

    ```bash
    bal build
    ```

* To run an example:

    ```bash
    bal run
    ```