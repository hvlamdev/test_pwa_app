importScripts("https://www.gstatic.com/firebasejs/9.10.0/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/9.10.0/firebase-messaging-compat.js");

// Initialize the Firebase app in the service worker by passing in
// your app's Firebase config object.
// https://firebase.google.com/docs/web/setup#config-object
firebase.initializeApp({
  apiKey: 'AIzaSyD2DcWvX9mT1RLecqMBlzXN9VpmZuk91Gs',
  authDomain: 'pwatesting-29f3c.firebaseapp.com',
  databaseURL: 'https://pwatesting-29f3c.firebaseio.com',
  projectId: 'pwatesting-29f3c',
  storageBucket: 'pwatesting-29f3c.appspot.com',
  messagingSenderId: '661701596572',
  appId: '1:661701596572:web:1f60660d790175e1fd6459',
});

const messaging = firebase.messaging();
messaging.onBackgroundMessage(function(payload) {
  console.log('[firebase-messaging-sw.js] Received background message ', payload);
  // Customize notification here
  const notificationTitle = 'Background Message Title';
  const notificationOptions = {
    body: 'Background Message body.',
    icon: '/firebase-logo.png'
  };

  self.registration.showNotification(notificationTitle,
    notificationOptions);
});
