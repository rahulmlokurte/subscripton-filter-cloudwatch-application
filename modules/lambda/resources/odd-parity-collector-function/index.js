const zlib = require('zlib');
exports.handler = function(input, context) {
    const payload = Buffer.from(input.awslogs.data, 'base64');
    zlib.gunzip(payload, function(e, result) {
        if (e) {
            context.fail(e);
        } else {
            result = JSON.parse(result.toString());
            console.log("Collected logs from parity-function:", JSON.stringify(result, null, 2));
            context.succeed();
        }
    });
};