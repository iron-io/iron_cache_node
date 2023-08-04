var iron_cache = require('iron_cache');
var client = new iron_cache.Client();
client.cachesList({}, function(error, body) {
  console.log(body)
});
client.deleteCache(projectId, cache_name, {}, function(error, body) {
 if (error) {
  console.error("An error occurred:", error);
 } else {
  console.log(body);
 }
});

