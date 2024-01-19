iron_cache_node
===============


Node.js Implementation of IronCache 
<b>Usage<b>
To utilize the IronCache API with this Node.js module, follow these steps:

Create an Iron project.
In your dashboard, click the credentials link (the key icon) to find your Project ID and Token. These credentials are necessary for API usage.
Initialize the module using your Project ID and Token.
Specify environment variables to your application (IRON_CACHE_PROJECT and IRON_CACHE_TOKEN).

API Reference
APIClient(options)
Constructor for creating an instance of the APIClient. It requires the following options:

project_id: Your Iron Cache project ID.
token: Your Iron Cache authentication token.
api_version: (Optional) The version of the Iron Cache API to use. Defaults to 1.

'''
export IRON_PROJECT_ID=xxx
export IRON_TOKEN=yyy
'''


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

Delete a specific cache identified by cache_name. This operation permanently removes the cache and all its associated items.
```
client.deleteCache('example_cache', {}, (error, response) => {
  if (error) {
    console.error('Error:', error);
  } else {
    console.log('Cache deleted:', response);
  }
});
```

Clear all items in a specific cache identified by cache_name. The cache structure remains intact, but all stored items are removed.
```
client.clearCache('example_cache', {}, (error, response) => {
  if (error) {
    console.error('Error:', error);
  } else {
    console.log('Cache cleared:', response);
  }
});
```

Put an item into a specific cache identified by cache_name. The key parameter represents the unique identifier for the item.

```
const key = 'example_key';
const value = 'example_value';

client.putItem(key, 'example_cache', { value }, (error, response) => {
  if (error) {
    console.error('Error:', error);
  } else {
    console.log('Item added:', response);
  }
});
```
Increment the value of a numeric item in a specific cache. This is useful for managing counters or other numeric data.


```
const key = 'example_key';

client.IncrementItem(key, 'example_cache', {}, (error, response) => {
  if (error) {
    console.error('Error:', error);
  } else {
    console.log('Item incremented:', response);
  }
});
```

Get information about a specific item identified by key in a cache identified by cache_name.

```
const key = 'example_key';

client.getItem(key, 'example_cache', {}, (error, response) => {
  if (error) {
    console.error('Error:', error);
  } else {
    console.log('Item information:', response);
  }
});
```

Delete a specific item identified by key from a cache identified by cache_name.

```
const key = 'example_key';

client.deleteItem(key, 'example_cache', {}, (error, response) => {
  if (error) {
    console.error('Error:', error);
  } else {
    console.log('Item deleted:', response);
  }
});
```






