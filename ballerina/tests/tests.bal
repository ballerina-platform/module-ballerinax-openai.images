import ballerina/test;

configurable boolean isLiveServer = ?;
configurable string apiKey = ?;
configurable string RuntimeApiKey = isLiveServer ? apiKey : "test";
configurable string serviceUrl = isLiveServer ? "https://api.openai.com/v1" : "http://localhost:9090";

ConnectionConfig config = {auth: {
    token:RuntimeApiKey}
    };
final Client openaiClient = check new(config,serviceUrl);

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
isolated function testSendImageVariationRequest() returns error? {
    
    byte[] sampleImageContent = [137,80,78,71,13,10,26,10,0,0,0,13,73,72,68,82,0,0,0,68,0,0,0,68,8,6,0,0,0,56,19,147,178,0,0,0,9,112,72,89,115,0,0,11,18,0,0,11,18,1,210,221,126,252,0,0,11,51,73,68,65,84,120,156,213,90,91,108,28,87,25,254,118,147,152,166,118,246,76,162,168,185,180,222,164,105,20,138,226,73,2,145,160,104,7,197,125,0,129,199,69,17,72,72,222,60,52,21,149,218,93,9,41,162,72,236,182,15,132,151,238,62,80,41,164,146,39,84,208,4,169,94,35,170,74,72,120,146,190,197,133,89,1,21,82,19,143,121,160,164,52,236,170,106,128,38,153,89,39,56,148,212,135,135,157,51,62,115,230,186,183,24,62,107,229,115,102,206,229,63,223,252,231,191,156,153,20,165,20,221,64,146,164,163,0,216,143,8,183,47,3,152,7,112,202,178,172,171,93,77,176,70,72,117,74,136,36,73,135,0,156,3,112,48,97,151,31,3,56,105,89,150,213,153,104,107,131,142,8,145,36,233,56,128,179,252,53,66,8,100,89,118,235,182,109,195,52,77,177,235,101,0,227,255,15,164,36,38,68,36,67,150,101,148,203,101,76,76,76,248,218,54,155,77,204,204,204,64,211,52,216,182,205,46,95,6,32,18,50,15,96,222,178,172,249,142,37,31,16,18,17,226,108,147,119,88,61,159,207,99,122,122,58,182,95,189,94,135,170,170,73,228,248,27,218,219,234,92,146,198,131,68,58,97,187,115,172,144,148,140,217,217,89,228,243,249,164,114,236,2,112,86,146,164,95,73,146,36,37,237,52,16,80,74,35,127,132,144,163,132,16,74,8,161,138,162,208,56,24,134,65,21,69,161,172,15,33,132,170,170,74,107,181,26,109,52,26,110,187,70,163,65,107,181,26,85,85,213,211,150,16,114,137,16,34,197,201,53,168,95,20,17,187,9,33,39,8,33,87,153,176,186,174,135,18,209,104,52,104,161,80,240,44,78,150,101,106,24,70,44,137,186,174,211,108,54,203,247,157,255,159,33,132,16,34,17,66,206,9,79,141,102,179,217,192,197,216,182,77,43,149,138,103,65,217,108,150,106,154,22,75,4,15,211,52,69,82,142,175,57,33,132,144,113,66,136,37,146,193,212,94,132,174,235,84,150,101,79,187,66,161,64,109,219,238,136,12,6,195,48,248,177,174,174,41,33,14,25,158,167,92,169,84,92,123,32,18,210,104,52,124,132,153,166,25,185,216,74,165,18,187,133,4,155,114,116,77,8,113,236,133,197,47,142,61,101,38,160,72,72,165,82,113,137,139,179,45,249,124,62,177,22,233,186,206,183,61,119,175,9,97,110,247,28,156,124,68,85,85,204,205,205,33,147,201,36,242,82,178,44,7,6,103,173,86,11,213,106,21,178,44,67,215,117,16,66,64,72,59,229,169,213,106,144,101,25,213,106,213,215,79,24,107,119,114,127,217,31,164,157,160,235,8,0,100,179,89,104,154,214,243,160,179,179,179,158,5,231,243,121,24,134,1,211,52,221,216,196,182,109,84,171,85,28,56,112,0,231,207,159,15,27,234,80,207,194,116,136,52,128,19,172,82,46,151,19,107,70,16,234,245,58,38,39,39,81,40,20,96,219,54,20,69,129,174,235,152,158,158,198,232,232,40,50,153,12,166,167,167,97,24,6,20,69,1,0,52,26,13,228,243,121,76,78,78,162,217,108,138,67,138,89,244,192,145,6,48,206,42,9,195,108,31,154,205,38,138,197,34,84,85,133,97,24,238,117,66,8,178,217,172,175,253,216,216,24,230,230,230,160,105,154,123,223,48,12,200,178,140,98,177,200,55,125,171,43,129,122,64,26,237,176,25,138,162,116,165,29,166,105,66,81,20,212,106,53,0,64,169,84,66,169,84,2,0,232,186,14,69,81,80,173,86,209,106,181,124,125,167,166,166,96,24,6,74,165,146,199,190,112,184,218,177,64,61,34,105,46,19,10,219,182,97,219,54,84,85,133,105,154,46,33,166,105,66,85,85,215,86,40,138,130,217,217,89,95,255,76,38,131,82,169,4,195,48,186,214,208,190,34,42,240,74,226,118,227,194,115,195,48,60,17,168,170,170,145,237,107,181,154,24,20,222,211,88,196,213,16,238,220,162,35,100,179,89,228,114,185,208,251,185,92,206,115,128,196,52,161,88,44,134,110,35,193,211,157,234,74,176,46,177,30,237,131,155,131,166,105,162,213,106,249,236,8,219,219,141,70,3,139,139,139,24,27,27,235,122,178,66,161,0,0,208,52,13,181,90,13,186,174,163,80,40,184,54,135,97,106,106,10,51,51,51,204,64,239,250,198,193,83,244,209,45,95,7,0,164,88,163,20,188,117,161,28,88,79,249,239,167,0,172,0,183,255,179,130,31,188,120,113,207,75,105,180,79,173,0,32,240,156,163,88,44,130,16,130,70,163,1,69,81,80,46,151,3,159,108,18,16,66,80,169,84,92,183,203,236,75,80,128,86,46,151,221,242,251,220,129,26,117,126,172,224,214,225,45,7,214,105,251,199,223,95,1,144,2,134,63,149,198,143,202,143,255,245,185,52,56,149,212,52,205,183,216,92,46,7,211,52,61,79,151,69,159,221,130,185,93,22,139,240,174,154,159,151,105,231,7,183,254,24,190,216,62,18,51,148,198,15,211,206,107,130,159,3,112,189,133,72,74,38,147,241,61,217,128,131,228,190,131,217,158,143,63,185,229,89,44,15,42,20,34,137,16,235,2,49,0,134,153,81,61,1,192,6,224,186,203,128,168,209,125,178,181,90,205,19,80,133,68,153,104,54,155,152,156,156,12,212,128,110,64,133,159,120,61,72,91,16,210,222,51,46,119,33,13,0,206,235,1,119,235,152,166,233,230,34,65,246,98,98,98,2,11,11,11,110,64,197,162,76,102,95,90,173,22,202,229,50,100,89,238,59,25,124,185,27,98,130,198,3,86,181,133,15,204,198,69,33,162,2,42,0,110,0,198,18,54,102,95,100,89,118,93,103,62,159,247,184,221,78,208,104,52,124,43,232,149,152,56,237,225,9,113,79,187,89,56,206,132,42,20,10,152,156,156,68,189,94,247,9,205,18,54,230,58,89,228,202,39,118,204,56,118,130,102,179,233,18,178,99,228,176,119,145,33,139,234,7,49,60,33,238,171,201,209,209,81,204,205,205,65,215,117,143,173,96,1,21,111,47,154,205,38,142,29,59,230,186,78,66,8,52,77,195,220,220,92,100,192,22,135,74,165,226,150,119,147,199,61,130,199,217,138,36,196,248,238,57,88,207,149,47,67,120,95,155,203,229,176,176,176,128,106,181,234,190,133,227,3,42,0,158,24,162,84,42,161,88,44,246,116,132,0,180,143,17,88,146,55,180,110,4,251,182,60,1,138,213,64,139,45,32,197,180,69,8,210,88,91,190,15,127,29,52,184,15,224,213,16,247,53,163,232,49,68,91,33,6,84,124,98,215,43,25,139,139,139,158,23,92,159,219,254,44,54,172,219,228,10,221,233,150,232,212,240,242,132,204,179,66,80,208,21,116,184,147,205,102,161,235,58,102,102,102,48,58,58,26,184,56,222,237,198,189,148,59,115,230,140,155,33,3,192,246,145,195,24,219,58,5,80,154,204,48,246,129,24,247,221,174,36,73,187,1,188,207,22,186,176,176,16,41,124,20,90,173,22,74,165,146,231,108,131,69,183,188,6,49,178,152,209,229,19,204,45,27,247,65,125,228,21,12,173,219,196,229,47,237,82,108,206,34,20,130,242,157,176,62,174,134,56,17,235,91,64,219,179,8,39,87,137,193,14,150,25,25,132,16,148,74,37,31,25,192,42,1,204,51,49,236,223,58,133,9,135,12,128,127,154,212,167,45,16,202,158,122,23,30,201,243,246,223,209,146,75,112,206,50,249,211,175,56,212,235,117,20,10,5,79,236,160,170,42,170,213,106,224,118,106,181,90,190,227,197,44,25,199,254,173,121,108,31,57,12,32,254,105,6,105,76,39,218,194,234,158,254,84,8,230,197,239,64,20,69,129,166,105,129,139,2,218,6,184,80,40,120,34,82,22,229,70,185,93,222,40,127,102,235,20,62,187,237,153,182,70,116,161,230,189,18,195,143,31,248,125,72,208,151,66,178,44,67,81,20,207,126,103,175,22,24,8,33,168,86,171,152,154,154,242,141,201,163,217,108,186,73,34,0,124,243,209,95,99,100,104,39,238,31,73,35,255,252,3,216,56,146,14,92,84,28,238,220,94,193,47,42,255,196,157,91,43,190,197,250,234,33,196,132,126,48,35,73,210,56,218,47,176,118,37,17,38,105,12,210,106,181,92,55,13,180,181,227,243,59,191,7,0,248,206,233,157,216,123,104,99,146,233,66,241,167,250,109,156,125,225,239,93,27,222,208,67,102,203,178,230,45,203,218,13,224,41,180,131,182,72,36,57,130,172,215,235,80,20,197,37,99,243,125,251,112,112,219,51,174,65,235,149,12,0,216,159,27,14,53,188,73,162,215,78,190,49,147,224,127,147,118,28,192,147,172,66,8,113,95,58,201,178,140,76,38,131,197,197,69,152,166,201,31,9,2,0,134,135,118,224,43,123,94,193,200,208,78,247,233,156,254,205,35,137,100,137,195,115,71,222,235,218,190,116,252,89,166,136,32,123,19,135,109,195,135,113,100,215,75,237,24,131,147,238,229,62,18,194,208,41,49,61,191,151,113,62,148,123,24,206,169,91,20,134,55,236,192,23,31,58,137,47,239,225,98,140,4,207,195,52,110,99,249,246,74,124,67,7,193,91,195,31,195,4,109,35,62,185,235,26,78,80,119,92,146,164,19,95,120,240,228,205,155,119,254,12,235,206,187,0,218,91,99,100,195,78,60,68,198,177,249,190,79,123,4,118,19,171,24,82,222,56,253,17,30,251,90,6,95,125,106,115,34,121,248,225,252,9,97,187,68,57,141,225,229,233,11,33,12,150,101,89,207,42,239,225,97,60,177,42,80,128,239,20,215,31,229,94,223,126,115,9,55,174,221,197,197,215,45,28,249,22,193,198,225,85,165,254,224,202,199,120,112,239,80,96,191,248,140,151,2,169,148,47,139,238,121,203,248,5,105,255,185,117,186,170,1,73,207,47,120,232,175,222,0,5,176,124,107,5,243,191,92,245,100,87,46,45,227,167,207,127,24,34,67,244,248,81,219,168,239,132,172,78,234,93,162,120,236,31,229,18,25,254,112,97,9,215,63,188,235,182,185,248,186,229,218,146,11,103,111,226,250,181,187,120,251,205,165,160,201,59,204,120,87,137,25,128,134,240,229,112,109,241,8,20,130,243,175,222,112,251,1,171,90,114,229,210,50,254,242,206,178,167,141,79,134,174,142,2,232,96,52,196,63,97,60,49,34,126,127,97,9,31,93,187,235,235,115,241,117,11,111,188,124,221,157,227,70,136,150,120,2,47,159,60,225,196,244,95,67,34,109,70,180,125,225,193,108,135,56,198,191,150,86,208,124,247,223,220,152,193,90,194,223,15,210,22,94,62,254,122,95,189,140,71,16,103,134,84,42,192,205,58,87,82,206,21,209,237,222,184,118,23,143,77,120,115,162,48,79,196,174,223,184,118,23,91,182,175,119,198,23,231,115,234,140,252,136,51,216,190,19,226,115,115,116,213,245,198,17,115,249,183,183,113,240,75,195,216,178,125,61,212,132,49,135,136,43,151,150,61,178,120,231,115,234,1,196,112,113,74,76,84,212,33,158,206,93,113,7,140,250,28,193,31,54,167,112,255,72,26,79,190,240,0,54,110,74,119,156,250,3,109,163,251,218,139,255,192,178,147,254,119,147,241,246,157,144,111,231,174,208,88,65,98,136,73,222,54,126,252,168,126,190,122,106,64,91,70,156,200,167,186,93,216,151,224,182,94,4,141,31,56,63,188,164,184,117,58,32,163,26,42,168,88,95,3,98,66,101,113,254,15,196,237,186,101,225,199,95,143,235,179,90,239,61,21,72,210,135,97,48,129,89,72,224,21,37,72,92,20,27,68,76,120,219,238,137,25,108,232,30,32,64,220,19,138,139,98,59,73,5,162,136,9,235,115,111,66,247,30,137,233,100,27,1,65,36,250,175,135,145,57,208,192,44,137,17,133,216,38,65,159,65,26,222,129,121,153,64,183,198,9,33,186,68,134,181,38,102,128,231,33,221,217,138,48,117,231,251,133,207,209,187,71,26,76,182,27,48,113,104,125,192,134,151,181,143,147,103,176,94,134,222,123,98,186,49,188,226,216,192,0,189,12,43,196,46,74,172,175,161,71,26,136,134,0,104,121,4,115,10,73,136,225,145,52,226,237,7,49,92,219,165,65,108,153,239,6,10,205,17,35,180,247,183,101,245,16,53,79,66,76,232,189,8,98,62,161,244,251,125,39,228,181,223,237,253,25,128,167,41,208,10,35,166,23,251,2,238,94,36,185,177,54,195,67,204,210,10,165,197,159,24,123,181,255,2,134,1,253,246,81,242,86,147,0,0,0,0,73,69,78,68,174,66,96,130];   

    CreateImageVariationRequest request = {
        image: {
            fileContent: sampleImageContent,
            fileName: "test-image.png"
        },
        model: "dall-e-2",
        n: 1,
        size: "1024x1024",
        response_format: "url"
    };

    // Call the `post images/variations` resource to create a variation of an image
    var response = openaiClient->/images/variations.post(request);
    
    test:assertTrue(response is ImagesResponse, msg = "Response is not of type ImagesResponse");

    return;
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
isolated function testSendImageEditRequest() returns error? {
    // Assuming you have the base64 encoded content of the sample image
    byte[] sampleImageContent = [137,80,78,71,13,10,26,10,0,0,0,13,73,72,68,82,0,0,0,68,0,0,0,68,8,6,0,0,0,56,19,147,178,0,0,0,9,112,72,89,115,0,0,11,18,0,0,11,18,1,210,221,126,252,0,0,11,51,73,68,65,84,120,156,213,90,91,108,28,87,25,254,118,147,152,166,118,246,76,162,168,185,180,222,164,105,20,138,226,73,2,145,160,104,7,197,125,0,129,199,69,17,72,72,222,60,52,21,149,218,93,9,41,162,72,236,182,15,132,151,238,62,80,41,164,146,39,84,208,4,169,94,35,170,74,72,120,146,190,197,133,89,1,21,82,19,143,121,160,164,52,236,170,106,128,38,153,89,39,56,148,212,135,135,157,51,62,115,230,186,183,24,62,107,229,115,102,206,229,63,223,252,231,191,156,153,20,165,20,221,64,146,164,163,0,216,143,8,183,47,3,152,7,112,202,178,172,171,93,77,176,70,72,117,74,136,36,73,135,0,156,3,112,48,97,151,31,3,56,105,89,150,213,153,104,107,131,142,8,145,36,233,56,128,179,252,53,66,8,100,89,118,235,182,109,195,52,77,177,235,101,0,227,255,15,164,36,38,68,36,67,150,101,148,203,101,76,76,76,248,218,54,155,77,204,204,204,64,211,52,216,182,205,46,95,6,32,18,50,15,96,222,178,172,249,142,37,31,16,18,17,226,108,147,119,88,61,159,207,99,122,122,58,182,95,189,94,135,170,170,73,228,248,27,218,219,234,92,146,198,131,68,58,97,187,115,172,144,148,140,217,217,89,228,243,249,164,114,236,2,112,86,146,164,95,73,146,36,37,237,52,16,80,74,35,127,132,144,163,132,16,74,8,161,138,162,208,56,24,134,65,21,69,161,172,15,33,132,170,170,74,107,181,26,109,52,26,110,187,70,163,65,107,181,26,85,85,213,211,150,16,114,137,16,34,197,201,53,168,95,20,17,187,9,33,39,8,33,87,153,176,186,174,135,18,209,104,52,104,161,80,240,44,78,150,101,106,24,70,44,137,186,174,211,108,54,203,247,157,255,159,33,132,16,34,17,66,206,9,79,141,102,179,217,192,197,216,182,77,43,149,138,103,65,217,108,150,106,154,22,75,4,15,211,52,69,82,142,175,57,33,132,144,113,66,136,37,146,193,212,94,132,174,235,84,150,101,79,187,66,161,64,109,219,238,136,12,6,195,48,248,177,174,174,41,33,14,25,158,167,92,169,84,92,123,32,18,210,104,52,124,132,153,166,25,185,216,74,165,18,187,133,4,155,114,116,77,8,113,236,133,197,47,142,61,101,38,160,72,72,165,82,113,137,139,179,45,249,124,62,177,22,233,186,206,183,61,119,175,9,97,110,247,28,156,124,68,85,85,204,205,205,33,147,201,36,242,82,178,44,7,6,103,173,86,11,213,106,21,178,44,67,215,117,16,66,64,72,59,229,169,213,106,144,101,25,213,106,213,215,79,24,107,119,114,127,217,31,164,157,160,235,8,0,100,179,89,104,154,214,243,160,179,179,179,158,5,231,243,121,24,134,1,211,52,221,216,196,182,109,84,171,85,28,56,112,0,231,207,159,15,27,234,80,207,194,116,136,52,128,19,172,82,46,151,19,107,70,16,234,245,58,38,39,39,81,40,20,96,219,54,20,69,129,174,235,152,158,158,198,232,232,40,50,153,12,166,167,167,97,24,6,20,69,1,0,52,26,13,228,243,121,76,78,78,162,217,108,138,67,138,89,244,192,145,6,48,206,42,9,195,108,31,154,205,38,138,197,34,84,85,133,97,24,238,117,66,8,178,217,172,175,253,216,216,24,230,230,230,160,105,154,123,223,48,12,200,178,140,98,177,200,55,125,171,43,129,122,64,26,237,176,25,138,162,116,165,29,166,105,66,81,20,212,106,53,0,64,169,84,66,169,84,2,0,232,186,14,69,81,80,173,86,209,106,181,124,125,167,166,166,96,24,6,74,165,146,199,190,112,184,218,177,64,61,34,105,46,19,10,219,182,97,219,54,84,85,133,105,154,46,33,166,105,66,85,85,215,86,40,138,130,217,217,89,95,255,76,38,131,82,169,4,195,48,186,214,208,190,34,42,240,74,226,118,227,194,115,195,48,60,17,168,170,170,145,237,107,181,154,24,20,222,211,88,196,213,16,238,220,162,35,100,179,89,228,114,185,208,251,185,92,206,115,128,196,52,161,88,44,134,110,35,193,211,157,234,74,176,46,177,30,237,131,155,131,166,105,162,213,106,249,236,8,219,219,141,70,3,139,139,139,24,27,27,235,122,178,66,161,0,0,208,52,13,181,90,13,186,174,163,80,40,184,54,135,97,106,106,10,51,51,51,204,64,239,250,198,193,83,244,209,45,95,7,0,164,88,163,20,188,117,161,28,88,79,249,239,167,0,172,0,183,255,179,130,31,188,120,113,207,75,105,180,79,173,0,32,240,156,163,88,44,130,16,130,70,163,1,69,81,80,46,151,3,159,108,18,16,66,80,169,84,92,183,203,236,75,80,128,86,46,151,221,242,251,220,129,26,117,126,172,224,214,225,45,7,214,105,251,199,223,95,1,144,2,134,63,149,198,143,202,143,255,245,185,52,56,149,212,52,205,183,216,92,46,7,211,52,61,79,151,69,159,221,130,185,93,22,139,240,174,154,159,151,105,231,7,183,254,24,190,216,62,18,51,148,198,15,211,206,107,130,159,3,112,189,133,72,74,38,147,241,61,217,128,131,228,190,131,217,158,143,63,185,229,89,44,15,42,20,34,137,16,235,2,49,0,134,153,81,61,1,192,6,224,186,203,128,168,209,125,178,181,90,205,19,80,133,68,153,104,54,155,152,156,156,12,212,128,110,64,133,159,120,61,72,91,16,210,222,51,46,119,33,13,0,206,235,1,119,235,152,166,233,230,34,65,246,98,98,98,2,11,11,11,110,64,197,162,76,102,95,90,173,22,202,229,50,100,89,238,59,25,124,185,27,98,130,198,3,86,181,133,15,204,198,69,33,162,2,42,0,110,0,198,18,54,102,95,100,89,118,93,103,62,159,247,184,221,78,208,104,52,124,43,232,149,152,56,237,225,9,113,79,187,89,56,206,132,42,20,10,152,156,156,68,189,94,247,9,205,18,54,230,58,89,228,202,39,118,204,56,118,130,102,179,233,18,178,99,228,176,119,145,33,139,234,7,49,60,33,238,171,201,209,209,81,204,205,205,65,215,117,143,173,96,1,21,111,47,154,205,38,142,29,59,230,186,78,66,8,52,77,195,220,220,92,100,192,22,135,74,165,226,150,119,147,199,61,130,199,217,138,36,196,248,238,57,88,207,149,47,67,120,95,155,203,229,176,176,176,128,106,181,234,190,133,227,3,42,0,158,24,162,84,42,161,88,44,246,116,132,0,180,143,17,88,146,55,180,110,4,251,182,60,1,138,213,64,139,45,32,197,180,69,8,210,88,91,190,15,127,29,52,184,15,224,213,16,247,53,163,232,49,68,91,33,6,84,124,98,215,43,25,139,139,139,158,23,92,159,219,254,44,54,172,219,228,10,221,233,150,232,212,240,242,132,204,179,66,80,208,21,116,184,147,205,102,161,235,58,102,102,102,48,58,58,26,184,56,222,237,198,189,148,59,115,230,140,155,33,3,192,246,145,195,24,219,58,5,80,154,204,48,246,129,24,247,221,174,36,73,187,1,188,207,22,186,176,176,16,41,124,20,90,173,22,74,165,146,231,108,131,69,183,188,6,49,178,152,209,229,19,204,45,27,247,65,125,228,21,12,173,219,196,229,47,237,82,108,206,34,20,130,242,157,176,62,174,134,56,17,235,91,64,219,179,8,39,87,137,193,14,150,25,25,132,16,148,74,37,31,25,192,42,1,204,51,49,236,223,58,133,9,135,12,128,127,154,212,167,45,16,202,158,122,23,30,201,243,246,223,209,146,75,112,206,50,249,211,175,56,212,235,117,20,10,5,79,236,160,170,42,170,213,106,224,118,106,181,90,190,227,197,44,25,199,254,173,121,108,31,57,12,32,254,105,6,105,76,39,218,194,234,158,254,84,8,230,197,239,64,20,69,129,166,105,129,139,2,218,6,184,80,40,120,34,82,22,229,70,185,93,222,40,127,102,235,20,62,187,237,153,182,70,116,161,230,189,18,195,143,31,248,125,72,208,151,66,178,44,67,81,20,207,126,103,175,22,24,8,33,168,86,171,152,154,154,242,141,201,163,217,108,186,73,34,0,124,243,209,95,99,100,104,39,238,31,73,35,255,252,3,216,56,146,14,92,84,28,238,220,94,193,47,42,255,196,157,91,43,190,197,250,234,33,196,132,126,48,35,73,210,56,218,47,176,118,37,17,38,105,12,210,106,181,92,55,13,180,181,227,243,59,191,7,0,248,206,233,157,216,123,104,99,146,233,66,241,167,250,109,156,125,225,239,93,27,222,208,67,102,203,178,230,45,203,218,13,224,41,180,131,182,72,36,57,130,172,215,235,80,20,197,37,99,243,125,251,112,112,219,51,174,65,235,149,12,0,216,159,27,14,53,188,73,162,215,78,190,49,147,224,127,147,118,28,192,147,172,66,8,113,95,58,201,178,140,76,38,131,197,197,69,152,166,201,31,9,2,0,134,135,118,224,43,123,94,193,200,208,78,247,233,156,254,205,35,137,100,137,195,115,71,222,235,218,190,116,252,89,166,136,32,123,19,135,109,195,135,113,100,215,75,237,24,131,147,238,229,62,18,194,208,41,49,61,191,151,113,62,148,123,24,206,169,91,20,134,55,236,192,23,31,58,137,47,239,225,98,140,4,207,195,52,110,99,249,246,74,124,67,7,193,91,195,31,195,4,109,35,62,185,235,26,78,80,119,92,146,164,19,95,120,240,228,205,155,119,254,12,235,206,187,0,218,91,99,100,195,78,60,68,198,177,249,190,79,123,4,118,19,171,24,82,222,56,253,17,30,251,90,6,95,125,106,115,34,121,248,225,252,9,97,187,68,57,141,225,229,233,11,33,12,150,101,89,207,42,239,225,97,60,177,42,80,128,239,20,215,31,229,94,223,126,115,9,55,174,221,197,197,215,45,28,249,22,193,198,225,85,165,254,224,202,199,120,112,239,80,96,191,248,140,151,2,169,148,47,139,238,121,203,248,5,105,255,185,117,186,170,1,73,207,47,120,232,175,222,0,5,176,124,107,5,243,191,92,245,100,87,46,45,227,167,207,127,24,34,67,244,248,81,219,168,239,132,172,78,234,93,162,120,236,31,229,18,25,254,112,97,9,215,63,188,235,182,185,248,186,229,218,146,11,103,111,226,250,181,187,120,251,205,165,160,201,59,204,120,87,137,25,128,134,240,229,112,109,241,8,20,130,243,175,222,112,251,1,171,90,114,229,210,50,254,242,206,178,167,141,79,134,174,142,2,232,96,52,196,63,97,60,49,34,126,127,97,9,31,93,187,235,235,115,241,117,11,111,188,124,221,157,227,70,136,150,120,2,47,159,60,225,196,244,95,67,34,109,70,180,125,225,193,108,135,56,198,191,150,86,208,124,247,223,220,152,193,90,194,223,15,210,22,94,62,254,122,95,189,140,71,16,103,134,84,42,192,205,58,87,82,206,21,209,237,222,184,118,23,143,77,120,115,162,48,79,196,174,223,184,118,23,91,182,175,119,198,23,231,115,234,140,252,136,51,216,190,19,226,115,115,116,213,245,198,17,115,249,183,183,113,240,75,195,216,178,125,61,212,132,49,135,136,43,151,150,61,178,120,231,115,234,1,196,112,113,74,76,84,212,33,158,206,93,113,7,140,250,28,193,31,54,167,112,255,72,26,79,190,240,0,54,110,74,119,156,250,3,109,163,251,218,139,255,192,178,147,254,119,147,241,246,157,144,111,231,174,208,88,65,98,136,73,222,54,126,252,168,126,190,122,106,64,91,70,156,200,167,186,93,216,151,224,182,94,4,141,31,56,63,188,164,184,117,58,32,163,26,42,168,88,95,3,98,66,101,113,254,15,196,237,186,101,225,199,95,143,235,179,90,239,61,21,72,210,135,97,48,129,89,72,224,21,37,72,92,20,27,68,76,120,219,238,137,25,108,232,30,32,64,220,19,138,139,98,59,73,5,162,136,9,235,115,111,66,247,30,137,233,100,27,1,65,36,250,175,135,145,57,208,192,44,137,17,133,216,38,65,159,65,26,222,129,121,153,64,183,198,9,33,186,68,134,181,38,102,128,231,33,221,217,138,48,117,231,251,133,207,209,187,71,26,76,182,27,48,113,104,125,192,134,151,181,143,147,103,176,94,134,222,123,98,186,49,188,226,216,192,0,189,12,43,196,46,74,172,175,161,71,26,136,134,0,104,121,4,115,10,73,136,225,145,52,226,237,7,49,92,219,165,65,108,153,239,6,10,205,17,35,180,247,183,101,245,16,53,79,66,76,232,189,8,98,62,161,244,251,125,39,228,181,223,237,253,25,128,167,41,208,10,35,166,23,251,2,238,94,36,185,177,54,195,67,204,210,10,165,197,159,24,123,181,255,2,134,1,253,246,81,242,86,147,0,0,0,0,73,69,78,68,174,66,96,130];   
    
    CreateImageEditRequest request = {
        image: {
            fileContent: sampleImageContent,
            fileName: "icon.png"
        },
        prompt: "Provide a description of the desired edits here.",
        model: "dall-e-2",
        n: 1,
        size: "1024x1024",
        response_format: "url"
    };

    // Call the `post images/edits` resource to create an edited image
    var response = openaiClient->/images/edits.post(request);
   
    test:assertTrue(response is ImagesResponse, msg = "Response is not of type ImagesResponse");
    
    return;

}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
isolated function testSendImageGenerateRequest() returns error? {

    CreateImageRequest request = {
        prompt: "a cute baby sea otter",
        model: "dall-e-3",
        n: 1,
        response_format: "url"
    };

    // Call the `post images/generations` resource to create an image
    var response = openaiClient->/images/generations.post(request);

    test:assertTrue(response is ImagesResponse, msg = "Response is not of type ImagesResponse");
    
    return;
}