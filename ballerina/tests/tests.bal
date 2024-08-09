configurable boolean isLiveServer = ?;
configurable string apiKey = ?;
configurable string RuntimeApiKey = isLiveServer ? apiKey : "test";
configurable string serviceUrl = isLiveServer ? "https://api.openai.com/v1" : "http://localhost:9090";

ConnectionConfig config = {auth: {
    token:RuntimeApiKey}
    };
final Client openaiClient = check new(config,serviceUrl);