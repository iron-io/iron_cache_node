const fetch = require('node-fetch');

class IronCacheClient {
  constructor(oauthToken, projectId, host = 'cache-aws-us-east-1') {
    this.oauthToken = oauthToken;
    this.projectId = projectId;
    this.baseURL = `https://${host}.iron.io/1/projects/${projectId}/caches`;
  }

  async makeRequest(url, method = 'GET', data = null) {
    const headers = {
      'Authorization': `OAuth ${this.oauthToken}`,
      'Content-Type': 'application/json'
    };

    const options = {
      method,
      headers,
      body: JSON.stringify(data)
    };

    const response = await fetch(url, options);
    if (!response.ok) {
      const error = await response.json();
      throw new Error(error.msg);
    }

    return response.json();
  }

  listCaches(page = 0) {
    const url = `${this.baseURL}?page=${page}`;
    return this.makeRequest(url);
  }

  getCacheInfo(cacheName) {
    const url = `${this.baseURL}/${cacheName}`;
    return this.makeRequest(url);
  }

  deleteCache(cacheName) {
    const url = `${this.baseURL}/${cacheName}`;
    return this.makeRequest(url, 'DELETE');
  }

  clearCache(cacheName) {
    const url = `${this.baseURL}/${cacheName}/clear`;
    return this.makeRequest(url, 'POST');
  }

  putItem(cacheName, key, value, expiresIn = null, replace = false, add = false, cas = null) {
    const url = `${this.baseURL}/${cacheName}/items/${key}`;
    const item = { value };

    if (expiresIn) item.expires_in = expiresIn;
    if (replace) item.replace = true;
    if (add) item.add = true;
    if (cas) item.cas = cas;

    return this.makeRequest(url, 'PUT', item);
  }

  incrementItem(cacheName, key, amount) {
    const url = `${this.baseURL}/${cacheName}/items/${key}/increment`;
    const data = { amount };
    return this.makeRequest(url, 'POST', data);
  }

  getItem(cacheName, key) {
    const url = `${this.baseURL}/${cacheName}/items/${key}`;
    return this.makeRequest(url);
  }

  deleteItem(cacheName, key) {
    const url = `${this.baseURL}/${cacheName}/items/${key}`;
    return this.makeRequest(url, 'DELETE');
  }
}

// Initialize the client
const client = new IronCacheClient('YOUR_OAUTH_TOKEN', 'YOUR_PROJECT_ID');

// List all caches
client.listCaches()
  .then(caches => console.log(caches))
  .catch(error => console.error(error));

// Get information about a specific cache
client.getCacheInfo('cache_name')
  .then(cacheInfo => console.log(cacheInfo))
  .catch(error => console.error(error));

// Delete a cache
client.deleteCache('cache_name')
  .then(response => console.log(response))
  .catch(error => console.error(error));

// Clear a cache
client.clearCache('cache_name')
  .then(response => console.log(response))
  .catch(error => console.error(error));

// Put an item into a cache
client.putItem('cache_name', 'item_key', 'item_value', 86400, true)
  .then(response => console.log(response))
  .catch(error => console.error(error));

// Increment an item's value
client.incrementItem('cache_name', 'item_key', 10)
  .then(response => console.log(response))
  .catch(error => console.error(error));

// Get an item from a cache
client.getItem('cache_name', 'item_key')
  .then(item => console.log(item))
  .catch(error => console.error(error));

// Delete an item from a cache
client.deleteItem('cache_name', 'item_key')
  .then(response => console.log(response))
  .catch(error => console.error(error));
