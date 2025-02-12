const { setDefaultTimeout } = require("@cucumber/cucumber");

setDefaultTimeout(process.env.DEFAULT_TIMEOUT_MILLISECONDS);
