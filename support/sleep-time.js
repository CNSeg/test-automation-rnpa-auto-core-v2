/**
 *
 * @param {number} seconds
 * @returns sleep in seconds
 */
async function sleepTime(seconds) {
  const ms = seconds * 1000;
  return new Promise((resolve) => setTimeout(resolve, ms));
}

module.exports = sleepTime;
