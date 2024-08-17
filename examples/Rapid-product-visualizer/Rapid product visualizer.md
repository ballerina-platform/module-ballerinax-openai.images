# Rapid product visualizer

This example demonstrates rapid product visualization for client presentations by generating a base image of a smartphone and producing variations to illustrate different design options. This approach enables designers and marketing teams to present a range of concepts to clients, helping them visualize the final product and make informed decisions.

## Prerequisites

### 1. Setup OpenAI Account
To get started, you'll need to have an OpenAI account and obtain an API key. Refer to the [Setup guide](https://central.ballerina.io/ballerinax/openai.images/latest#prerequisites) for more details on how to set up your account and obtain the API key.

### 2. Configuration
Create a `Config.toml` file in the example's root directory and provide your OpenAI account-related configurations as follows:

```toml
apiKey = "<Your OpenAI API Key>"
```

## Run the example

Execute the following command to run the example:

```bash
bal run
```

## Description

### Generating the Product Image
The example begins by generating a product image based on a descriptive prompt. The prompt used in this example describes a sleek and modern smartphone.

### Creating Variations
After generating the base product image, the example automatically creates three variations of the image using the OpenAI Images API. These variations are saved as separate files in the `images` directory.

### Output Files
The following images will be generated and saved:

- `product_image.png`: The original generated product image.
- `product_image_variation_1.png`: The first variation of the product image.
- `product_image_variation_2.png`: The second variation of the product image.
- `product_image_variation_3.png`: The third variation of the product image.

