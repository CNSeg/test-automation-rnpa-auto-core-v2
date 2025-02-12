require("dotenv").config({
  path: `envs/.env.${process.env.NODE_ENV}`,
});

module.exports = {
  default: `--format-options '{"snippetInterface": "synchronous"}' --format json:report/cucumber_report.json --publish-quiet`,
};