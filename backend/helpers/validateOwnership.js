const ExpressError = require("./expressError");
const validateOwnership = (objectOwnershipProp, req) => {
  if (objectOwnershipProp !== req.username)
    throw new ExpressError("Unauthorized", 403);
};

module.exports = { validateOwnership };
