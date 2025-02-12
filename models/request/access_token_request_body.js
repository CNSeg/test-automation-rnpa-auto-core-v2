const reqBody = () => ({
    "grant_type": "password",
    "username": process.env.USERNAME_TOKEN,
    "password": process.env.PASSWORD_TOKEN
})

module.exports = reqBody;