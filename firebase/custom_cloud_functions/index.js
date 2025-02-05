const admin = require("firebase-admin/app");
admin.initializeApp();

const deleteOldStories = require("./delete_old_stories.js");
exports.deleteOldStories = deleteOldStories.deleteOldStories;
