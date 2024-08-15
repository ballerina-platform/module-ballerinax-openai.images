# Examples

The `ballerinax/openai.images` connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-openai.images/tree/main/examples), covering use cases like cache management, session management, and rate limiting.

1. Generate an Image and Edit It with a Mask
2. Generate a Product Image and Create Variations

## Prerequisites

### 1. Setup OpenAI Account
To get started, you'll need to have an OpenAI account and obtain an API key. Refer to the [Setup guide](https://central.ballerina.io/ballerinax/openai.images/latest#prerequisites) for more details on how to set up your account and obtain the API key.

### 2. Configuration
Create a `Config.toml` file in the example's root directory and provide your OpenAI account-related configurations as follows:

```toml
apiKey = "<Your OpenAI API Key>"
```

## Running an Example

Execute the following commands to build an example from the source:

* To build an example:

    ```bash
    bal build
    ```

* To run an example:

    ```bash
    bal run
    ```

## Building the Examples with the Local Module

**Warning**: Due to the absence of support for reading local repositories for single Ballerina files, the Bala of the module is manually written to the central repository as a workaround. Consequently, the bash script may modify your local Ballerina repositories.

Execute the following commands to build all the examples against the changes you have made to the module locally:

* To build all the examples:

    ```bash
    ./build.sh build
    ```

* To run all the examples:

    ```bash
    ./build.sh run
    ```