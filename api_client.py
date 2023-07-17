class IronCacheClient {
    constructor(token, projectId, host='cache-aws-us-east-1') {
        this.token = token;
        this.projectId = projectId;
        this.host = host;
        this.baseURL = `https://${this.host}.iron.io/1/`;
    }

    async makeRequest(method, endpoint, body = null) {
        const url = `${this.baseURL}${endpoint}`;
        const options = {
            method,
            headers: {
                'Authorization': `OAuth ${this.token}`,
                'Content-Type': 'application/json'
            }
        };

        if (body) {
            options.body = JSON.stringify(body);
        }

        const response = await fetch(url, options);

        if (!response.ok) {
            throw new Error(`HTTP Error: ${response.status}`);
        }

        return await response.json();
    }

    listCaches(page = 0) {
        return this.makeRequest('GET', `projects/${this.projectId}/caches?page=${page}`);
    }

    getCacheInfo(cacheName) {
        return this.makeRequest('GET', `projects/${this.projectId}/caches/${cacheName}`);
    }

    deleteCache(cacheName) {
        return this.makeRequest('DELETE', `projects/${this.projectId}/caches/${cacheName}`);
    }

    clearCache(cacheName) {
        return this.makeRequest('POST', `projects/${this.projectId}/caches/${cacheName}/clear`);
    }

    putItemIntoCache(cacheName, key, value, expiresIn = 86400, replace = true) {
        const body = {
            value,
            expiresIn,
            replace
        };

        return this.makeRequest('PUT', `projects/${this.projectId}/caches/${cacheName}/items/${key}`, body);
    }

    incrementItemValue(cacheName, key, amount) {
        const body = {
            amount
        };

        return this.makeRequest('POST', `projects/${this.projectId}/caches/${cacheName}/items/${key}/increment`, body);
    }

    getItemFromCache(cacheName, key) {
        return this.makeRequest('GET', `projects/${this.projectId}/caches/${cacheName}/items/${key}`);
    }

    deleteItemFromCache(cacheName, key) {
        return this.makeRequest('DELETE', `projects/${this.projectId}/caches/${cacheName}/items/${key}`);
    }
}
