# Generate an Image and Edit It with a Mask

This example demonstrates how to generate an image based on a textual description and then edit the generated image using a mask. The example leverages the OpenAI Images API to automate image generation and editing, showcasing its flexibility and power.

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

## Image Conversion and Mask Creation [Optional]
RGBA converted image and a mask is provided along with the example code for demonstration. but for actual use, the following steps needed to be carried out

### Converting RGB Image to RGBA

The OpenAI Image generation endpoint returns an RGB image, while the Image edit endpoint requires an RGBA image. To convert the generated image to RGBA, you can use the following method on Linux/WSL:

1. Navigate to the `images` directory:

    ```bash
    cd images
    ```

2. Update your package manager and install ImageMagick:

    ```bash
    sudo apt update
    sudo apt install imagemagick
    ```

3. Convert the image:

    ```bash
    convert coding_developer.png -type TrueColor -define png:color-type=6 coding_developer_rgba.png
    ```

### Drawing a Mask on the Image

To create a mask for editing the image, you can use Figma:

1. **Create a New Project in Figma**
   - Open [Figma](https://www.figma.com) and create a new project.

2. **Create a New Frame**
   - Create a new frame of the image size (1024x1024).

3. **Add Image**
    - Add the RGBA Converted Image to the frame

4. **Draw the Mask**
   - Use the Pen tool to draw around the area that needs to be masked.

5. **Subtract the Mask**
   - Select both the drawn vector and the image, then choose the subtract option.

6. **Deselect Fill Mask**
   - Deselect the fill mask to ensure the area is transparent.

7. **Export the Mask**
   - Export the masked image as a PNG file, save it in the `images` folder of the Ballerina project, and rename it as `mask.png`.


