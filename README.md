iron_cache_node
===============

iron-cache-node API Client
This is a Node.js library for interacting with the Iron Cache service. It provides a convenient way to manage caches, manipulate items, and perform various cache-related operations.

Installation
Ensure you have Node.js and npm installed. You can then install the library using the following:

```bash
npm install iron-cache-node
```

Usage
```
const { APIClient } = require('iron-cache-node');
// Initialize the client with your project credentials
const client = new APIClient({
  project_id: 'your_project_id',
  token: 'your_token',
  api_version: 1, // optional, defaults to 1
});
```


Example: List all caches

```
client.cachesList({}, (error, response) => {
  if (error) {
    console.error('Error:', error);
  } else {
    console.log('Caches:', response);
  }
});
```

 Example: Get information about a specific cache
 ```
const cacheName = 'example_cache';
client.getCache(cacheName, {}, (error, response) => {
  if (error) {
    console.error('Error:', error);
  } else {
    console.log('Cache Info:', response);
  }
});
```

Other available methods: deleteCache, clearCache, putItem, IncrementItem, getItem, deleteItem, etc.
API Reference
APIClient(options)
Constructor for creating an instance of the APIClient. It requires the following options:

project_id: Your Iron Cache project ID.
token: Your Iron Cache authentication token.
api_version: (Optional) The version of the Iron Cache API to use. Defaults to 1.
Methods
cachesList(options, callback)
List all caches within the project.

getCache(cache_name, options, callback)
Get information about a specific cache.

deleteCache(cache_name, options, callback)
Delete a specific cache.

clearCache(cache_name, options, callback)
Clear all items in a specific cache.

putItem(key, cache_name, options, callback)
Put an item into a specific cache.

IncrementItem(key, cache_name, options, callback)
Increment the value of a numeric item in a specific cache.

getItem(key, cache_name, options, callback)
Get information about a specific item in a cache.

deleteItem(key, cache_name, options, callback)
Delete a specific item from a cache.


