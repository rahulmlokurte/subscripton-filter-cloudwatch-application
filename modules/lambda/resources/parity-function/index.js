exports.handler = function (input, context) {
    console.log("Input received: " + JSON.stringify(input));

    function isOdd(input) {
        return input % 2 !== 0;
    }

    const result = isOdd(input);
    if (result === true) {
        const response = `Input number ${input} is odd`;
        console.log(response);
    } else {
        const response = `Input number ${input} is even`;
        console.log(response);
    }
};