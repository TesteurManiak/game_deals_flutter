'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "0bc7e8d9e84d35670e89bbdbabaa2ec3",
"main.dart.js": "c32beed01481fc1f19c747ab6d883cf8",
"styles.css": "f3099ba85555557120c51ce9d96a477d",
"index.html": "dc572c93e3026a03119a9896860e1fa5",
"/": "dc572c93e3026a03119a9896860e1fa5",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/AssetManifest.json": "45f97eba173588dc931db696fdac505c",
"assets/NOTICES": "1ae4bee041dd8a5838a92dabdf3d87e7",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/assets/img/stores/icons/20.png": "be9759ab16987f3c67d2cfc5cb7ffe09",
"assets/assets/img/stores/icons/2.png": "519f15853704e15d909f3acfe1775c4c",
"assets/assets/img/stores/icons/11.png": "6428ae58d1eff45a482d6acb991991b2",
"assets/assets/img/stores/icons/15.png": "8698c711ee06c9f6663dbdd64484d3b1",
"assets/assets/img/stores/icons/24.png": "557acc4275f9452204f99b52618539a7",
"assets/assets/img/stores/icons/26.png": "ee7767609f4599011fb484aa6d476114",
"assets/assets/img/stores/icons/7.png": "d0c11e3c2df71c2d7ca958b6cf6e8718",
"assets/assets/img/stores/icons/14.png": "d20479c4076b50d1e01644e2b3d7a91d",
"assets/assets/img/stores/icons/29.png": "ac65246af3f139075a2d829e8a407c08",
"assets/assets/img/stores/icons/9.png": "ca794618de0245b8401d0cbc0f5c28ef",
"assets/assets/img/stores/icons/17.png": "1da3cafbefa3c67207b9aef07c4bf972",
"assets/assets/img/stores/icons/8.png": "6d0ab32b877a113305aef05d1dcbe5ba",
"assets/assets/img/stores/icons/28.png": "3c2ead676b2151f2ddca083e204b941b",
"assets/assets/img/stores/icons/4.png": "f423949bdd6981acc112b13406ff5649",
"assets/assets/img/stores/icons/27.png": "9c2dc5f164328a79af591fb1a2680eb7",
"assets/assets/img/stores/icons/5.png": "994e04b3f3f54ce4710e67ee9c858bec",
"assets/assets/img/stores/icons/30.png": "e5bfb42ef5c7121e69034fc335dd4203",
"assets/assets/img/stores/icons/21.png": "568dd8061bd58b0b97eb8efadbd89a09",
"assets/assets/img/stores/icons/1.png": "46b38ec776c95307ffa77cee5f990d9f",
"assets/assets/img/stores/icons/6.png": "98cd6299fdee5455c1544c6083e73c78",
"assets/assets/img/stores/icons/12.png": "502cb40454da1d972776a4641d8a687d",
"assets/assets/img/stores/icons/0.png": "240f77f5e68243f7d3fd44dbb77287cd",
"assets/assets/img/stores/icons/16.png": "bea45d5ea77be9b5427fc70ced488b33",
"assets/assets/img/stores/icons/23.png": "cdabc1c8b7cedd2a84f48ea3835571f7",
"assets/assets/img/stores/icons/3.png": "f558044b2a286791f159425d4af5cc06",
"assets/assets/img/stores/icons/22.png": "bec2952a70b2cea2687e18a446c4d1f9",
"assets/assets/img/stores/icons/10.png": "59892de865dea9f95f8139d6a4c8436b",
"assets/assets/img/stores/icons/31.png": "b1dc1dbf1076ecd98afb7c421c550df0",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"manifest.json": "62c77adeb99b38a02357947ac9317553",
"favicon.png": "5dcef449791fa27946b3d35ad8803796"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
