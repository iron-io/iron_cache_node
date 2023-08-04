var iron_cache = require('iron_cache');
var client = new iron_cache.Client();
client.cachesList({}, function(error, body) {
  console.log(error,body)
});


client.getCache("testcache2", {}, function(error, cache) {
  if (error) {
    console.error('Error:', error);
  } else {
    console.log('Cache Information:', cache);
  }
});
