const accessTokenHeader = () => ({
  "Content-Type": "application/x-www-form-urlencoded",
  "Authorization": `Basic ${process.env.AUTHORIZATION_TOKEN}`
});

module.exports = accessTokenHeader;
