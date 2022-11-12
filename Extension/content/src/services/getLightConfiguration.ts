export const getLightConfiguration = () => {
  const request = {
    subject: "getLightConfiguration",
  };
  return browser.runtime
    .sendMessage("io.magic.light.Light-Safari-Extension (4Z47XRX22C)", request)
    .then(response => {
      return response;
    });
};
