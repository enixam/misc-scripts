# the core package
npm i -g firebase

# to prevent login issues for hosting
npm i -g firebase-tools@8.15.0

# when logging in behind a proxy
firebase login --no-localhost

# for authentication problems, see https://github.com/firebase/firebase-tools/issues/155
# current proxy setting:
self.proxy = "http://127.0.0.1:3213"