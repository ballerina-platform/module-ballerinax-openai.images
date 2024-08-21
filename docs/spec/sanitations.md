_Authors_: @G5andeepD \
_Created_: 2024/08/05 \
_Updated_: 2024/08/05 \
_Edition_: Swan Lake

# Sanitation for OpenAPI specification

This document records the sanitation done on top of the official OpenAPI specification from OpenAI. The OpenAPI specification is obtained from the [OpenAI OpenAPI Documentation](https://github.com/openai/openai-openapi/blob/master/openapi.yaml). These changes are implemented to enhance the overall usability and readability of the generated client.

1. **Removed the `default:null` property from the below schemas**:

   - **Changed Schemas**: `CreateCompletionRequest`,`ChatCompletionStreamOptions`,`CreateChatCompletionRequest`

   - **Original**:
      - default: `null`

   - **Updated**:
      - Removed the `default` parameter 

   - **Reason**: This change is done as a temporary workaround until the Ballerina OpenAPI tool supports OpenAPI Specification version v3.1.x(Currently supported upto version 3.0.0)

2. **Removed the `nullable: true` property of the field `n` from the below schemas**

    - **Changed Schemas**: `CreateImageRequest`,`CreateImageEditRequest`

    - **Original**
        - `n:`
         &nbsp;&nbsp;`nullable: true`
    - **Updated**:
        - Removed the `nullable` parameter
    - **Reason**: This change was made because the server does not accept `null` for `n`. Additionally, the integer min-max constraints were not applied because the variable was generated as a union type.    

## OpenAPI cli command

The following command was used to generate the Ballerina client from the OpenAPI specification. The command should be executed from the repository root directory.

```bash
bal openapi -i docs/spec/openapi.yaml --mode client --tags Images --license docs/license.txt -o ballerina
```
Note: The license year is hardcoded to 2024, change if necessary.
